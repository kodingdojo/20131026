require "minitest/autorun"

class TestProbTableGenerator < Minitest::Test
  def gen(str)
  	{"a" => 1}
  end

  def test_single_char
    assert_equal( {'a' => 1}, gen('a') )
  end
end