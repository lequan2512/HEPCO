import { Award, Users, MapPin, Clock3 } from 'lucide-react';
import { motion } from 'motion/react';

const DEFAULT_STATS = [
  {
    value: '50+',
    label: 'NĂM KINH NGHIỆM',
    description: 'Gần nửa thế kỷ kiến tạo môi trường đô thị Huế',
    icon: Award,
  },
  {
    value: '100K+',
    label: 'HỘ DÂN & DOANH NGHIỆP',
    description: 'Khách hàng tin tưởng và đồng hành mỗi ngày',
    icon: Users,
  },
  {
    value: '100%',
    label: 'ĐỘ PHỦ ĐÔ THỊ',
    description: 'Mạng lưới thu gom và duy tu toàn diện khắp địa bàn',
    icon: MapPin,
  },
  {
    value: '24/7',
    label: 'ỨNG TRỰC & PHỤC VỤ',
    description: 'Sẵn sàng xử lý các sự cố vệ sinh môi trường',
    icon: Clock3,
  },
];

const ICONS = [Award, Users, MapPin, Clock3];

const HomeStats = ({ config }) => {
  const stats = Array.isArray(config) && config.length > 0
    ? config.map((item, idx) => ({
        ...item,
        icon: ICONS[idx % ICONS.length]
      }))
    : DEFAULT_STATS;

  return (
    <section className="bg-white border-b border-gray-200/80 py-6 sm:py-10 md:py-14">
      <div className="container mx-auto px-4 sm:px-6 lg:px-8 max-w-7xl">
        <div className="grid grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-6 lg:gap-10 lg:divide-x divide-gray-200/80 home-stats-grid">
          {stats.map((item, idx) => {
            const IconComponent = item.icon || Award;
            return (
              <motion.div
                key={idx}
                initial={{ opacity: 0, y: 16, filter: 'blur(3px)' }}
                whileInView={{ opacity: 1, y: 0, filter: 'blur(0px)', transitionEnd: { filter: 'none' } }}
                viewport={{ once: true }}
                transition={{ type: 'spring', visualDuration: 0.4, bounce: 0.3, delay: idx * 0.08 }}
                className="home-stat-card flex min-w-0 flex-col items-center rounded-xl bg-slate-50 px-2 py-4 text-center sm:px-4 lg:rounded-none lg:bg-transparent lg:py-0"
              >
                <motion.div
                  whileHover={{ scale: 1.1, rotate: 6 }}
                  transition={{ type: 'spring', visualDuration: 0.22, bounce: 0.45 }}
                  aria-hidden="true" className="w-10 h-10 sm:w-12 sm:h-12 rounded-2xl bg-emerald-50 text-emerald-700 flex items-center justify-center mb-2 sm:mb-4 shadow-xs border border-emerald-100"
                >
                  <IconComponent className="w-6 h-6 stroke-[2.2]" />
                </motion.div>
                <div className="text-3xl sm:text-4xl lg:text-5xl font-black text-[#10243b] tracking-tight mb-1 tabular-nums">
                  {item.value}
                </div>
                <div className="min-h-8 sm:min-h-10 flex items-start justify-center text-xs sm:text-sm leading-4 sm:leading-5 font-bold text-emerald-800 tracking-wide mb-2 uppercase">
                  {item.label}
                </div>
                <p className="text-xs sm:text-sm text-gray-500 max-w-[220px] leading-relaxed">
                  {item.description}
                </p>
              </motion.div>
            );
          })}
        </div>
      </div>
    </section>
  );
};

export default HomeStats;
