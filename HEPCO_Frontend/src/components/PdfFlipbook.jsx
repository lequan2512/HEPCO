import { useEffect, useRef, useState, useCallback } from 'react';
import * as pdfjsLib from 'pdfjs-dist';
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
  RotateCcw
} from 'lucide-react';

// Configure PDF.js worker
pdfjsLib.GlobalWorkerOptions.workerSrc = `https://unpkg.com/pdfjs-dist@${pdfjsLib.version}/build/pdf.worker.min.mjs`;

const PdfFlipbook = ({
  pdfUrl = '/pdf/HoSoNangLuc2026.pdf',
  fileName = 'HoSoNangLuc2026.pdf',
  title = ''
}) => {
  const displayTitle = title || (fileName.includes('HoSoNangLuc') ? 'Hồ sơ năng lực HEPCO' : fileName);
  const containerRef = useRef(null);
  const bookContainerRef = useRef(null);

  const [pdfDoc, setPdfDoc] = useState(null);
  const [numPages, setNumPages] = useState(0);
  const [loading, setLoading] = useState(true);
  const [loadingProgress, setLoadingProgress] = useState(0);
  const [error, setError] = useState(null);

  // View modes: 'flip' (interactive book flip reader) or 'scroll' (continuous vertical scroll)
  const [viewMode, setViewMode] = useState('flip');
  const [currentPage, setCurrentPage] = useState(1);
  const [scale, setScale] = useState(1.0);
  const [isFullscreen, setIsFullscreen] = useState(false);
  const [isMobile, setIsMobile] = useState(window.innerWidth < 768);

  // Canvases for Flipbook mode
  const singleCanvasRef = useRef(null);
  const leftCanvasRef = useRef(null);
  const rightCanvasRef = useRef(null);

  // Canvases for Continuous Scroll mode
  const scrollCanvasRefs = useRef({});
  const renderTasksRef = useRef({});

  // Detect mobile resize
  useEffect(() => {
    const handleResize = () => {
      setIsMobile(window.innerWidth < 768);
    };
    window.addEventListener('resize', handleResize);
    return () => window.removeEventListener('resize', handleResize);
  }, []);

  // Reset when pdfUrl changes
  useEffect(() => {
    setCurrentPage(1);
    setScale(1.0);
    setLoading(true);
    setError(null);
    setPdfDoc(null);
    setNumPages(0);
    setLoadingProgress(0);

    let isMounted = true;
    const loadingTask = pdfjsLib.getDocument(pdfUrl);

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
        console.error('Error loading PDF:', err);
        if (isMounted) {
          setError('Không thể mở trực tiếp tệp PDF trong trình đọc. Vui lòng mở trong tab mới hoặc tải về máy.');
          setLoading(false);
        }
      });

    return () => {
      isMounted = false;
      try {
        loadingTask.destroy();
      } catch {}
    };
  }, [pdfUrl]);

  // Generic page render helper
  const renderPageToCanvas = useCallback(async (pNum, canvas, targetScale = 1.0) => {
    if (!pdfDoc || !canvas || pNum < 1 || pNum > pdfDoc.numPages) return;

    const taskId = `task_${pNum}_${canvas.dataset?.id || 'c'}`;
    if (renderTasksRef.current[taskId]) {
      try {
        renderTasksRef.current[taskId].cancel();
      } catch {}
      delete renderTasksRef.current[taskId];
    }

    try {
      const page = await pdfDoc.getPage(pNum);
      const pixelRatio = window.devicePixelRatio || 1;
      const baseViewport = page.getViewport({ scale: 1 });

      // Determine fit scale based on container height
      let renderScale = targetScale;
      if (bookContainerRef.current) {
        const availableHeight = bookContainerRef.current.clientHeight - 40;
        if (availableHeight > 200) {
          renderScale = (availableHeight / baseViewport.height) * targetScale;
        }
      }

      const viewport = page.getViewport({ scale: Math.max(0.6, renderScale) });
      const context = canvas.getContext('2d');

      canvas.height = viewport.height * pixelRatio;
      canvas.width = viewport.width * pixelRatio;
      canvas.style.height = `${viewport.height}px`;
      canvas.style.width = `${viewport.width}px`;

      context.setTransform(pixelRatio, 0, 0, pixelRatio, 0, 0);

      const renderTask = page.render({ canvasContext: context, viewport });
      renderTasksRef.current[taskId] = renderTask;

      await renderTask.promise;
      delete renderTasksRef.current[taskId];
    } catch (err) {
      if (err?.name !== 'RenderingCancelledException') {
        console.error(`Error rendering page ${pNum}:`, err);
      }
    }
  }, [pdfDoc]);

  // Render Flipbook pages when currentPage, scale, or viewMode changes
  useEffect(() => {
    if (!pdfDoc || viewMode !== 'flip') return;

    if (isMobile || currentPage === 1) {
      // Single Page (Mobile or Book Cover)
      if (singleCanvasRef.current) {
        renderPageToCanvas(currentPage, singleCanvasRef.current, scale);
      }
    } else {
      // 2-Page Book Spread (Desktop: Left Page & Right Page)
      const leftPageNum = currentPage;
      const rightPageNum = currentPage + 1 <= numPages ? currentPage + 1 : null;

      if (leftCanvasRef.current) {
        renderPageToCanvas(leftPageNum, leftCanvasRef.current, scale);
      }
      if (rightCanvasRef.current && rightPageNum) {
        renderPageToCanvas(rightPageNum, rightCanvasRef.current, scale);
      }
    }
  }, [pdfDoc, currentPage, scale, viewMode, isMobile, numPages, renderPageToCanvas]);

  // Render Scroll mode canvases
  useEffect(() => {
    if (!pdfDoc || viewMode !== 'scroll') return;

    Array.from({ length: numPages }, (_, i) => i + 1).forEach((pNum) => {
      const canvas = scrollCanvasRefs.current[pNum];
      if (canvas) {
        renderPageToCanvas(pNum, canvas, scale);
      }
    });
  }, [pdfDoc, viewMode, scale, numPages, renderPageToCanvas]);

  // Keyboard navigation for page flipping
  useEffect(() => {
    const handleKeyDown = (e) => {
      if (viewMode !== 'flip') return;
      if (e.key === 'ArrowRight' || e.key === 'PageDown') {
        handleNextPage();
      } else if (e.key === 'ArrowLeft' || e.key === 'PageUp') {
        handlePrevPage();
      }
    };
    window.addEventListener('keydown', handleKeyDown);
    return () => window.removeEventListener('keydown', handleKeyDown);
  });

  // Flip Actions
  const handlePrevPage = () => {
    if (currentPage <= 1) return;
    if (isMobile) {
      setCurrentPage((p) => Math.max(1, p - 1));
    } else {
      // Desktop: if currently on spread (e.g. 2 & 3), going back reaches cover (page 1)
      if (currentPage === 2) {
        setCurrentPage(1);
      } else {
        setCurrentPage((p) => Math.max(1, p - 2));
      }
    }
  };

  const handleNextPage = () => {
    if (isMobile) {
      if (currentPage < numPages) {
        setCurrentPage((p) => Math.min(numPages, p + 1));
      }
    } else {
      if (currentPage === 1) {
        // From cover to first 2-page spread
        setCurrentPage(2);
      } else if (currentPage + 2 <= numPages) {
        setCurrentPage((p) => p + 2);
      } else if (currentPage + 1 <= numPages) {
        setCurrentPage((p) => p + 1);
      }
    }
  };

  const handleJumpToFirst = () => setCurrentPage(1);
  const handleJumpToLast = () => {
    if (isMobile) {
      setCurrentPage(numPages);
    } else {
      // Jump to last spread
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

  const zoomIn = () => setScale((s) => Math.min(1.8, +(s + 0.15).toFixed(2)));
  const zoomOut = () => setScale((s) => Math.max(0.7, +(s - 0.15).toFixed(2)));
  const resetZoom = () => setScale(1.0);

  // Current page display text
  const currentSpreadText = isMobile || currentPage === 1
    ? `Trang ${currentPage} / ${numPages || 1}`
    : `Trang ${currentPage}${currentPage + 1 <= numPages ? ` - ${currentPage + 1}` : ''} / ${numPages || 1}`;

  return (
    <div
      ref={containerRef}
      className={`bg-gray-950 text-white rounded-2xl md:rounded-3xl overflow-hidden shadow-2xl flex flex-col select-none ${
        isFullscreen ? 'fixed inset-0 z-50 rounded-none' : 'w-full h-[620px] sm:h-[680px] lg:h-[750px]'
      }`}
    >
      {/* Top Main Toolbar */}
      <div className="bg-gray-900/95 backdrop-blur-md px-3 sm:px-5 py-2.5 border-b border-gray-800 flex flex-wrap items-center justify-between gap-2.5 shrink-0 z-20">
        {/* Document Title & Mode Pill */}
        <div className="flex items-center gap-2.5 min-w-0 flex-1">
          <div className="w-8 h-8 rounded-lg bg-emerald-500/20 text-emerald-400 flex items-center justify-center shrink-0">
            <BookOpen className="w-4 h-4" />
          </div>
          <div className="min-w-0">
            <h3 className="text-xs sm:text-sm font-bold text-white truncate" title={displayTitle}>
              {displayTitle}
            </h3>
            <p className="text-[10px] sm:text-xs text-gray-400 truncate">
              Đọc sách lật trang trực tiếp • {numPages} trang
            </p>
          </div>
        </div>

        {/* View Mode Toggle (Flipbook vs Continuous Scroll) */}
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

        {/* Quick Utilities: Zoom, External Link, Download, Fullscreen */}
        <div className="flex items-center gap-1 sm:gap-2">
          {/* Zoom controls */}
          <div className="hidden sm:flex items-center gap-1 bg-gray-800/80 px-1 py-0.5 rounded-xl border border-gray-700/60">
            <button
              type="button"
              onClick={zoomOut}
              disabled={scale <= 0.7}
              className="p-1 text-gray-400 hover:text-white disabled:opacity-30 cursor-pointer rounded"
              title="Thu nhỏ"
            >
              <ZoomOut className="w-3.5 h-3.5" />
            </button>
            <button
              type="button"
              onClick={resetZoom}
              className="text-[11px] font-bold px-1.5 min-w-[36px] text-center text-gray-300 hover:text-white"
              title="Đặt lại kích thước chuẩn 100%"
            >
              {Math.round(scale * 100)}%
            </button>
            <button
              type="button"
              onClick={zoomIn}
              disabled={scale >= 1.8}
              className="p-1 text-gray-400 hover:text-white disabled:opacity-30 cursor-pointer rounded"
              title="Phóng to"
            >
              <ZoomIn className="w-3.5 h-3.5" />
            </button>
          </div>

          <a
            href={pdfUrl}
            target="_blank"
            rel="noopener noreferrer"
            className="p-2 bg-gray-800 hover:bg-gray-700 rounded-xl text-gray-300 hover:text-white transition-colors border border-gray-700/60"
            title="Mở PDF trong tab mới"
          >
            <ExternalLink className="w-4 h-4" />
          </a>

          <a
            href={pdfUrl}
            download={fileName}
            className="p-2 bg-gray-800 hover:bg-gray-700 rounded-xl text-gray-300 hover:text-white transition-colors border border-gray-700/60"
            title="Tải xuống tệp PDF"
          >
            <Download className="w-4 h-4" />
          </a>

          <button
            type="button"
            onClick={toggleFullscreen}
            className="p-2 bg-gray-800 hover:bg-gray-700 rounded-xl text-gray-300 hover:text-white transition-colors border border-gray-700/60 cursor-pointer"
            title={isFullscreen ? 'Thoát toàn màn hình' : 'Toàn màn hình'}
          >
            {isFullscreen ? <Minimize className="w-4 h-4" /> : <Maximize className="w-4 h-4" />}
          </button>
        </div>
      </div>

      {/* Main Interactive Flipbook Stage */}
      <div
        ref={bookContainerRef}
        className="flex-1 relative overflow-hidden bg-gradient-to-b from-[#111827] via-[#0f172a] to-[#020617] flex items-center justify-center p-2 sm:p-4"
      >
        {/* Loading Spinner */}
        {loading && (
          <div className="flex flex-col items-center justify-center gap-3 text-emerald-400 py-20 z-30">
            <Loader2 className="w-10 h-10 animate-spin text-emerald-500" />
            <p className="text-xs sm:text-sm font-semibold text-gray-200">
              Đang chuẩn bị sách lật trang... {loadingProgress > 0 && `${loadingProgress}%`}
            </p>
          </div>
        )}

        {/* Error State */}
        {error && (
          <div className="flex flex-col items-center justify-center gap-4 text-center p-6 bg-gray-900/90 rounded-2xl border border-gray-800 max-w-md mx-auto my-8 z-30">
            <FileText className="w-10 h-10 text-rose-400" />
            <p className="text-xs sm:text-sm text-gray-300">{error}</p>
            <div className="flex items-center gap-3">
              <a
                href={pdfUrl}
                target="_blank"
                rel="noopener noreferrer"
                className="px-4 py-2 bg-gray-800 hover:bg-gray-700 text-white font-bold text-xs rounded-xl shadow-md transition-colors border border-gray-700"
              >
                Mở tab mới
              </a>
              <a
                href={pdfUrl}
                download={fileName}
                className="px-4 py-2 bg-emerald-600 hover:bg-emerald-500 text-white font-bold text-xs rounded-xl shadow-md transition-colors"
              >
                Tải file về máy
              </a>
            </div>
          </div>
        )}

        {/* ================= VIEW MODE 1: FLIPBOOK (BOOK-READING STYLE) ================= */}
        {!loading && !error && pdfDoc && viewMode === 'flip' && (
          <div className="w-full h-full flex items-center justify-center relative">
            {/* Left Big Flip Button */}
            <button
              type="button"
              onClick={handlePrevPage}
              disabled={currentPage <= 1}
              className="absolute left-1 sm:left-4 z-30 w-10 h-10 sm:w-13 sm:h-13 rounded-full bg-black/60 hover:bg-emerald-600 disabled:opacity-15 disabled:hover:bg-black/60 text-white flex items-center justify-center backdrop-blur-md border border-white/10 shadow-2xl transition-all active:scale-95 cursor-pointer group"
              title="Lật trang trước (←)"
            >
              <ChevronLeft className="w-6 h-6 sm:w-7 sm:h-7 group-hover:-translate-x-0.5 transition-transform" />
            </button>

            {/* Right Big Flip Button */}
            <button
              type="button"
              onClick={handleNextPage}
              disabled={
                isMobile
                  ? currentPage >= numPages
                  : currentPage >= numPages || (currentPage === 1 ? numPages <= 1 : currentPage + 2 > numPages && currentPage + 1 > numPages)
              }
              className="absolute right-1 sm:right-4 z-30 w-10 h-10 sm:w-13 sm:h-13 rounded-full bg-black/60 hover:bg-emerald-600 disabled:opacity-15 disabled:hover:bg-black/60 text-white flex items-center justify-center backdrop-blur-md border border-white/10 shadow-2xl transition-all active:scale-95 cursor-pointer group"
              title="Lật trang tiếp (→)"
            >
              <ChevronRight className="w-6 h-6 sm:w-7 sm:h-7 group-hover:translate-x-0.5 transition-transform" />
            </button>

            {/* Book Spine & Open Spread Frame */}
            <div className="flex items-center justify-center transition-all duration-300 max-h-full">
              {isMobile || currentPage === 1 ? (
                /* Single Page (Book Cover or Mobile View) */
                <div className="relative bg-white rounded-xl sm:rounded-2xl shadow-[0_20px_60px_rgba(0,0,0,0.8)] overflow-hidden border-2 border-amber-900/20 max-h-full">
                  {/* Subtle Book Cover Sheen & Corner fold */}
                  <div className="absolute top-0 right-0 w-8 h-8 bg-gradient-to-bl from-white/30 to-transparent pointer-events-none z-10" />
                  <canvas ref={singleCanvasRef} className="block w-auto h-auto max-h-[75vh]" />
                  <div className="bg-gray-100 text-gray-700 text-[11px] font-bold text-center py-1 border-t border-gray-200">
                    {currentPage === 1 ? 'Bìa trước' : `Trang ${currentPage}`}
                  </div>
                </div>
              ) : (
                /* Two-Page Open Book Spread (Desktop Reading Spread) */
                <div className="relative flex items-center justify-center bg-white rounded-2xl shadow-[0_25px_70px_rgba(0,0,0,0.85)] border-2 border-gray-800/30 overflow-hidden max-h-full">
                  {/* Left Page (Even Page in booklet spread) */}
                  <div className="relative overflow-hidden border-r border-gray-300 shadow-[inset_-8px_0_12px_rgba(0,0,0,0.06)] bg-[#fafafa]">
                    <canvas ref={leftCanvasRef} data-id="left" className="block w-auto h-auto max-h-[75vh]" />
                    <div className="bg-gray-100 text-gray-600 text-[11px] font-semibold text-center py-1 border-t border-gray-200">
                      Trang {currentPage}
                    </div>
                  </div>

                  {/* Center Book Crease / Spine Effect */}
                  <div className="w-1.5 sm:w-2 self-stretch bg-gradient-to-r from-gray-400 via-gray-700 to-gray-400 shadow-inner z-20 shrink-0" />

                  {/* Right Page (Odd Page in booklet spread) */}
                  <div className="relative overflow-hidden shadow-[inset_8px_0_12px_rgba(0,0,0,0.06)] bg-[#fafafa]">
                    {currentPage + 1 <= numPages ? (
                      <>
                        <canvas ref={rightCanvasRef} data-id="right" className="block w-auto h-auto max-h-[75vh]" />
                        <div className="bg-gray-100 text-gray-600 text-[11px] font-semibold text-center py-1 border-t border-gray-200">
                          Trang {currentPage + 1}
                        </div>
                      </>
                    ) : (
                      <div className="w-[300px] h-[400px] flex items-center justify-center text-gray-400 text-xs italic bg-gray-50">
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
          <div className="w-full h-full overflow-y-auto px-2 sm:px-6 py-4 space-y-6 custom-scrollbar">
            {Array.from({ length: numPages }, (_, i) => i + 1).map((pNum) => (
              <div
                key={pNum}
                className="bg-white rounded-2xl shadow-xl overflow-hidden max-w-3xl mx-auto border border-gray-300 relative"
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
                isMobile
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

export default PdfFlipbook;
