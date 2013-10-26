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

class HuffmanNode
  attr_accessor :freq, :value, :left, :right

  def initialize(freq, value)
    @freq = freq
    @value = value
  end

  def join_with(other_node)
    parent_freq = @freq + other_node.freq
    parent_node = HuffmanNode
                  .new(freq = parent_freq, value = nil)

    parent_node.left = self
    parent_node.right = other_node
    
    parent_node
  end

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

class TestTreeNode < Minitest::Test
  def test_create_node
    mock_node = HuffmanNode.new(freq = 1, value = 'm')

    assert_equal( nil, mock_node.left)
    assert_equal( nil, mock_node.right)
    assert_equal( 'm', mock_node.value)
    assert_equal( 1, mock_node.freq)
  end

  def test_append_two_child_nodes_are_equal
    node_1 = HuffmanNode.new(freq = 1, value = 'a')
    node_2 = HuffmanNode.new(freq = 1, value = 'b')

    aParentNode = node_1.join_with node_2

    assert_equal(node_1, aParentNode.left)
    assert_equal(node_2, aParentNode.right)
  end
end
