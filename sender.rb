require_relative 'encoder.rb'
require 'socket'

$port = 2000

class Client
    attr_reader :hostname # The name of the computer to connect to
    attr_reader :port # The specific port to connect with
    attr_reader :socket

    def initialize(hostname = 'localhost', port = $port) # Gives the client the info it needs to connect to a server
        @hostname = hostname
        @port = port
        @socket = TCPSocket.open(@hostname, @port)
    end

    def sendMessage(type,augments,message = nil) # Sends a message in link format
        augments = augments.encodeAugments if augments.is_a? Hash
        @socket.puts type
        @socket.puts augments
        @socket.puts message
    end
end