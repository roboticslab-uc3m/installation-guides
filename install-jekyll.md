# Install Jekyll

We use Jekyll to generate static web sites (and GitHub Pages uses it too!).

Official page: [link](https://jekyllrb.com).

## Install Jekyll (Ubuntu)

```bash
sudo apt install ruby2.3-dev # bundler requires Ruby version >= 2.3.0
sudo gem install bundler jekyll
```

## To be able to serve via Jekyll
Make sure your project has a file called `Gemfile` in its root with the following contents:
```
source 'https://rubygems.org'
gem 'github-pages', group: :jekyll_plugins
```

## Serve via Jekyll
```bash
bundle exec jekyll serve
```

Now browse to http://localhost:4000
