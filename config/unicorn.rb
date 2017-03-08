# set path to application
app_root = "/home/ubuntu/applications/festivals/current"
shared_path = "/home/ubuntu/applications/festivals/shared"
working_directory app_root

# Logging
stderr_path "#{shared_path}/log/unicorn.stderr.log"
stdout_path "#{shared_path}/log/unicorn.stdout.log"

# Set up socket location
listen "/tmp/unicorn.festivals.sock", :backlog => 64

# Set unicorn options
worker_processes 2
preload_app true
timeout 30

# Set master PID location
pid "#{app_root}/tmp/pids/unicorn.festivals.pid"
