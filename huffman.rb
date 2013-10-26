require "minitest/autorun"

def gen_freq_table(str)
  freq_table = {}

  str.each_char do |chr|
    if freq_table[chr] == nil
      freq_table[chr] = 1
    else
      freq_table[chr] = freq_table[chr] + 1
    end
  end

  freq_table
end

class TestFreqTableGenerator < Minitest::Test
  
  def test_single_char
    # should return a dictionary with one key
    # and a value of 1 for a single-char string input
    assert_equal( {'a' => 1}, gen_freq_table('a') )
    assert_equal( {'b' => 1}, gen_freq_table('b') )
  end

  def test_doublely_duplicate_string
    # string with two duplicate chars => dictionary
    # with one key (the char) with value of 2
    assert_equal({'a' => 2}, gen_freq_table('aa'))
    assert_equal({'b' => 2}, gen_freq_table('bb'))
  end

  def test_string_with_two_different_chars
    # string with two different chars
    # => dictionary with two keys (the two chars)
    #    each having a value of 1
    assert_equal({'a' => 1, 'b' => 1}, gen_freq_table("ab"))
  end

end