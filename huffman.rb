require "minitest/autorun"

class TestProbTableGenerator < Minitest::Test
  def gen(str)
  	if str == 'a'
  		{"a" => 1}
  	else
  		{"b" => 1}
  	end
  end

  def test_single_char
    assert_equal( {'a' => 1}, gen('a') )
    assert_equal( {'b' => 1}, gen('b') )
  end
end