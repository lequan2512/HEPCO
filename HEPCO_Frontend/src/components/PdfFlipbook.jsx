import { lazy, Suspense } from 'react';
import Loading from './Loading';

const PdfFlipbookReader = lazy(() => import('./PdfFlipbookReader'));

export default function PdfFlipbook(props) {
  return (
    <Suspense fallback={<Loading message="Đang mở trình đọc PDF..." />}>
      <PdfFlipbookReader {...props} />
    </Suspense>
  );
}
