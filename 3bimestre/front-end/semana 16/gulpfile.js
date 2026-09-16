const { src, dest, watch, series } = require("gulp");
const sass = require("gulp-sass")(require("sass"));
const cleanCSS = require("gulp-clean-css");

function styles() {
  return src("src/scss/style.scss")
    .pipe(sass().on("error", sass.logError))
    .pipe(cleanCSS())
    .pipe(dest("."));
}

function watchFiles() {
  watch("src/scss/**/*.scss", styles);
}

exports.styles = styles;
exports.watch = series(styles, watchFiles);
