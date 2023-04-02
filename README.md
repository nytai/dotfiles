# Tai's Dotfiles

These are some of the files I need placed in the right places so that I can feel at home

## Installation (assuming homebrew is installed)

```bash
    git clone git://github.com/nytai/dotfiles
    cd dotfiles
    brew bundle
    rbenv install # install .ruby-version
    gem install bundler
    bundle install
    bundle exec thor dotfiles:install
    fisher update

    # install vim
    bundle exec thor dotfiles:install_vim
```

## Inspiration

These files are an amalgamation of configs, some original works, some copy+pasted from various corners or the inter-webs. Repo structure and general template inspired by [sferik/dotfiles](https://github.com/sferik/dotfiles)
