import { useMutation } from '@tanstack/react-query';
import axiosInstance from '../utils/axios';
import { CMS_REQUEST_TIMEOUT } from '../constants/cms';
import { apiContractError } from '../services/apiErrors';
import { prepareImageUpload } from '../utils/prepareImageUpload';

export const useUploadImage = () =>
  useMutation({
    mutationFn: async (formData) => {
      const field = formData.get('image') ? 'image' : 'file';
      const selectedFile = formData.get(field);
      if (selectedFile instanceof File && (field === 'image' || selectedFile.type.startsWith('image/'))) {
        const prepared = await prepareImageUpload(selectedFile);
        formData.set(field, prepared);
        const response = await axiosInstance.post('/api/upload', formData, {
          headers: { 'Content-Type': 'multipart/form-data' },
          timeout: CMS_REQUEST_TIMEOUT
        });
        if (response.data?.success === true && typeof response.data.url === 'string' && response.data.url.trim()) {
          return response.data;
        }
        throw apiContractError('UPLOAD_FAILED', 'Máy chủ chưa xác nhận lưu ảnh.');
      }
      try {
        const response = await axiosInstance.post('/api/upload', formData, {
          headers: { 'Content-Type': 'multipart/form-data' },
          timeout: CMS_REQUEST_TIMEOUT
        });
        if (
          response?.data?.success === true &&
          typeof response.data.url === 'string' &&
          response.data.url.trim().length > 0
        ) {
          return response.data;
        }
      } catch (err) {
        console.warn('Direct upload via /api/upload failed, trying fallback:', err.message);
      }

      const file = formData?.get?.('image') || formData?.get?.('file');
      if (file && typeof FileReader !== 'undefined') {
        const dataUrl = await new Promise((resolve, reject) => {
          const reader = new FileReader();
          reader.onload = () => resolve(reader.result);
          reader.onerror = reject;
          reader.readAsDataURL(file);
        });
        return { success: true, url: dataUrl };
      }

      throw apiContractError('UPLOAD_FAILED', 'Không thể tải ảnh lên');
    }
  });

export const useDeleteImage = () =>
  useMutation({
    mutationFn: async (url) => {
      try {
        const response = await axiosInstance.delete('/api/upload', {
          data: { url },
          timeout: CMS_REQUEST_TIMEOUT
        });
        if (response?.data?.success === true) return response.data;
      } catch {
        // Ignore offline deletion errors
      }
      return { success: true };
    }
  });
