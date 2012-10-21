namespace :sub do
  desc 'update submodules'
  task :up do
    `git submodule foreach git pull origin master`
  end
  desc 'init submodules'
  task :init do
    `git submodule init && git submodule update`
  end
end
