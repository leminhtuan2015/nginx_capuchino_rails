# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'temona'
set :repo_url, 'git@github.com:leminhtuan2015/portal.git'

# Default branch is :master
set :branch, fetch(:branch, "test")

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, '/home/framgia/test_temona'


set :scm_passphrase, "12345678"

set :rails_env, "production"

set :deploy_via, :copy

set :default_shell, '/bin/bash -l'

set :use_sudo, true

set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      p "DONE DONE DONE................."
    end
  end

end
