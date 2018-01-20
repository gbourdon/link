require_relative '../sender.rb'

client = Client.new

client.sendMessage("TIME",{"Sender" => client.hostname, "Message" => 'false'})
puts client.socket.gets.chomp