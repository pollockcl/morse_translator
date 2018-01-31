require 'pry'
class Translator
  attr_reader :dictionary
  def initialize
    @dictionary = { "a" => ".-",
                    "b" => "-...",
                    "c" => "-.-.",
                    "d" => "-..",
                    "e" => ".",
                    "f" => "..-.",
                    "g" => "--.",
                    "h" => "....",
                    "i" => "..",
                    "j" => ".---",
                    "k" => "-.-",
                    "l" => ".-..",
                    "m" => "--",
                    "n" => "-.",
                    "o" => "---",
                    "p" => ".--.",
                    "q" => "--.-",
                    "r" => ".-.",
                    "s" => "...",
                    "t" => "-",
                    "u" => "..-",
                    "v" => "...-",
                    "w" => ".--",
                    "x" => "-..-",
                    "y" => "-.--",
                    "z" => "--..",
                    "1" => ".----",
                    "2" => "..---",
                    "3" => "...--",
                    "4" => "....-",
                    "5" => ".....",
                    "6" => "-....",
                    "7" => "--...",
                    "8" => "---..",
                    "9" => "----.",
                    "0" => "-----",
                    " " => "/"}
    @reversed = @dictionary.invert
  end

  def convert_to_morse(text)
    result = ''
    words = check_posture(text)

    words.chars.each do |char|
      result << "#{@dictionary.fetch(char)} "
    end

    result.strip
  end

  def convert_file_to_morse(filename)
    file = load_file(filename)
    convert_to_morse(file)
  end

  def convert_from_morse(text)
    result = []

    letters = text.split(' ')

    letters.each do |letter|
      result << @reversed.fetch(letter)
    end
    result.join
  end

  def convert_file_from_morse(filename)
    file = load_file(filename)
    convert_from_morse(file)
  end


  private

  def check_posture(text)
    text.strip!
    text.downcase!
    text.gsub!(/[[:punct:]]/, '')
    text
  end

  def load_file(filename)
    file = File.open(filename)
    extract = file.read
   
    file.close
    extract
  end

end