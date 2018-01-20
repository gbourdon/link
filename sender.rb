require_relative 'encoder.rb'
require 'socket'

$port = 2000

class Client
    attr_reader :hostname # The name of the computer to connect to
    attr_reader :port # The specific port to connect with

    def initialize(hostname = 'localhost', port = $port) # Gives the client the info it needs to connect to a server
        @hostname = hostname
        @port = port
    end

    def sendMessage(type,augments,message = nil) # Sends a message in link format
        s = TCPSocket.open(@hostname, @port)
        augments = augments.encodeAugments if augments.is_a? Hash
        s.puts type
        s.puts augments
        s.puts message
    end
end