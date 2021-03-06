server '34.216.165.178', roles: [:web, :app, :db], primary: true
set :domain, "www.wemakenoise.co"
set :repo_url,        'git@github.com:0910/noise.git'
set :application,     'noiseapp'
set :user,            'ubuntu'
set :rbenv_ruby, '2.2.3'

set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :rails_env,       :production
set :deploy_via,      :remote_cache
set :deploy_to,       "/home/ubuntu/applications/#{fetch(:application)}"
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }
set :assets_roles, [:web, :app]            # Defaults to [:web]
# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('shared/log', 'shared/pids', 'tmp/cache', 'shared/sockets', 'vendor/bundle', 'public/system', 'public/uploads')
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')

set :scm, :git
set :branch, :master
set :format, :pretty
set :log_level, :debug
set :keep_releases, 5



namespace :deploy do

  desc "Make sure local git is in sync with remote."
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/master`
        puts "WARNING: HEAD is not the same as origin/master"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial Deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      sudo 'service unicorn_noiseapp restart'
      sudo 'service nginx restart'
    end
  end


  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
