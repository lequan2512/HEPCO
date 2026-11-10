import { useState } from 'react';
import { Upload, Image as ImageIcon } from 'lucide-react';
import { useUploadImage } from '../../../apis/upload';
import { useGetGallery } from '../../../apis/news';
import { resolveAssetUrl } from '../../../utils/assetUrl';
import { isShowcaseUrl } from '../../../constants/showcase';
import toast from 'react-hot-toast';

const ShowcaseImagePicker = ({ value, onChange, onBusyChange, disabled, name }) => {
  const [libraryOpen, setLibraryOpen] = useState(false);
  const [failedSource, setFailedSource] = useState(null);
  const upload = useUploadImage();
  const { data } = useGetGallery({ page: 1, limit: 24 }, { enabled: libraryOpen });
  const gallery = data?.data || [];
  const options = [...new Map([...gallery].filter((item) => isShowcaseUrl(item.url, true)).map((item) => [item.url, item])).values()];
  const chooseFile = async (event) => {
    const file = event.target.files?.[0];
    if (!file) return;
    const form = new FormData(); form.append('image', file);
    onBusyChange(true);
    try {
      const result = await upload.mutateAsync(form);
      onChange(result.url);
      toast.success('Đã tải ảnh lên. Nhấn Lưu lên máy chủ để áp dụng cho trang chủ.');
    } catch (error) { toast.error(error.response?.data?.message || error.message || 'Chưa tải được ảnh.'); }
    finally { onBusyChange(false); event.target.value = ''; }
  };
  return (
    <div className="space-y-3">
      <img src={resolveAssetUrl(value)} alt="Ảnh đang chọn cho thẻ hoạt động" onError={() => setFailedSource(value)} onLoad={() => setFailedSource(null)} className="w-full h-48 object-cover rounded-xl bg-gray-100 border border-gray-200" />
      {failedSource === value && <p role="status" className="text-xs text-red-600">Không tải được ảnh. Vui lòng kiểm tra đường dẫn hoặc chọn ảnh khác.</p>}
      <p className="text-xs text-gray-500">JPG, PNG, WebP tối đa 10 MB · GIF tối đa 4 MB</p>
      <div className="flex flex-wrap gap-2">
        <label className="inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-gray-50 border border-gray-200 text-sm font-semibold cursor-pointer"><Upload className="w-4 h-4" />{upload.isPending ? 'Đang tải ảnh…' : 'Chọn ảnh từ máy'}<input type="file" name={`${name}-file`} accept="image/jpeg,image/png,image/webp,image/gif" onChange={chooseFile} disabled={disabled || upload.isPending} className="sr-only" /></label>
        <button type="button" onClick={() => setLibraryOpen(!libraryOpen)} disabled={disabled} aria-expanded={libraryOpen} className="inline-flex items-center gap-2 px-4 py-2 rounded-lg bg-gray-50 border border-gray-200 text-sm font-semibold"><ImageIcon className="w-4 h-4" />Chọn từ thư viện</button>
      </div>
      {libraryOpen && <div className="grid grid-cols-3 sm:grid-cols-4 gap-2 p-3 border border-gray-200 rounded-xl max-h-64 overflow-y-auto">
        {options.map((item) => <button key={item.url} type="button" aria-label={`Chọn ảnh: ${item.caption || item.title || 'Hình hoạt động'}`} onClick={() => { onChange(item.url); setLibraryOpen(false); }} disabled={disabled} className="rounded-lg overflow-hidden border-2 border-gray-200 hover:border-hepco-green"><img src={resolveAssetUrl(item.url)} alt={item.caption || item.title || 'Hình hoạt động'} loading="lazy" className="w-full h-20 object-cover" /></button>)}
      </div>}
    </div>
  );
};
export default ShowcaseImagePicker;
