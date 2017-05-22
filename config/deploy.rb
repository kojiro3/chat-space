# config valid only for current version of Capistrano
lock "3.8.1"

set :application, "chat-space"
set :repo_url, "git@github.com:kojiro3/chat-space.git"

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :rbenv_type, :user
set :rbenv_ruby, '2.3.1'

set :ssh_options, auth_methods: ['publickey'],
                  keys: ['~/.ssh/chat_space.pem']

set :unicorn_pid, -> { "#{shared_path}/tmp/pids/unicorn.pid" }
set :unicorn_config_path, -> { "#{current_path}/config/unicorn.rb" }

set :assets_roles, [:web, :app]

set :user, 'ec2-user'

after 'deploy:publishing', 'deploy:restart'
namespace :deploy do
  task :restart do
    invoke 'unicorn:restart'
  end
  after :updated, "assets:precompile"
end

namespace :assets do
  desc "Precompile assets locally and then rsync to web servers"
  task :precompile do
    on roles(:web) do
      rsync_host = host.to_s
      run_locally do
        with rails_env: fetch(:stage) do
          execute "rake assets:precompile"
        end

        execute 'rsync -av --delete public/assets/ #{fetch(:user)}@#{rsync_host}:#{shared_path}/public/assets/'
        execute "rm -rf public/assets"
      end

    end
  end
end
