require_relative 'encoder.rb'
require 'socket'

class Message
    attr_reader :type
    attr_reader :augments
    attr_reader :message

    def initialize(type, augments, message = nil)
        augments = augments.parseAugments if augments.is_a? String
        @type = type
        @augments = augments
        @message = message
    end
end

class TCPSocket
    def getMessage
        type = self.gets.chomp
        augments = self.gets.chomp.parseAugments
        message = self.gets.chomp if augments["Message"] == "true"
        Message.new(type, augments,message)
    end
end