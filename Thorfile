class Dotfiles < Thor
  include Thor::Actions
  Thor::Sandbox::Dotfiles.source_root(File.expand_path('..', __FILE__))
  @user = %x[whoami].chomp

  desc "install", "Install all dotfiles into #{@user}'s home directory"
  method_options %w( force -f ) => :boolean
  def install
    Dir['*'].each do |file|
      next if %w[Gemfile Gemfile.lock Thorfile README.md LICENSE.md fish vim bash_profile].include?(file)
      link_file(file, "~#{@user}/.#{file}", options[:force])
    end

    # fish
    link_file("#{Dir.pwd}/fish/config.fish", "~#{@user}/.config/fish/config.fish", options[:force])
    link_file("#{Dir.pwd}/fish/functions", "~#{@user}/.config/fish/functions", options[:force])

    # bash_profile
    copy_file("~#{@user}/.bash_profile", "~#{@user}/.bash_profile_backup_#{Time.now.to_i}")
    remove_file("~#{@user}/.bash_profile")
    link_file("#{Dir.pwd}/bash_profile", "~#{@user}/.bash_profile", options[:force])
  end

  desc "install_vim", "Symlink vimrc and setup"
  def install_vim
    inside("vim") do
      run("echo \"runtime vimrc\" > ~#{@user}/.vimrc")
      link_file("#{Dir.pwd}", "~#{@user}/.vim", options[:force])
      run("git clone https://github.com/VundleVim/Vundle.vim.git ./bundle/Vundle.vim")
      run("vim +PluginInstall +qall")
      link_file("#{Dir.pwd}/bundle/vim-colorschemes/colors", "#{Dir.pwd}/colors", options[:force])
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
