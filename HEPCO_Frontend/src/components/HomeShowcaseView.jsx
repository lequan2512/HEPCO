import { MapPin, ArrowRight } from 'lucide-react';
import { Link } from 'react-router-dom';
import { resolveAssetUrl } from '../utils/assetUrl';

const CardLink = ({ preview, to, children, ...props }) =>
  preview ? <div {...props}>{children}</div> : <Link to={to} {...props}>{children}</Link>;

const HomeShowcaseView = ({ config, preview = false }) => {
  return (
    <section className="py-14 sm:py-20 md:py-24 lg:py-28 bg-white border-b border-gray-200/80">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8 max-w-7xl">
        {/* Header */}
        <div className="flex flex-col md:flex-row md:items-end justify-between mb-10 sm:mb-14 md:mb-16 gap-6">
          <div className="max-w-4xl">
            <h2 className="text-2xl sm:text-3xl md:text-4xl lg:text-5xl font-black text-[#10243b] tracking-tight leading-tight text-balance">
              {config.title}
            </h2>
            <p className="mt-3 sm:mt-4 text-sm sm:text-base md:text-lg text-gray-600 leading-relaxed font-normal text-pretty max-w-3xl">
              {config.description}
            </p>
          </div>

          <CardLink
            to={config.href}
            preview={preview}
            className="inline-flex items-center gap-2 px-5 sm:px-6 py-3 sm:py-3.5 rounded-xl bg-gray-100 hover:bg-[#10243b] text-[#10243b] hover:text-white font-bold text-xs sm:text-sm transition-all duration-300 shadow-2xs group self-start md:self-auto shrink-0"
          >
            <span>{config.linkLabel}</span>
            <ArrowRight className="w-4 h-4 transition-transform group-hover:translate-x-1" />
          </CardLink>
        </div>

        {/* Showcase Grid (Visual Cards) */}
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6 sm:gap-8 home-mobile-rail">
          {config.items.map((item) => (
            <CardLink
              key={item.id}
              to={item.href}
              preview={preview}
              className="group flex flex-col rounded-3xl overflow-hidden bg-[#fafafa] border border-gray-200/90 hover:border-emerald-600/60 shadow-xs hover:shadow-xl transition-all duration-500 hover:-translate-y-2"
            >
              {/* Image Frame */}
              <div className="relative h-52 sm:h-60 w-full overflow-hidden bg-gray-200">
                <img
                  src={resolveAssetUrl(item.image)}
                  loading="lazy"
                  alt={item.title}
                  className="w-full h-full object-cover object-center transition-transform duration-700 group-hover:scale-105"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-black/70 via-black/20 to-transparent" />
              </div>

              {/* Text Meta */}
              <div className="p-5 sm:p-6 flex flex-col justify-between flex-grow bg-white">
                <div>
                  <h3 className="text-base sm:text-lg font-bold text-[#10243b] group-hover:text-emerald-700 transition-colors mb-2 line-clamp-2 leading-snug text-balance">
                    {item.title}
                  </h3>
                  {item.subtitle && (
                    <p className="mb-3 text-xs sm:text-sm text-gray-600 whitespace-pre-line text-pretty">
                      {item.subtitle}
                    </p>
                  )}

                  <div className="space-y-1.5 text-xs text-gray-500">
                    <div className="flex items-center gap-1.5">
                      <MapPin className="w-3.5 h-3.5 text-emerald-600 shrink-0" />
                      <span className="line-clamp-1">{item.location}</span>
                    </div>
                    <div className="font-semibold text-gray-700">
                      Quy mô: <span className="font-normal text-gray-500">{item.scale}</span>
                    </div>
                  </div>
                </div>

                <div className="pt-4 mt-4 border-t border-gray-100 flex items-center justify-between text-xs font-bold text-[#10243b] group-hover:text-emerald-700">
                  <span>{item.linkLabel}</span>
                  <ArrowRight className="w-3.5 h-3.5 group-hover:translate-x-1 transition-transform" />
                </div>
              </div>
            </CardLink>
          ))}
        </div>
      </div>
    </section>
  );
};

export default HomeShowcaseView;
