puts "Zeus Time Server Basic [Version Beta 0.5.0]"; puts
require 'socket'
require_relative '../reciever.rb'

server = TCPServer.open(2000)

loop do
    Thread.start(server.accept) do |client|
        message = client.getMessage

        puts "Connection from : #{message.augments["Sender"] != nil ? message.augments["Sender"] : "Unknown Client"}"

        if message.augments["Format"] != nil
            client.puts Time.now.strftime(message.augments["Format"])
        else
            client.puts Time.now.ctime
        end
    end
end