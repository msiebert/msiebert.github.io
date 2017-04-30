docker run --rm -v $PWD/..:/usr/src/app -p 4000:4000 starefossen/github-pages:latest \
  bundle exec jekyll serve --config _config.yml --host 0.0.0.0
