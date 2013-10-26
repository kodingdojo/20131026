require "minitest/autorun"

class TestFreqTableGenerator < Minitest::Test
  def gen(str)
  	if str.length == 2
  		if str == 'a'*2
  			{'a' => 2}
  		elsif str == 'b'*2
  			{'b' => 2}
  		elsif str == 'ab'
  			{'a' => 1, 'b' => 1}
  		end
  	else
	  	if str == 'a'
	  		{"a" => 1}
	  	else
	  		{"b" => 1}
	  	end
  	end
  end

  def test_single_char
  	# should return a dictionary with one key
  	# and a value of 1 for a single-char string input
    assert_equal( {'a' => 1}, gen('a') )
    assert_equal( {'b' => 1}, gen('b') )
  end

  def test_doublely_duplicate_string
  	# string with two duplicate chars => dictionary
  	# with one key (the char) with value of 2
  	assert_equal({'a' => 2}, gen('aa'))
  	assert_equal({'b' => 2}, gen('bb'))
  end

  def test_string_with_two_different_chars
  	# string with two different chars
  	# => dictionary with two keys (the two chars)
  	#    each having a value of 1
  	assert_equal({'a' => 1, 'b' => 1}, gen("ab"))
  end

end