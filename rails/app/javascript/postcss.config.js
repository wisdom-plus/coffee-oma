const postcss_import = require("postcss-import");
const flexbugs = require("postcss-flexbugs-fixes");

module.exports = {
  plugins: [
    postcss_import,
    flexbugs,
    require("postcss-preset-env")({
      autoprefixer: {
        flexbox: "no-2009",
      },
      stage: 3,
    }),
  ],
};
