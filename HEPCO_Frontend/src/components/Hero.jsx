import { useState } from 'react';
import { Play, X } from 'lucide-react';
import { getHeroSettings } from '../services/news.service';
import { resolveAssetUrl } from '../utils/assetUrl';
import bgImg from '../assets/images/bg-img.avif';

const Hero = ({ config }) => {
  const [showVideo, setShowVideo] = useState(false);
  const heroSettings = getHeroSettings();
  const heroConfig = {
    ...heroSettings,
    ...(config || {})
  };

  const coverImageUrl = resolveAssetUrl(heroConfig.coverImage || '/uploads/images/TongQuan_6a06c09d.jpg');
  const backgroundImageUrl = resolveAssetUrl(heroConfig.backgroundImage) || bgImg;

  return (
    <section
      className="relative overflow-hidden bg-cover bg-center bg-no-repeat pt-4 pb-6 sm:pt-10 sm:pb-14 md:pt-14 md:pb-20 lg:pt-16 lg:pb-24 border-b border-gray-200/70"
      style={{
        backgroundImage: `linear-gradient(to bottom, rgba(255, 255, 255, 0.20) 10%, rgba(255, 255, 255, 0.45) 55%, rgba(255, 255, 255, 0.96) 100%), url(${JSON.stringify(backgroundImageUrl)})`
      }}
    >
      <div className="container mx-auto px-3.5 sm:px-6 lg:px-8 max-w-7xl">
        {/* Main Display Headline */}
        <div className="flex flex-col items-center text-center max-w-4xl mx-auto mb-3 sm:mb-6 md:mb-8">
          {(heroConfig.headlinePrefix || heroConfig.headlineHighlight) && <h1 className="text-2xl sm:text-4xl md:text-5xl lg:text-6xl font-black tracking-tight text-black leading-[1.2] sm:leading-[1.15] text-balance mb-4 empty:hidden sm:mb-6 drop-shadow-2xs">
            <span className="block text-black">{heroConfig.headlinePrefix}</span>
            <span className="block text-hepco-green mt-1 sm:mt-2">
              {heroConfig.headlineHighlight}
            </span>
          </h1>}

          {/* Subtitle */}
          <p className="text-sm sm:text-base md:text-lg lg:text-xl text-gray-800 max-w-3xl leading-relaxed font-medium px-1 text-pretty empty:hidden">
            {heroConfig.subtitle}
          </p>
        </div>

        {/* Hero Showcase Frame - Centered and perfectly proportioned */}
        <div className="relative sm:mt-6 md:mt-8 max-w-5xl mx-auto w-full">
          <div className="relative rounded-2xl sm:rounded-3xl overflow-hidden border border-gray-200/90 shadow-2xl bg-white/80 sm:backdrop-blur-md p-1.5 sm:p-3 flex items-center justify-center">
            <div className="relative w-full flex flex-col sm:flex-row items-center justify-center overflow-hidden rounded-xl sm:rounded-2xl bg-gradient-to-b from-emerald-900/5 to-emerald-900/10 sm:min-h-[420px] md:min-h-[520px]">
              {/* Ambient blur behind image */}
              <div
                className="hidden sm:block absolute inset-0 w-full h-full bg-cover bg-center blur-3xl opacity-25 scale-110 pointer-events-none"
                style={{ backgroundImage: `url(${coverImageUrl})` }}
              />

              <img
                src={coverImageUrl}
                alt="HEPCO - Vì Môi Trường Huế Xanh Sạch Sáng"
                onError={(e) => {
                  e.target.onerror = null;
                  e.target.src = '/uploads/images/TongQuan_6a06c09d.jpg';
                }}
                className="relative z-10 w-full sm:w-auto h-auto max-w-full max-h-[520px] sm:max-h-[640px] md:max-h-[720px] object-contain object-center mx-auto rounded-lg sm:rounded-xl shadow-md transition-transform duration-700 hover:scale-[1.01]"
              />

              {/* Video Play Button Overlay */}
              <div className="relative z-20 self-end p-2 sm:absolute sm:bottom-4 sm:right-4 sm:p-0">
                <button
                  type="button"
                  onClick={() => setShowVideo(true)}
                  className="flex min-h-11 items-center gap-2 sm:gap-3 px-3.5 py-2 sm:px-5 sm:py-2.5 rounded-full bg-white/95 hover:bg-white text-black font-bold text-xs sm:text-sm shadow-xl backdrop-blur-md hover:scale-105 active:scale-95 transition-all duration-300 border border-gray-200/80 group/btn cursor-pointer"
                  title="Xem video giới thiệu HEPCO"
                >
                  <div className="w-7 h-7 sm:w-8 sm:h-8 rounded-full bg-emerald-600 flex items-center justify-center text-white shadow-md group-hover/btn:bg-emerald-700 transition-colors shrink-0">
                    <Play className="w-3.5 h-3.5 sm:w-4 sm:h-4 ml-0.5 fill-current" />
                  </div>
                  <span className="pr-1 whitespace-nowrap">
                    {heroConfig.videoButtonText || 'Xem Phim Giới Thiệu'}
                  </span>
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>

      {/* Video Modal */}
      {showVideo && (
        <div
          className="fixed inset-0 z-50 flex items-center justify-center p-3 sm:p-6 bg-black/85 backdrop-blur-sm animate-in fade-in duration-200"
          onClick={() => setShowVideo(false)}
        >
          <div
            className="relative w-full max-w-4xl bg-black rounded-2xl overflow-hidden shadow-2xl border border-gray-800"
            onClick={(e) => e.stopPropagation()}
          >
            <button
              type="button"
              onClick={() => setShowVideo(false)}
              className="absolute top-3 right-3 sm:top-4 sm:right-4 z-20 w-9 h-9 sm:w-10 sm:h-10 bg-black/60 hover:bg-rose-600 rounded-full flex items-center justify-center text-white transition-colors cursor-pointer"
            >
              <X className="w-5 h-5 sm:w-6 sm:h-6" />
            </button>
            <div className="relative pt-[56.25%]">
              <iframe
                className="absolute inset-0 w-full h-full"
                src={heroConfig.videoUrl || 'https://www.youtube.com/embed/P7RZLoytEBI?autoplay=1'}
                title="Giới thiệu HEPCO"
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
                allowFullScreen
              />
            </div>
          </div>
        </div>
      )}
    </section>
  );
};

export default Hero;
