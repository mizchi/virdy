gulp   = require 'gulp'
coffee = require 'gulp-coffee'
gulp.task 'build:coffee', ->
  gulp.src('src/**/*.coffee')
    .pipe(coffee())
    .pipe(gulp.dest('lib'))

gulp.task 'default', ['build:coffee']
gulp.task 'watch', ['build:coffee'], ->
  gulp.watch 'src/**/*.coffee', ['build:coffee']
