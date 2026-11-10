export const API_BASE_URL = import.meta.env.VITE_API_BASE_URL || (
  import.meta.env.PROD ? 'https://hepco-api-self.vercel.app' : 'http://localhost:3000'
);
