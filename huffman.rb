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
  attr_accessor :freq, :value, :left, :right, :parent

  def initialize(freq, value)
    @freq = freq
    @value = value
  end

  def join_with(other_node)
    parent_freq = @freq + other_node.freq
    parent_node = HuffmanNode
                  .new(freq = parent_freq, value = nil)

    if self.freq < other_node.freq
      parent_node.left = other_node
      parent_node.right = self
    else
      parent_node.left = self
      parent_node.right = other_node
    end

    self.parent = parent_node
    other_node.parent = parent_node

    parent_node
  end

  def to_bit_string
    if @parent != nil
      if parent.left == self
        bit = 0
      else
        bit = 1
      end
      parent.to_bit_string + bit.to_s
    else
      ""
    end
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

class TestBuildTree < Minitest::Test
  def test_create_node
    mock_node = HuffmanNode.new(freq = 1, value = 'm')

    assert_equal( nil, mock_node.left)
    assert_equal( nil, mock_node.right)
    assert_equal( 'm', mock_node.value)
    assert_equal( 1, mock_node.freq)
  end

  def test_join_two_nodes_equal_keys
    node_1 = HuffmanNode.new(freq = 1, value = 'a')
    node_2 = HuffmanNode.new(freq = 1, value = 'b')

    aParentNode = node_1.join_with node_2

    assert_equal(node_1, aParentNode.left)
    assert_equal(node_2, aParentNode.right)
    assert_equal(2, aParentNode.freq)
  end

  def test_join_two_nodes_different_keys
    # In this case, node_1 should be on the right
    # node_1 on the left since 1 < 9
    node_1 = HuffmanNode.new(freq = 1, value = 'a')
    node_2 = HuffmanNode.new(freq = 9, value = 'b')

    aParentNode = node_1.join_with node_2

    assert_equal(node_1, aParentNode.right)
    assert_equal(node_2, aParentNode.left)
    assert_equal(10, aParentNode.freq)
  end

  def test_join_three_nodes_different_freq
    # In this case, node_1 should be on the right
    # node_1 on the left since 1 < 9
    node_1 = HuffmanNode.new(freq = 1, value = 'a')
    node_2 = HuffmanNode.new(freq = 2, value = 'b')
    node_3 = HuffmanNode.new(freq = 3, value = 'c')

    aParentNode_1 = node_1.join_with node_2
    aParentNode_2 = aParentNode_1.join_with node_3

    assert_equal(node_1, aParentNode_1.right)
    assert_equal(node_2, aParentNode_1.left)
    assert_equal(3, aParentNode_1.freq)

    assert_equal(node_3, aParentNode_2.right)
    assert_equal(aParentNode_1, aParentNode_2.left)
    assert_equal(6, aParentNode_2.freq)
  end

end

class TestTraverseTree < Minitest::Test
  def test_two_similar_leaves
    node_1 = HuffmanNode.new(freq = 1, value = 'a')
    node_2 = HuffmanNode.new(freq = 1, value = 'b')

    parent = node_1.join_with node_2

    bit_string_1 = node_1.to_bit_string
    bit_string_2 = node_2.to_bit_string

    assert_equal("0", bit_string_1)
    assert_equal("1", bit_string_2)
  end
end