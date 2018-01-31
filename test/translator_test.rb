require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/translator'

class TranslatorTest < MiniTest::Test

  def setup 
    @trans = Translator.new
  
  end

  def test_translator_exists
    assert_instance_of Translator, @trans
  end

  def test_convert_to_morse_method
    assert_equal "-.-..--", @trans.convert_to_morse('cat')
    assert_equal "...-----.", @trans.convert_to_morse('SOME')
    assert_equal "-...----..-.--", @trans.convert_to_morse("B?!!..O,..@d##y")
    assert_equal "....--..--.-..... .-----.-.-.-", @trans.convert_to_morse("spaces work")
    assert_equal ".----.----..---..------.......-----", @trans.convert_to_morse("1122850")
  end
end