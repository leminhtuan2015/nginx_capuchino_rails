root = "/home/framgia/nginx_capuchino_rails/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.phindee.sock"
worker_processes 2
timeout 30