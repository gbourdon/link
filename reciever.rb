require_relative 'encoder.rb'
require 'socket'

class Message
    attr_reader :type # The type of message ex. QUERY
    attr_reader :augments # The augments, sent in the fourm of a hash
    attr_reader :message # The message itself, only required if the Message flag is set to true.

    def initialize(type, augments, message = nil)
        augments = augments.parseAugments if augments.is_a? String
        @type = type
        @augments = augments
        @message = message
    end
end

class TCPSocket # Client
    def getMessage # Gets a message in link format
        type = self.gets.chomp
        augments = self.gets.chomp.parseAugments
        message = self.gets.chomp if augments["Message"] == "true"
        Message.new(type, augments,message)
    end
end