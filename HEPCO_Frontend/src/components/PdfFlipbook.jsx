import { useEffect, useRef, useState, useCallback } from 'react';
import * as pdfjsLib from 'pdfjs-dist';
import pdfWorkerUrl from 'pdfjs-dist/build/pdf.worker.min.mjs?url';
import {
  ZoomIn,
  ZoomOut,
  Maximize,
  Minimize,
  Loader2,
  FileText,
  Download,
  ExternalLink,
  ChevronLeft,
  ChevronRight,
  ChevronsLeft,
  ChevronsRight,
  BookOpen,
  Scroll,
  X
} from 'lucide-react';

// Configure PDF.js worker
pdfjsLib.GlobalWorkerOptions.workerSrc = pdfWorkerUrl;

const PdfReader = ({
  pdfUrl,
  fileName = 'HoSoNangLuc2026.pdf',
  title = '',
  hideDownload = false,
  hideExternalLink = false,
  onClose = null,
  singlePage = false
}) => {
  const displayTitle = title || (fileName.includes('HoSoNangLuc') ? 'Hồ sơ năng lực HEPCO' : fileName);
  const containerRef = useRef(null);
  const bookContainerRef = useRef(null);

  const [pdfDoc, setPdfDoc] = useState(null);
  const [numPages, setNumPages] = useState(0);
  const [loading, setLoading] = useState(true);
  const [loadingProgress, setLoadingProgress] = useState(0);
  const [error, setError] = useState(null);

  // View modes: 'flip' (book flip reading) or 'scroll' (continuous vertical scroll)
  const [viewMode, setViewMode] = useState('flip');
  const [currentPage, setCurrentPage] = useState(1);
  const [scale, setScale] = useState(1.0);
  const [bookSize, setBookSize] = useState(null);
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [isMobile, setIsMobile] = useState(() => (typeof window !== 'undefined' ? window.innerWidth < 768 : false));
  const [isFlipping, setIsFlipping] = useState(false);
  const [flipDirection, setFlipDirection] = useState('next'); // 'next' or 'prev'
  const useSinglePage = singlePage || isMobile;
  const isSpread = viewMode === 'flip' && !useSinglePage && currentPage > 1;

  // Canvases for Flipbook mode
  const singleCanvasRef = useRef(null);
  const leftCanvasRef = useRef(null);
  const rightCanvasRef = useRef(null);

  // Canvases for Continuous Scroll mode
  const scrollCanvasRefs = useRef({});
  const renderTasksRef = useRef(new WeakMap());

  // Touch Swipe tracking for Mobile
  const touchStartX = useRef(0);
  const touchStartY = useRef(0);

  // Detect mobile resize and orientation change WITHOUT resetting currentPage
  useEffect(() => {
    const handleResize = () => {
      const mobile = window.innerWidth < 768;
      setIsMobile(mobile);
      // Note: currentPage is intentionally preserved across orientation changes
    };
    window.addEventListener('resize', handleResize);
    window.addEventListener('orientationchange', handleResize);
    return () => {
      window.removeEventListener('resize', handleResize);
      window.removeEventListener('orientationchange', handleResize);
    };
  }, []);

  useEffect(() => {
    const container = bookContainerRef.current;
    if (!container) return;

    const observer = new ResizeObserver(([{ contentRect }]) => {
      setBookSize({ width: contentRect.width, height: contentRect.height });
    });
    observer.observe(container);
    return () => observer.disconnect();
  }, []);

  // Load PDF Document when pdfUrl changes
  useEffect(() => {
    let isMounted = true;
    const source = new URL(pdfUrl, window.location.href);
    const isLegacyFile = ['hepco.com.vn', 'www.hepco.com.vn'].includes(source.hostname)
      && source.pathname.startsWith('/Public/Upload/files/')
      && /\.pdf$/i.test(source.pathname);
    const readerUrl = isLegacyFile ? source.pathname + source.search : pdfUrl;
    const loadingTask = pdfjsLib.getDocument(readerUrl);

    loadingTask.onProgress = (progress) => {
      if (progress.total > 0 && isMounted) {
        setLoadingProgress(Math.round((progress.loaded / progress.total) * 100));
      }
    };

    loadingTask.promise
      .then((doc) => {
        if (isMounted) {
          setPdfDoc(doc);
          setNumPages(doc.numPages);
          setLoading(false);
        }
      })
      .catch((err) => {
        if (isMounted) {
          console.error('Error loading PDF:', err);
          setError('Không thể mở tệp PDF trong trình đọc.');
          setLoading(false);
        }
      });

    return () => {
      isMounted = false;
      loadingTask.destroy().catch((err) => console.error('Error closing PDF:', err));
    };
  }, [pdfUrl]);

  // Page rendering helper with high DPI and crisp canvas sizing
  const renderPageToCanvas = useCallback(async (pNum, canvas, targetScale = 1.0) => {
    if (!pdfDoc || !canvas || !bookSize || pNum < 1 || pNum > pdfDoc.numPages) return;

    const tasks = renderTasksRef.current;
    tasks.get(canvas)?.task?.cancel();
    const pending = { task: null };
    tasks.set(canvas, pending);

    try {
      const page = await pdfDoc.getPage(pNum);
      if (tasks.get(canvas) !== pending || !canvas.isConnected) return;
      const pixelRatio = window.devicePixelRatio || 1;
      const baseViewport = page.getViewport({ scale: 1 });

      // Fit both axes at 100%, reserving room for the spine and captions.
      let renderScale = targetScale;
      if (bookSize?.width > 24 && bookSize.height > 40) {
        const availableWidth = viewMode === 'scroll'
          ? Math.min(766, Math.max(1, bookSize.width - 50))
          : (bookSize.width - 24) / (isSpread ? 2 : 1);
        const availableHeight = bookSize.height - 40;
        renderScale = Math.min(
          availableWidth / baseViewport.width,
          availableHeight / baseViewport.height
        ) * targetScale;
      }

      const viewport = page.getViewport({ scale: renderScale });
      const context = canvas.getContext('2d');

      canvas.height = viewport.height * pixelRatio;
      canvas.width = viewport.width * pixelRatio;
      canvas.style.height = `${viewport.height}px`;
      canvas.style.width = `${viewport.width}px`;

      context.setTransform(pixelRatio, 0, 0, pixelRatio, 0, 0);

      pending.task = page.render({ canvasContext: context, viewport });
      await pending.task.promise;
    } catch (err) {
      if (err?.name !== 'RenderingCancelledException') {
        console.error(`Error rendering page ${pNum}:`, err);
      }
    } finally {
      if (tasks.get(canvas) === pending) tasks.delete(canvas);
    }
  }, [pdfDoc, bookSize, viewMode, isSpread]);

  // Render Flipbook mode canvases
  useEffect(() => {
    if (!pdfDoc || viewMode !== 'flip') return;

    if (useSinglePage || currentPage === 1) {
      if (singleCanvasRef.current) {
        renderPageToCanvas(currentPage, singleCanvasRef.current, scale);
      }
    } else {
      const leftPageNum = currentPage;
      const rightPageNum = currentPage + 1 <= numPages ? currentPage + 1 : null;

      if (leftCanvasRef.current) {
        renderPageToCanvas(leftPageNum, leftCanvasRef.current, scale);
      }
      if (rightCanvasRef.current && rightPageNum) {
        renderPageToCanvas(rightPageNum, rightCanvasRef.current, scale);
      }
    }
  }, [pdfDoc, currentPage, scale, viewMode, useSinglePage, numPages, renderPageToCanvas]);

  // Render Continuous Scroll mode canvases
  useEffect(() => {
    if (!pdfDoc || viewMode !== 'scroll') return;

    Array.from({ length: numPages }, (_, i) => i + 1).forEach((pNum) => {
      const canvas = scrollCanvasRefs.current[pNum];
      if (canvas) {
        renderPageToCanvas(pNum, canvas, scale);
      }
    });
  }, [pdfDoc, viewMode, scale, numPages, renderPageToCanvas]);

  // Flip Actions with smooth animation trigger
  const triggerFlipAnimation = (direction) => {
    setFlipDirection(direction);
    setIsFlipping(true);
    setTimeout(() => {
      setIsFlipping(false);
    }, 350);
  };

  const handlePrevPage = () => {
    if (currentPage <= 1) return;
    triggerFlipAnimation('prev');
    if (useSinglePage) {
      setCurrentPage((p) => Math.max(1, p - 1));
    } else {
      if (currentPage === 2) {
        setCurrentPage(1);
      } else {
        setCurrentPage((p) => Math.max(1, p - 2));
      }
    }
  };

  const handleNextPage = () => {
    if (useSinglePage) {
      if (currentPage < numPages) {
        triggerFlipAnimation('next');
        setCurrentPage((p) => Math.min(numPages, p + 1));
      }
    } else {
      if (currentPage === 1) {
        triggerFlipAnimation('next');
        setCurrentPage(2);
      } else if (currentPage + 2 <= numPages) {
        triggerFlipAnimation('next');
        setCurrentPage((p) => p + 2);
      } else if (currentPage + 1 <= numPages) {
        triggerFlipAnimation('next');
        setCurrentPage((p) => p + 1);
      }
    }
  };

  // Touch Swipe detection for Mobile
  const handleTouchStart = (e) => {
    if (e.touches && e.touches.length === 1) {
      touchStartX.current = e.touches[0].clientX;
      touchStartY.current = e.touches[0].clientY;
    }
  };

  const handleTouchEnd = (e) => {
    if (!touchStartX.current) return;
    const endX = e.changedTouches[0].clientX;
    const endY = e.changedTouches[0].clientY;
    const deltaX = endX - touchStartX.current;
    const deltaY = endY - touchStartY.current;

    // Detect intentional horizontal swipe (>40px horizontal, with horizontal dominant over vertical)
    if (Math.abs(deltaX) > 40 && Math.abs(deltaX) > Math.abs(deltaY) * 1.4) {
      if (deltaX < 0) {
        handleNextPage(); // Swiped left -> Next page
      } else {
        handlePrevPage(); // Swiped right -> Previous page
      }
    }
    touchStartX.current = 0;
    touchStartY.current = 0;
  };

  // Keyboard navigation
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (viewMode !== 'flip') return;
      if (e.key === 'ArrowRight' || e.key === 'PageDown') {
        handleNextPage();
      } else if (e.key === 'ArrowLeft' || e.key === 'PageUp') {
        handlePrevPage();
      } else if (e.key === 'Escape' && onClose) {
        onClose();
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  });

  const handleJumpToFirst = () => {
    triggerFlipAnimation('prev');
    setCurrentPage(1);
  };

  const handleJumpToLast = () => {
    triggerFlipAnimation('next');
    if (useSinglePage) {
      setCurrentPage(numPages);
    } else {
      const lastSpread = numPages % 2 === 0 ? numPages - 1 : numPages;
      setCurrentPage(Math.max(1, lastSpread));
    }
  };

  // Fullscreen
  const toggleFullscreen = () => {
    if (!containerRef.current) return;
    if (!document.fullscreenElement) {
      containerRef.current.requestFullscreen().then(() => setIsFullscreen(true)).catch(console.error);
    } else {
      document.exitFullscreen().then(() => setIsFullscreen(false)).catch(console.error);
    }
  };

  const zoomIn = () => setScale((s) => Math.min(2.5, +(s + 0.2).toFixed(2)));
  const zoomOut = () => setScale((s) => Math.max(0.6, +(s - 0.2).toFixed(2)));
  const resetZoom = () => setScale(1.0);

  // Spread text
  const currentSpreadText = useSinglePage || currentPage === 1
    ? `Trang ${currentPage} / ${numPages || 1}`
    : `Trang ${currentPage}${currentPage + 1 <= numPages ? ` - ${currentPage + 1}` : ''} / ${numPages || 1}`;

  return (
    <div
      ref={containerRef}
      className={`bg-gray-950 text-white rounded-2xl md:rounded-3xl overflow-hidden shadow-2xl flex flex-col select-none ${
        isFullscreen ? 'fixed inset-0 z-50 rounded-none' : 'w-full h-[620px] sm:h-[680px] lg:h-[750px]'
      }`}
    >
      {/* Top Toolbar */}
      <div className="bg-gray-900/95 backdrop-blur-md px-3 sm:px-5 py-2.5 border-b border-gray-800 flex items-center justify-between gap-2.5 shrink-0 z-20">
        {/* Document Title & Icon */}
        <div className="flex items-center gap-2.5 min-w-0 flex-1">
          <div className="w-8 h-8 rounded-lg bg-emerald-500/20 text-emerald-400 flex items-center justify-center shrink-0">
            <BookOpen className="w-4 h-4" />
          </div>
          <div className="min-w-0">
            <h3 className="text-xs sm:text-sm font-bold text-white truncate" title={displayTitle}>
              {displayTitle}
            </h3>
            <p className="text-[10px] sm:text-xs text-gray-400 truncate">
              {viewMode === 'flip' ? 'Đọc sách lật trang trực tiếp' : 'Cuộn đọc liên tục'} • {numPages} trang
            </p>
          </div>
        </div>

        {/* View Mode Toggle: Flip vs Scroll */}
        <div className="flex items-center gap-1 bg-gray-800/90 p-1 rounded-xl border border-gray-700/60">
          <button
            type="button"
            onClick={() => setViewMode('flip')}
            className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-xs font-bold transition-all cursor-pointer ${
              viewMode === 'flip'
                ? 'bg-emerald-600 text-white shadow-xs'
                : 'text-gray-400 hover:text-white'
            }`}
            title="Chế độ đọc sách lật qua lật lại"
          >
            <BookOpen className="w-3.5 h-3.5" />
            <span className="hidden sm:inline">Lật sách</span>
          </button>

          <button
            type="button"
            onClick={() => setViewMode('scroll')}
            className={`inline-flex items-center gap-1.5 px-2.5 py-1 rounded-lg text-xs font-bold transition-all cursor-pointer ${
              viewMode === 'scroll'
                ? 'bg-emerald-600 text-white shadow-xs'
                : 'text-gray-400 hover:text-white'
            }`}
            title="Chế độ cuộn dọc liên tục"
          >
            <Scroll className="w-3.5 h-3.5" />
            <span className="hidden sm:inline">Cuộn trang</span>
          </button>
        </div>

        {/* Action Controls */}
        <div className="flex items-center gap-1 sm:gap-2">
          {/* Zoom controls */}
          <div className="flex items-center gap-1 bg-gray-800/80 px-1 py-0.5 rounded-xl border border-gray-700/60 text-xs">
            <button
              type="button"
              onClick={zoomOut}
              disabled={scale <= 0.6}
              className="p-1 text-gray-400 hover:text-white disabled:opacity-30 cursor-pointer rounded"
              title="Thu nhỏ (-)"
            >
              <ZoomOut className="w-3.5 h-3.5" />
            </button>
            <button
              type="button"
              onClick={resetZoom}
              className="text-[11px] font-bold px-1 min-w-[32px] sm:min-w-[38px] text-center text-gray-300 hover:text-white"
              title="Đặt lại kích thước chuẩn 100%"
            >
              {Math.round(scale * 100)}%
            </button>
            <button
              type="button"
              onClick={zoomIn}
              disabled={scale >= 2.5}
              className="p-1 text-gray-400 hover:text-white disabled:opacity-30 cursor-pointer rounded"
              title="Phóng to (+)"
            >
              <ZoomIn className="w-3.5 h-3.5" />
            </button>
          </div>

          {/* Conditional External Link (hidden if hideExternalLink) */}
          {!hideExternalLink && (
            <a
              href={pdfUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="p-2 bg-gray-800 hover:bg-gray-700 rounded-xl text-gray-300 hover:text-white transition-colors border border-gray-700/60"
              title="Mở PDF trong tab mới"
            >
              <ExternalLink className="w-4 h-4" />
            </a>
          )}

          {/* Conditional Download Button (hidden if hideDownload) */}
          {!hideDownload && (
            <a
              href={pdfUrl}
              download={fileName}
              className="p-2 bg-gray-800 hover:bg-gray-700 rounded-xl text-gray-300 hover:text-white transition-colors border border-gray-700/60"
              title="Tải xuống tệp PDF"
            >
              <Download className="w-4 h-4" />
            </a>
          )}

          {/* Fullscreen */}
          <button
            type="button"
            onClick={toggleFullscreen}
            className="p-2 bg-gray-800 hover:bg-gray-700 rounded-xl text-gray-300 hover:text-white transition-colors border border-gray-700/60 cursor-pointer"
            title={isFullscreen ? 'Thoát toàn màn hình' : 'Toàn màn hình'}
          >
            {isFullscreen ? <Minimize className="w-4 h-4" /> : <Maximize className="w-4 h-4" />}
          </button>

          {/* Close button if onClose is provided */}
          {onClose && (
            <button
              type="button"
              onClick={onClose}
              className="p-2 bg-rose-900/40 hover:bg-rose-600 rounded-xl text-rose-300 hover:text-white transition-colors border border-rose-800/60 cursor-pointer ml-1"
              title="Đóng trình xem"
            >
              <X className="w-4 h-4" />
            </button>
          )}
        </div>
      </div>

      {/* Main Interactive Stage */}
      <div
        ref={bookContainerRef}
        onTouchStart={handleTouchStart}
        onTouchEnd={handleTouchEnd}
        className="flex-1 relative overflow-hidden bg-gradient-to-b from-[#111827] via-[#0f172a] to-[#020617] flex items-center justify-center p-2 sm:p-4 overscroll-contain"
      >
        {/* Loading */}
        {loading && (
          <div className="flex flex-col items-center justify-center gap-3 text-emerald-400 py-20 z-30">
            <Loader2 className="w-10 h-10 animate-spin text-emerald-500" />
            <p className="text-xs sm:text-sm font-semibold text-gray-200">
              Đang tải tài liệu... {loadingProgress > 0 && `${loadingProgress}%`}
            </p>
          </div>
        )}

        {/* Error */}
        {error && (
          <div className="flex flex-col items-center justify-center gap-4 text-center p-6 bg-gray-900/90 rounded-2xl border border-gray-800 max-w-md mx-auto my-8 z-30">
            <FileText className="w-10 h-10 text-rose-400" />
            <p className="text-xs sm:text-sm text-gray-300">{error}</p>
            <a
              href={pdfUrl}
              target="_blank"
              rel="noopener noreferrer"
              className="inline-flex items-center gap-2 rounded-lg bg-emerald-700 px-3 py-2 text-sm font-semibold hover:bg-emerald-600"
            >
              <ExternalLink className="h-4 w-4" />
              Mở PDF gốc trong tab mới
            </a>
          </div>
        )}

        {/* ================= VIEW MODE 1: FLIPBOOK ================= */}
        {!loading && !error && pdfDoc && viewMode === 'flip' && (
          <div className="w-full min-w-0 h-full flex relative overflow-auto custom-scrollbar">
            {/* Left Big Flip Button */}
            <button
              type="button"
              onClick={handlePrevPage}
              disabled={currentPage <= 1}
              className="absolute top-1/2 -translate-y-1/2 left-1 sm:left-4 z-30 w-10 h-10 sm:w-13 sm:h-13 rounded-full bg-black/65 hover:bg-emerald-600 disabled:opacity-10 disabled:hover:bg-black/65 text-white flex items-center justify-center backdrop-blur-md border border-white/10 shadow-2xl transition-all active:scale-95 cursor-pointer group"
              title="Lật trang trước (hoặc vuốt sang phải)"
            >
              <ChevronLeft className="w-6 h-6 sm:w-7 sm:h-7 group-hover:-translate-x-0.5 transition-transform" />
            </button>

            {/* Right Big Flip Button */}
            <button
              type="button"
              onClick={handleNextPage}
              disabled={
                useSinglePage
                  ? currentPage >= numPages
                  : currentPage >= numPages || (currentPage === 1 ? numPages <= 1 : currentPage + 2 > numPages && currentPage + 1 > numPages)
              }
              className="absolute top-1/2 -translate-y-1/2 right-1 sm:right-4 z-30 w-10 h-10 sm:w-13 sm:h-13 rounded-full bg-black/65 hover:bg-emerald-600 disabled:opacity-10 disabled:hover:bg-black/65 text-white flex items-center justify-center backdrop-blur-md border border-white/10 shadow-2xl transition-all active:scale-95 cursor-pointer group"
              title="Lật trang tiếp (hoặc vuốt sang trái)"
            >
              <ChevronRight className="w-6 h-6 sm:w-7 sm:h-7 group-hover:translate-x-0.5 transition-transform" />
            </button>

            {/* Book Display Container */}
            <div
              className={`m-auto flex shrink-0 items-center justify-center transition-all duration-300 ${
                isFlipping
                  ? flipDirection === 'next'
                    ? 'opacity-85 translate-x-[-4px] scale-[0.995]'
                    : 'opacity-85 translate-x-[4px] scale-[0.995]'
                  : 'opacity-100 translate-x-0 scale-100'
              }`}
            >
              {useSinglePage || currentPage === 1 ? (
                /* Single Page (Mobile view or Book Cover) */
                <div className="relative bg-white rounded-xl sm:rounded-2xl shadow-[0_20px_60px_rgba(0,0,0,0.85)] overflow-hidden border border-gray-400/30">
                  <canvas ref={singleCanvasRef} className="block" />
                  <div className="bg-gray-100 text-gray-700 text-[11px] font-bold text-center py-1 border-t border-gray-200">
                    {currentPage === 1 ? 'Bìa trước' : `Trang ${currentPage}`}
                  </div>
                </div>
              ) : (
                /* Two-Page Open Book Spread (Desktop Reading Spread) */
                <div className="relative flex items-center justify-center bg-white rounded-2xl shadow-[0_25px_70px_rgba(0,0,0,0.9)] border border-gray-600/40 overflow-hidden">
                  {/* Left Page (Even Page) */}
                  <div className="relative overflow-hidden border-r border-gray-300 shadow-[inset_-8px_0_12px_rgba(0,0,0,0.06)] bg-[#fafafa]">
                    <canvas ref={leftCanvasRef} data-id="left" className="block" />
                    <div className="bg-gray-100 text-gray-600 text-[11px] font-semibold text-center py-1 border-t border-gray-200">
                      Trang {currentPage}
                    </div>
                  </div>

                  {/* Center Book Crease / Spine Effect */}
                  <div className="w-1.5 sm:w-2 self-stretch bg-gradient-to-r from-gray-400 via-gray-700 to-gray-400 shadow-inner z-20 shrink-0" />

                  {/* Right Page (Odd Page) */}
                  <div className="relative overflow-hidden shadow-[inset_8px_0_12px_rgba(0,0,0,0.06)] bg-[#fafafa]">
                    {currentPage + 1 <= numPages ? (
                      <>
                        <canvas ref={rightCanvasRef} data-id="right" className="block" />
                        <div className="bg-gray-100 text-gray-600 text-[11px] font-semibold text-center py-1 border-t border-gray-200">
                          Trang {currentPage + 1}
                        </div>
                      </>
                    ) : (
                      <div className="p-4 flex items-center justify-center text-gray-400 text-xs italic bg-gray-50">
                        (Hết tài liệu)
                      </div>
                    )}
                  </div>
                </div>
              )}
            </div>
          </div>
        )}

        {/* ================= VIEW MODE 2: CONTINUOUS SCROLL ================= */}
        {!loading && !error && pdfDoc && viewMode === 'scroll' && (
          <div className="w-full h-full overflow-auto px-2 sm:px-6 py-4 space-y-6 custom-scrollbar">
            {Array.from({ length: numPages }, (_, i) => i + 1).map((pNum) => (
              <div
                key={pNum}
                className="bg-white rounded-2xl shadow-xl overflow-hidden w-max mx-auto border border-gray-300 relative"
              >
                <canvas
                  ref={(el) => {
                    if (el) scrollCanvasRefs.current[pNum] = el;
                  }}
                  className="w-full h-auto block"
                />
                <div className="bg-gray-100 text-gray-600 text-xs font-bold text-center py-1.5 border-t border-gray-200">
                  Trang {pNum} / {numPages}
                </div>
              </div>
            ))}
          </div>
        )}
      </div>

      {/* Bottom Book Navigation & Flip Controls (Always visible in Flip mode) */}
      {viewMode === 'flip' && !loading && !error && (
        <div className="bg-gray-900/95 backdrop-blur-md px-3 sm:px-6 py-2.5 border-t border-gray-800 flex items-center justify-between gap-3 shrink-0 z-20">
          {/* Quick Jump: First Page */}
          <button
            type="button"
            onClick={handleJumpToFirst}
            disabled={currentPage <= 1}
            className="hidden sm:inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-semibold text-gray-400 hover:text-white hover:bg-gray-800 disabled:opacity-20 cursor-pointer transition-colors"
            title="Về trang bìa (Trang 1)"
          >
            <ChevronsLeft className="w-4 h-4" />
            <span>Trang bìa</span>
          </button>

          {/* Center Flip Controls: Prev, Current Indicator, Next */}
          <div className="flex items-center gap-2 sm:gap-3 mx-auto">
            <button
              type="button"
              onClick={handlePrevPage}
              disabled={currentPage <= 1}
              className="inline-flex items-center gap-1 px-3 py-1.5 rounded-xl bg-gray-800 hover:bg-emerald-600 text-white font-bold text-xs disabled:opacity-20 transition-all cursor-pointer shadow-xs active:scale-95"
            >
              <ChevronLeft className="w-4 h-4" />
              <span>Lật lùi</span>
            </button>

            {/* Page Indicator Pill */}
            <div className="px-3.5 py-1.5 rounded-xl bg-gray-800/90 border border-gray-700 text-xs font-bold text-emerald-400 whitespace-nowrap shadow-inner">
              {currentSpreadText}
            </div>

            <button
              type="button"
              onClick={handleNextPage}
              disabled={
                useSinglePage
                  ? currentPage >= numPages
                  : currentPage >= numPages || (currentPage === 1 ? numPages <= 1 : currentPage + 2 > numPages && currentPage + 1 > numPages)
              }
              className="inline-flex items-center gap-1 px-3 py-1.5 rounded-xl bg-gray-800 hover:bg-emerald-600 text-white font-bold text-xs disabled:opacity-20 transition-all cursor-pointer shadow-xs active:scale-95"
            >
              <span>Lật tới</span>
              <ChevronRight className="w-4 h-4" />
            </button>
          </div>

          {/* Quick Jump: Last Page */}
          <button
            type="button"
            onClick={handleJumpToLast}
            disabled={currentPage >= numPages}
            className="hidden sm:inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-semibold text-gray-400 hover:text-white hover:bg-gray-800 disabled:opacity-20 cursor-pointer transition-colors"
            title="Đến trang cuối cùng"
          >
            <span>Trang cuối</span>
            <ChevronsRight className="w-4 h-4" />
          </button>
        </div>
      )}
    </div>
  );
};

const PdfFlipbook = ({ pdfUrl = '/pdf/HoSoNangLuc2026.pdf', ...props }) => (
  <PdfReader key={pdfUrl} pdfUrl={pdfUrl} {...props} />
);

export default PdfFlipbook;
