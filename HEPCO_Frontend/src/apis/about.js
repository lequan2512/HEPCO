import { useQuery } from '@tanstack/react-query';
import { getAboutSettingsServer } from '../services/news.service';

export const ABOUT_SETTINGS_KEY = ['about-settings'];
export const useAboutSettings = () => useQuery({
  queryKey: ABOUT_SETTINGS_KEY,
  queryFn: getAboutSettingsServer,
});
