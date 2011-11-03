# -*- coding: utf-8 -*-
# Minimal sample configuration file for Unicorn (not Rack) when used
# with daemonization (unicorn -D) started in your working directory.
#
# See http://unicorn.bogomips.org/Unicorn/Configurator.html for complete
# documentation.
# See also http://unicorn.bogomips.org/examples/unicorn.conf.rb for
# a more verbose configuration using more features.

#listen 2007 # by default Unicorn listens on port 8080
listen File.expand_path('tmp/sockets/unicorn.sock', ENV['RAILS_ROOT'])
worker_processes 2 # this should be >= nr_cpus

#pid "/path/to/app/shared/pids/unicorn.pid"
#pid ENV['RAILS_ROOT'] + "unicorn.pid"
pid "/home/asonas/www/gekibun/unicorn.pid" #各自環境に合わせてね



preload_app true

before_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

  old_pid = "#{ server.config[:pid] }.oldbin"
  unless old_pid == server.pid
    begin
      # SIGTTOU だと worker_processes が多いときおかしい気がする
      Process.kill :QUIT, File.read(old_pid).to_i
    rescue Errno::ENOENT, Errno::ESRCH
    end
  end
end

after_fork do |server, worker|
  defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end

stderr_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
stdout_path File.expand_path('log/unicorn.log', ENV['RAILS_ROOT'])
