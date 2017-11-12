require 'pi_piper'
include PiPiper



class Morse
    def initialize(pin)
        @pin = PiPiper::Pin.new(pin: pin, direction: :out)
        
        @charset = {
            "a" => [ "dot", "dash" ],
            "b" => [ "dash", "dot", "dot", "dot" ],
            "c" => [ "dash", "dot", "dash", "dot" ],
            "d" => [ "dash", "dot", "dot" ],
            "e" => [ "dot" ],
            "f" => [ "dot", "dot", "dash", "dot" ],
            "g" => [ "dash", "dash", "dot" ],
            "h" => [ "dot", "dot", "dot", "dot" ],
            "i" => [ "dot", "dot" ],
            "j" => [ "dot", "dash", "dash", "dash" ],
            "k" => [ "dash", "dot", "dash" ],
            "l" => [ "dot", "dash", "dot", "dot" ],
            "m" => [ "dash", "dash" ],
            "n" => [ "dash", "dot" ],
            "o" => [ "dash", "dash", "dash" ],
            "p" => [ "dot", "dash", "dash", "dot" ],
            "q" => [ "dash", "dash", "dot", "dash" ],
            "r" => [ "dot", "dash", "dot" ],
            "s" => [ "dot", "dot", "dot" ],
            "t" => [ "dash" ],
            "u" => [ "dot", "dot", "dash" ],
            "v" => [ "dot", "dot", "dot", "dash" ],
            "w" => [ "dot", "dash", "dash" ],
            "x" => [ "dash", "dot", "dot", "dash" ],
            "y" => [ "dash", "dot", "dash", "dash" ],
            "z" => [ "dash", "dash", "dot", "dot" ],
            "1" => [ "dot", "dash", "dash", "dash", "dash" ],
            "2" => [ "dot", "dot", "dash", "dash", "dash" ],
            "3" => [ "dot", "dot", "dot", "dash", "dash" ],
            "4" => [ "dot", "dot", "dot", "dot", "dash" ],
            "5" => [ "dot", "dot", "dot", "dot", "dot" ],
            "6" => [ "dash", "dot", "dot", "dot", "dot" ],
            "7" => [ "dash", "dash", "dot", "dot", "dot" ],
            "8" => [ "dash", "dash", "dash", "dot", "dot" ],
            "9" => [ "dash", "dash", "dash", "dash", "dot" ],
            "0" => [ "dash", "dash", "dash", "dash", "dash" ]
        }
    end
    
    def	dot
        puts "."
        @pin.on
        sleep 0.25
        @pin.off
    end
    
    def	dash
        puts "_"
        @pin.on
        sleep 0.75
        @pin.off
    end
    
    def gap
        puts "|"
        sleep 0.25
    end
    
    def do_letter(letter)
        bu_letter = @charset[letter]
        bu_letter.each do |part|
            self.send(part)
            self.gap if part != bu_letter.last
        end
    end
    
    def letter_break
        sleep 0.75
    end
    
    def do_word(word)
        bu_word = word.split("")
        bu_word.each do |letter|
            self.do_letter(letter)
            self.letter_break if letter != bu_word.last
        end
    end
    
    def space
        sleep 1.75
    end
    
    def do_sentence(sentence)
        bu_sentence = sentence.split(" ")
        bu_sentence.each do |word|
            self.do_word(word)
            self.space if word != bu_sentence.last
        end
    end
    
    def get_msg
        msg = gets.chomp.downcase
        puts msg
        self.do_sentence(msg)
    end
end

m = Morse.new(4)
m.get_msg
