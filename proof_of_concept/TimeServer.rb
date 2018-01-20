puts "Zeus Time Server [Version Beta 0.5.0]"; puts

print "Loading Requirements..."

def colorize(text, color_code)
    "\e[#{color_code}m#{text}\e[0m"
end
  
def red(text); colorize(text, 31); end
def green(text); colorize(text, 32); end

require 'socket'
require_relative '../reciever.rb'
puts "  [#{green("Ready")}]"

print "Opening Server..."
server = TCPServer.open(2000)
puts "  [#{green("Ready")}]"; puts

loop do
    Thread.start(server.accept) do |client|
        message = client.getMessage

        puts "Connection from :#{message.augments["Name"] != nil ? message.augments["Name"] : "Unknown Client"}"

        case message.type
            when "TIME"
                unless message.augments["Format"] != nil
                    client.puts Time.now.strftime(message.augments["Format"])
                else
                    client.puts Time.now.ctime
                end
            else
                client.puts "ERROR: Server doesn't handle queries for #{message.type}"
            end
    end
end