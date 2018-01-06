class String
    def parseAugments
        output = {}
        
        self.split("|").each do |augment|
            set = augment.split(":")
            output[set[0]] = set[1]
        end
        
        output.compact
    end
end

class Hash
    def encodeAugments
        output = "|"
        self.each {|augment,value| output += "#{augment}:#{value}|"}
        output
    end
end