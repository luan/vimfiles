#!/usr/bin/env ruby

pipe_path = File.join(ENV['HOME'], 'test_server_pipe')
`mkfifo #{pipe_path}` unless File.exists?(pipe_path)

system "clear"
puts "Opened pipe #{pipe_path}"

File.open pipe_path, 'w+' do |file|
  loop do
    command = file.gets
    system "clear"
    puts command
    system "time #{command}"
  end
end

