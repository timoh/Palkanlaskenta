load 'deploy' if respond_to? :namespace

set :domain, "palkanlaskenta.efekta.fi"
set :application, "palkanlaskenta.efekta.fi"
set :deploy_to, "/home/timo/rails/Palkanlaskenta/public"
set :repository, "git@github.com:timoh/Palkanlaskenta.git"
set :scm, :git
set :user, "timo"

server "efekta.fi", :app, :web, :db, :primary => true

after "deploy:symlink", "deploy:copy_config"

namespace :deploy do

  desc "Copy existing config files."
  task :copy_config do
    IGNORE = ['Capfile']

    run "cat #{latest_release}/.gitignore" do |channel, stream, data|
      data.split(/\n/).each do |f|
        next if IGNORE.include?(f)
        begin
          run "/bin/ls #{previous_release}/#{f}"
        rescue Capistrano::Error => e
          next
        end
        run "cp -rf #{previous_release}/#{f} #{latest_release}/#{f}"
      end
    end
  end

  task :migrate do; end

  task :restart do; end

  task :start do; end

end