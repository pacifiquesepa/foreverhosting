import axios from 'axios';

const configuredApiBase = import.meta.env.VITE_API_BASE_URL || import.meta.env.VITE_API_URL || 'http://localhost:4000';
const normalizedApiBase = configuredApiBase.replace(/\/+$/, '');
export const API_BASE_URL = /\/api$/i.test(normalizedApiBase) ? normalizedApiBase : `${normalizedApiBase}/api`;
export const API_ORIGIN = API_BASE_URL.replace(/\/api$/i, '');

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: { 'Content-Type': 'application/json' },
});

api.interceptors.request.use((config) => {
  const token = localStorage.getItem('fkams_token');
  if (token) config.headers.Authorization = `Bearer ${token}`;
  return config;
});

api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401 && !error.config?.url?.includes('/auth/')) {
      localStorage.removeItem('fkams_token');
      localStorage.removeItem('fkams_user');
    }
    return Promise.reject(error);
  },
);

export default api;
