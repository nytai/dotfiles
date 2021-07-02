class Dotfiles < Thor
  include Thor::Actions
  Thor::Sandbox::Dotfiles.source_root(File.expand_path('..', __FILE__))

  @user = %x[whoami].chomp

  EXCLUDED_FILES = %w[
    bash_profile
  ]

  desc "install", "Install all dotfiles into #{@user}'s home directory"
  method_options %w( force -f ) => :boolean
  def install
    inside('home') do
      Dir['*'].each do |file|
        next if EXCLUDED_FILES.include?(file)
        link_file(file, "~#{@user}/.#{file}", options[:force])
      end
    end

    # fish
    link_file("#{Dir.pwd}/fish/config.fish", "~#{@user}/.config/fish/config.fish", options[:force])
    link_file("#{Dir.pwd}/fish/fish_variables", "~#{@user}/.config/fish/fish_variables", options[:force])
    link_file("#{Dir.pwd}/fish/functions", "~#{@user}/.config/fish/functions", options[:force])

    # bash_profile
    if File.exist?(File.expand_path("~#{@user}/.bash_profile"))
      copy_file("~#{@user}/.bash_profile", "~#{@user}/.bash_profile_backup_#{Time.now.to_i}")
      remove_file("~#{@user}/.bash_profile")
    end
    link_file("#{Dir.pwd}/home/bash_profile", "~#{@user}/.bash_profile", options[:force])
  end

  desc "install_vim", "Symlink vimrc and setup"
  def install_vim
    inside("vim") do
      run("echo \"runtime vimrc\" > ~#{@user}/.vimrc")
      link_file("#{Dir.pwd}", "~#{@user}/.vim", options[:force])
      run("vim +PlugInstall +qall")
      link_file("#{Dir.pwd}/plugged/vim-colorschemes/colors", "#{Dir.pwd}/colors", options[:force])
      link_file("#{Dir.pwd}/init.vim", "~#{@user}/.config/nvim/init.vim", options[:force])
    end
  end

  desc "install_subl", "Symlink sublime settings"
  def install_subl
    inside("~#{@user}/Library/Application\ Support/Sublime\ Text\ 3/Packages") do
      run("rm -rf User")
    end

    link_file("#{Dir.pwd}/.apps/sublime/User", "~#{@user}/Library/Application\ Support/Sublime\ Text\ 3/Packages/User", options[:force])
  end
end
