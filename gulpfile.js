var gulp = require('gulp'),
    sass = require('gulp-sass'),
    neat = require('node-neat').includePaths

gulp.task('js', function() {
  return gulp
    .src('src/assets/js/*.js')
    .pipe(gulp.dest('public/js'))
})