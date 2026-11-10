import Hero from '../../../components/Hero';
import HomeStats from '../../../components/HomeStats';
import CoreValues from '../../../components/CoreValues';
import HomeServices from '../../../components/HomeServices';
import HomeOccasions from '../../../components/HomeOccasions';
import HomeWhyChoose from '../../../components/HomeWhyChoose';
import HomeShowcase from '../../../components/HomeShowcase';
import HomeTestimonials from '../../../components/HomeTestimonials';
import HomeCtaBanner from '../../../components/HomeCtaBanner';
import HomeImageSlider from '../../../components/HomeImageSlider';
import NewsPartnersAwards from '../../../components/NewsPartnersAwards';
import FaqContact from '../../../components/FaqContact';
import ScrollAnimation from '../../../components/ScrollAnimation';

import { useShowcase } from '../../../apis/showcase';

const components = {
  hero: Hero,
  stats: HomeStats,
  utilities: CoreValues,
  services: HomeServices,
  sectors: HomeOccasions,
  why: HomeWhyChoose,
  showcase: HomeShowcase,
  banners: HomeImageSlider,
  testimonials: HomeTestimonials,
  cta: HomeCtaBanner,
  news: NewsPartnersAwards,
  faq: FaqContact,
};

const defaultSections = Object.keys(components).map((id) => ({ id, visible: true }));

const Home = () => {
  const { data } = useShowcase();
  const homeConfig = data?.data || {};
  const sections = homeConfig.sections ?? defaultSections;
  const quickServicesIndexes = sections.reduce((indexes, section, index) => {
    if (section?.visible && (section.id === 'utilities' || section.id === 'services')) {
      indexes[section.id] = index;
    }
    return indexes;
  }, {});
  const canGroupQuickServices = Number.isInteger(quickServicesIndexes.utilities)
    && Number.isInteger(quickServicesIndexes.services);
  const quickServicesStart = canGroupQuickServices
    ? Math.min(quickServicesIndexes.utilities, quickServicesIndexes.services)
    : -1;

  return (
    <div className="w-full bg-white overflow-hidden">
      {sections.map(({ id, visible }, index) => {
        if (canGroupQuickServices && (id === 'utilities' || id === 'services')) {
          if (index !== quickServicesStart) return null;
          return (
            <div className="home-quick-services-group" key="home-quick-services">
              <ScrollAnimation animation="fade-up">
                <CoreValues config={homeConfig.utilities} />
              </ScrollAnimation>
              <ScrollAnimation animation="fade-up">
                <HomeServices />
              </ScrollAnimation>
            </div>
          );
        }
        const Section = components[id];
        if (!visible || !Section) return null;
        const sectionProps = {
          config: id === 'utilities' ? homeConfig.utilities : homeConfig[id],
          homeConfig
        };
        if (id === 'hero' || id === 'stats') return <Section key={id} {...sectionProps} />;
        return (
          <ScrollAnimation key={id} animation="fade-up">
            <Section {...sectionProps} />
          </ScrollAnimation>
        );
      })}
    </div>
  );
};

export default Home;

