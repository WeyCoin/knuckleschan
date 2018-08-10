var gulp = require('gulp'),
    sass = require('gulp-sass'),
    neat = require('node-neat').includePaths;

gulp.task('js', function(){
  return gulp
    .src('src/assets/js/*.js')
    .pipe(gulp.dest('public/js'));
});

gulp.task('sass', function () {
  return gulp
    .src('src/assets/scss/**/*.scss')
    .pipe(sass({ includePaths: ['styles'].concat(neat), indentedSyntax: true }))
    .pipe(gulp.dest('public/css'));
});

gulp.task('watch', function() {
  gulp.watch('src/assets/js/*.js', ['js']);
  gulp.watch('src/assets/scss/**/*.scss', ['sass']);
});

gulp.task('default', function() {
  gulp.start('js');
  gulp.start('sass');
  gulp.start('watch');
});