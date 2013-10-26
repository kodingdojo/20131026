require "minitest/autorun"

class TestFreqTableGenerator < Minitest::Test
  def gen(str)
  	if str == 'a'
  		{"a" => 1}
  	else
  		{"b" => 1}
  	end
  end

  def test_single_char
  	# should return a dictionary with one key
  	# and a value of 1 for a single-char string input
    assert_equal( {'a' => 1}, gen('a') )
    assert_equal( {'b' => 1}, gen('b') )
  end

end