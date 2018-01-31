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
    assert_equal "-.-. .- -", @trans.convert_to_morse('cat')
    assert_equal "... --- -- .", @trans.convert_to_morse('SOME')
    assert_equal "-... --- -.. -.--", @trans.convert_to_morse("B?!!..O,..@d##y")
    assert_equal "... .--. .- -.-. . ... / .-- --- .-. -.-", @trans.convert_to_morse("spaces work")
    assert_equal ".---- .---- ..--- ..--- ---.. ..... -----", @trans.convert_to_morse("1122850")
  end

  def test_convert_file_to_morse
    assert_equal "-.. .. -.. / -.-- --- ..- / . ...- . .-. / .... . .- .-. / - .... . / - .-. .- --. . -.. -.-- / --- ..-. / -.. .- .-. - .... / .--. .-.. .- --. ..- . .. ... / - .... . / .-- .. ... .", 
    @trans.convert_file_to_morse('./tragedy.txt')
  end

  def test_convert_from_morse_method
    assert_equal 'cat', @trans.convert_from_morse('-.-. .- -')
    assert_equal 'younglings', @trans.convert_from_morse('-.-- --- ..- -. --. .-.. .. -. --. ...')
    assert_equal "8936740221", @trans.convert_from_morse('---.. ----. ...-- -.... --... ....- ----- ..--- ..--- .----')
  end

  def test_convert_file_from_morse
    assert_equal 'some body once told me the world is gonna roll me i aint the sharpest tool in the shed', @trans.convert_file_from_morse('./morse.txt')
  end

end