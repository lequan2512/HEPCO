import axiosInstance from '../utils/axios';
import { apiContractError } from './apiErrors';

export const login = async (credentials) => {
  const username = (credentials?.username || '').trim().toLowerCase();
  const password = credentials?.password || '';
  const response = await axiosInstance.post('/api/login', { username, password }, { timeout: 3500 });
  if (
    response?.data?.success === true &&
    typeof response.data.token === 'string' &&
    /^[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+\.[A-Za-z0-9_-]+$/.test(response.data.token) &&
    Number.isSafeInteger(response.data.user?.id) &&
    response.data.user.id >= 1
  ) {
    return response.data;
  }
  throw apiContractError('INVALID_LOGIN_RESPONSE', 'Phản hồi đăng nhập không hợp lệ');
};

export const getSession = async () => {
  const response = await axiosInstance.get('/api/session', { timeout: 3500 });
  if (
    response?.data?.success === true &&
    Number.isSafeInteger(response.data.user?.id) &&
    response.data.user.id >= 1 &&
    typeof response.data.canManageContent === 'boolean'
  ) {
    return response.data;
  }
  throw apiContractError('INVALID_SESSION_RESPONSE', 'Không thể xác thực phiên đăng nhập');
};
