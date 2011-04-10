set :application, 'demo'
set :rails_env, :production
set :deploy_to, "/kunden/319885_84085/sites/#{application}_staging"

set :use_sudo, false

default_run_options[:pty] = true
set :scm, :git
set :git_enable_submodules, 1

set :scm_passphrase, "xxxxxx"
set :user, "xxxxxxx"

# use local copy
set :copy_strategy, :export
set :deploy_via, :copy
set :copy_cache, true
set :copy_exclude, ['.git']
set :repository, "git@github.com:heuschrecke/#{application}.git"

role :app, 'kraeftemessen.de'
role :web, 'kraeftemessen.de'
role :db,  'kraeftemessen.de', :primary => true

set :user, 'ssh-xxxxx-df'
ssh_options[:port] = '22'
set :ssh_options, { :forward_agent => true }

# Restart mod_rails
namespace :deploy do
  task :restart, :roles => :app do             
    run "touch #{current_release}/tmp/restart.txt"
  end
end