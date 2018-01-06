require_relative 'encoder.rb'
require 'socket'

$port = 2000

class Client
    attr_reader :hostname
    attr_reader :port

    def initialize(hostname = 'localhost', port = $PORT)
        @hostname = hostname
        @port = port
    end

    def sendMessage(type,augments,message = nil)
        s = TCPSocket.open('localhost', 2000)
        augments = augments.encodeAugments if augments.is_a? Hash
        s.puts type
        s.puts augments
        s.puts message
    end
end