# Rakefile
#
# Simple tasks for managing my .vim files

FILES_TO_LINK = %w{vimrc gvimrc}
LOCALS = %w{.vimrc.local.before .vimrc.local}

desc 'Runs everything you need to get started'
task :bootstrap do
  puts "Installing NeoBundle"
  `mkdir -p ~/.vim/bundle`
  `git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim`
  puts "Done installing NeoBundle"

  Rake::Task["go:install_packages"].invoke

  puts

  puts "Creating local config files... "
  Rake::Task["vim:create_locals"].invoke
  puts "Done creating locals"

  puts

  puts "Symlinking... "
  Rake::Task["vim:link"].invoke
  puts "Done symlinking"
end

namespace :go do
  desc 'Install go packages to help with editing'
  task :install_packages do
    if system("which go")
      puts "Installing go packages..."
      gopackages = [
        'code.google.com/p/go.tools/cmd/godoc',
        'code.google.com/p/go.tools/cmd/vet',
        'code.google.com/p/go.tools/cmd/goimports',
        'code.google.com/p/rog-go/exp/cmd/godef',
        'github.com/golang/lint/golint',
        'github.com/nsf/gocode',
        'github.com/jstemmer/gotags'
      ]

      gopackages.each do |p|
        system("go get -u -v #{p}")
      end
      puts "Done installing go packages"
    end
  end
end

namespace :vim do 
  desc 'Create local configs'
  task :create_locals do
    require 'fileutils'
    LOCALS.each do |file|
      dot_file = File.expand_path("~/#{file}")
      FileUtils.touch dot_file
    end
  end

  desc 'Create symlinks'
  task :link do
    begin
      FILES_TO_LINK.each do |file|
        dot_file = File.expand_path("~/.#{file}")
        if File.exists? dot_file
          puts "#{dot_file} already exists, skipping link."
        else
          File.symlink(".vim/#{file}", dot_file)
          puts "Created link for #{file} in your home folder."
        end
      end
    rescue NotImplementedError
      puts "File.symlink not supported, you must do it manually."
      if RUBY_PLATFORM.downcase =~ /(mingw|win)(32|64)/
        puts 'Windows 7 use mklink, e.g.'
        puts '  mklink _vimrc .vim\vimrc'
      end
    end
  end
end

