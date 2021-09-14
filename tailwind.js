module.exports = {
  purge: {
    enabled: false,
    content: [
      './theme/**/*.html',
      './theme/**/*.php',
      './theme/**/*.vue',
      './theme/**/*.jsx',
    ],
  },
  theme: {
    fontFamily: {
      'fallback': ['Tahoma', 'sans-serif'],
      'sans': ['Goldman', 'Tahoma', 'system-ui', '-apple-system', 'BlinkMacSystemFont', 'Segoe UI', 'Roboto', "Helvetica Neue", 'Arial', "Noto Sans", 'sans-serif', "Apple Color Emoji", "Segoe UI Emoji", "Segoe UI Symbol", "Noto Color Emoji"],
    },
    screens: {
      'phone': '320px',
      'phone-wide': '480px',
      'phablet': '560px',
      'tablet-small': '640px',
      'tablet': '768px',
      'tablet-narrow': '992px',
      'tablet-wide': '1024px',
      'desktop': '1200px',
      'desktop-wide': '1440px',
      'full-hd': '1920px'
    },
    extend: {
      letterSpacing: {
        'pixel': '1px',
      },
      colors: {
        'primary': '#A8D727',
        'gray-blackish': '#0A0A0A',
        'gray-dark': '#666666',
        'gray-normal' : '#151515',
        'gray-light' : '#CBCBCB', 
      },
      minHeight: {
        'map': '400px'
      }
    },
  },
  variants: {
    container: [],
  },
  corePlugins: {
    container: false,
    gridTemplateColumns: false,
    gridColumn: false,
    gridColumnStart: false,
    gridColumnEnd: false,
    gridTemplateRows: false,
    gridRow: false,
    gridRowStart: false,
    gridRowEnd: false,
    gridAutoColumns: false,
    gridAutoRows: false,
    gridAutoFlow: false,
    gap: false,
  },
  plugins: [
    require('tailwindcss-gradients'),
    require('tailwindcss-blend-mode')(),
  ],
}