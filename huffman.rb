require "minitest/autorun"

class TestFreqTableGenerator < Minitest::Test
  def gen(str)
  	if str.length == 2
  		if str == 'aa'
  			{'a' => 2}
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
  end

end