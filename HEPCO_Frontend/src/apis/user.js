import { useQuery, useMutation, useQueryClient } from '@tanstack/react-query';
import axiosInstance from '../utils/axios';

export const useGetUsers = (params) => {
  return useQuery({
    queryKey: ['admin-users', params],
    queryFn: async () => {
      try {
        const res = await axiosInstance.get('/api/users', { params });
        return res.data;
      } catch {
        // Fallback for mock/local offline
        return {
          data: [
            { id: 1, username: 'admin', role: 'super_admin', created_at: new Date().toISOString() },
            { id: 2, username: 'hepco', role: 'admin', created_at: new Date().toISOString() }
          ],
          meta: { total: 2, page: 1, limit: 20, totalPages: 1 }
        };
      }
    }
  });
};

export const useCreateUser = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (payload) => {
      const res = await axiosInstance.post('/api/users', payload);
      return res.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin-users'] });
    }
  });
};

export const useUpdateUser = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async ({ id, ...payload }) => {
      const res = await axiosInstance.put(`/api/users/${id}`, payload);
      return res.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin-users'] });
    }
  });
};

export const useDeleteUser = () => {
  const queryClient = useQueryClient();
  return useMutation({
    mutationFn: async (id) => {
      const res = await axiosInstance.delete(`/api/users/${id}`);
      return res.data;
    },
    onSuccess: () => {
      queryClient.invalidateQueries({ queryKey: ['admin-users'] });
    }
  });
};
