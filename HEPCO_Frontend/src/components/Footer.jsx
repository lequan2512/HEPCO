import { useShowcase } from '../apis/showcase';
import { DEFAULT_FOOTER } from '../constants/showcase';
import { Mail, Phone, MapPin } from 'lucide-react';
import logo from '../assets/images/logo.png';

const Footer = () => {
  const { data } = useShowcase();
  const footer = { ...DEFAULT_FOOTER, ...data?.data?.footer };
  return (
    <footer className="bg-gradient-to-br from-green-900 to-hepco-green text-white relative overflow-hidden pt-10 pb-6">
      {/* Bong cau Truong Tien chim nhe tren nen song Huong */}
      <div className="absolute inset-x-0 bottom-0 pointer-events-none opacity-[0.14] overflow-hidden flex items-end justify-center select-none" aria-hidden="true">
        <svg
          className="w-full min-w-[760px] max-w-[1600px] h-28 sm:h-36 md:h-44 text-white"
          viewBox="0 0 1200 150"
          preserveAspectRatio="none"
          fill="none"
          stroke="currentColor"
        >
          <defs>
            <linearGradient id="truongTienWaterGrad" x1="0%" y1="0%" x2="0%" y2="100%">
              <stop offset="0%" stopColor="currentColor" stopOpacity="0.4" />
              <stop offset="100%" stopColor="currentColor" stopOpacity="0.0" />
            </linearGradient>
          </defs>

          {/* Duong mat cau ngang & lan can */}
          <line x1="0" y1="108" x2="1200" y2="108" strokeWidth="2.5" />
          <line x1="0" y1="112" x2="1200" y2="112" strokeWidth="1.2" />

          {/* 6 vai cau thep uon cong dac trung cua cau Truong Tien (6 nhip thep parabol) */}
          {[0, 200, 400, 600, 800, 1000].map((startX, idx) => {
            const midX = startX + 100;
            const endX = startX + 200;
            return (
              <g key={idx}>
                {/* Vanh thep tren parabol */}
                <path
                  d={`M ${startX + 4} 108 Q ${midX} 24 ${endX - 4} 108`}
                  strokeWidth="2.4"
                  strokeLinecap="round"
                />
                {/* Vanh thep song song ben trong */}
                <path
                  d={`M ${startX + 14} 108 Q ${midX} 35 ${endX - 14} 108`}
                  strokeWidth="1.2"
                />
                {/* Cac thanh thep giang dung (vertical truss members) */}
                <line x1={startX + 30} y1="108" x2={startX + 30} y2="82" strokeWidth="0.9" />
                <line x1={startX + 55} y1="108" x2={startX + 55} y2="58" strokeWidth="0.9" />
                <line x1={startX + 80} y1="108" x2={startX + 80} y2="39" strokeWidth="0.9" />
                <line x1={midX} y1="108" x2={midX} y2="31" strokeWidth="1.1" />
                <line x1={startX + 120} y1="108" x2={startX + 120} y2="39" strokeWidth="0.9" />
                <line x1={startX + 145} y1="108" x2={startX + 145} y2="58" strokeWidth="0.9" />
                <line x1={startX + 170} y1="108" x2={startX + 170} y2="82" strokeWidth="0.9" />

                {/* Cac thanh giang cheo (diagonal truss cross) */}
                <line x1={startX + 30} y1="82" x2={startX + 55} y2="108" strokeWidth="0.6" strokeDasharray="2,2" />
                <line x1={startX + 55} y1="58" x2={startX + 80} y2="108" strokeWidth="0.6" strokeDasharray="2,2" />
                <line x1={startX + 145} y1="58" x2={startX + 120} y2="108" strokeWidth="0.6" strokeDasharray="2,2" />
                <line x1={startX + 170} y1="82" x2={startX + 145} y2="108" strokeWidth="0.6" strokeDasharray="2,2" />

                {/* Tru cau (Piers) cam xuong mat nuoc */}
                <rect x={startX - 5} y="108" width="10" height="24" rx="2" fill="currentColor" fillOpacity="0.4" strokeWidth="1" />
              </g>
            );
          })}
          {/* Tru cau cuoi cung o mep phai */}
          <rect x="1195" y="108" width="10" height="24" rx="2" fill="currentColor" fillOpacity="0.4" strokeWidth="1" />

          {/* Mat nuoc song Huong lan tan phan chieu duoi chan cau */}
          <path
            d="M 0 126 C 100 123, 200 129, 300 126 C 400 123, 500 129, 600 126 C 700 123, 800 129, 900 126 C 1000 123, 1100 129, 1200 126"
            strokeWidth="1.2"
            strokeOpacity="0.6"
          />
          <path
            d="M 0 134 C 150 131, 300 137, 450 134 C 600 131, 750 137, 900 134 C 1050 131, 1200 135, 1200 134"
            strokeWidth="0.8"
            strokeOpacity="0.4"
          />
          <path
            d="M 0 142 C 200 139, 400 144, 600 142 C 800 139, 1000 144, 1200 142"
            strokeWidth="0.6"
            strokeOpacity="0.25"
          />
        </svg>
      </div>

      <div className="container mx-auto px-4 max-w-8xl relative z-10">
        <div className="grid grid-cols-1 md:grid-cols-2 gap-8 lg:gap-16">
          {/* Column 1: Logo & Intro */}
          <div className="col-span-1 flex flex-col justify-center">
            <div className="flex items-center gap-3 mb-4">
              <img
                src={logo}
                alt={footer.brand || 'HEPCO'}
                className="h-12 w-auto rounded-full bg-white p-1 shadow-md"
              />
              <span className="text-2xl font-extrabold tracking-widest text-transparent bg-clip-text bg-gradient-to-r from-white to-green-200">
                {footer.brand}
              </span>
            </div>
            <p className="text-sm leading-relaxed mb-6 text-green-50 text-pretty">
              {footer.description}
            </p>

            {/* Social Icons */}
            <div className="flex gap-3">
              <a
                href={footer.facebook || undefined}
                target="_blank"
                rel="noopener noreferrer"
                className="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center hover:bg-hepco-green transition-all hover:scale-110 shadow-md border border-white/5"
                title="Facebook"
              >
                <svg className="w-4 h-4 fill-current" viewBox="0 0 24 24">
                  <path d="M9 8h-3v4h3v12h5v-12h3.642l.358-4h-4v-1.667c0-.955.192-1.333 1.115-1.333h2.885v-5h-3.808c-3.596 0-5.192 1.583-5.192 4.615v3.385z" />
                </svg>
              </a>
              <a
                href={footer.email ? "mailto:" + footer.email : undefined}
                target="_blank"
                rel="noopener noreferrer"
                className="w-8 h-8 rounded-full bg-white/10 flex items-center justify-center hover:bg-hepco-green transition-all hover:scale-110 shadow-md border border-white/5"
                title="Gửi Email"
              >
                <Mail className="w-4 h-4" />
              </a>
            </div>
          </div>

          {/* Column 2: Contact Info */}
          <div className="col-span-1">
            <h3 className="text-lg font-bold mb-5 relative inline-block text-white">
              {footer.contactTitle}
              <div className="absolute -bottom-2 left-0 w-12 h-1 bg-hepco-green rounded-full"></div>
            </h3>
            <div className="space-y-4 text-sm text-green-50">
              <p className="font-extrabold uppercase leading-snug text-white">
                {footer.companyName}
              </p>
              <div className="flex gap-3 items-start group">
                <div className="bg-white/10 p-1.5 rounded-md group-hover:bg-hepco-green transition-colors">
                  <MapPin className="w-4 h-4 text-white" />
                </div>
                <p>{footer.address}</p>
              </div>
              <div className="flex gap-3 items-start group">
                <div className="bg-white/10 p-1.5 rounded-md group-hover:bg-hepco-green transition-colors">
                  <Phone className="w-4 h-4 text-white" />
                </div>
                <p>
                  Hotline / Đường dây nóng:{' '}
                  <a href={footer.hotline ? "tel:" + footer.hotline.replace(/[^+\d]/g, "") : undefined} className="font-bold text-white hover:underline">
                    {footer.hotline}
                  </a>
                </p>
              </div>
            </div>
          </div>
        </div>

        {/* Copyright */}
        <div className="mt-8 pt-4 border-t border-white/20 text-center text-xs text-green-100 flex flex-col md:flex-row justify-between items-center gap-2">
          <p>© {new Date().getFullYear()} {footer.copyright}</p>
          <p className="opacity-70">{footer.credit}</p>
        </div>
      </div>
    </footer>
  );
};

export default Footer;
