import { Effect } from '@animate-ui/react/primitives/effects/effect';

const ScrollAnimation = ({
  children,
  animation = 'fade-up',
  delay = 0,
  className = ''
}) => {
  const slideByAnimation = {
    'fade-up': { direction: 'up', offset: 12 },
    'fade-down': { direction: 'down', offset: 12 },
    'fade-left': { direction: 'left', offset: 12 },
    'fade-right': { direction: 'right', offset: 12 }
  };

  return (
    <Effect
      inView
      inViewOnce={false}
      inViewMargin="-64px 0px"
      delay={delay}
      fade={{ initialOpacity: 0.08 }}
      blur={{ initialBlur: 2 }}
      slide={animation === 'zoom-in' ? false : slideByAnimation[animation] || slideByAnimation['fade-up']}
      zoom={animation === 'zoom-in' ? { initialScale: 0.98 } : false}
      className={className}
    >
      {children}
    </Effect>
  );
};

export default ScrollAnimation;
