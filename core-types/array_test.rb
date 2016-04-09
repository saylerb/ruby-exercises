gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require 'minitest/homework'

class ArrayTest < Minitest::Homework
  be_gentle!

  def test_empty
    assert_equal true, [].empty?
    assert_equal false, [1,2,3].empty?
  end

  def test_first
    assert_equal nil, [].first
    assert_equal :a, [:a, :b, :c].first
    assert_equal "spoon", ["spoon"].first
  end

  def test_last
    assert_equal nil, [].last
    assert_equal :c, [:a, :b, :c].last
    assert_equal "spoon", ["spoon"].last
  end

  def test_access
    assert_equal nil, [][0]
    assert_equal "a", ["a", "b", "c"][0]
    assert_equal "b", ["a", "b", "c"][1]
    assert_equal "c", ["a", "b", "c"][-1]
    assert_equal "b", ["a", "b", "c"][-2]
    assert_equal nil, ["a", "b", "c"][4]
  end

  def test_index
    assert_equal 0, ["a", "b", "c"].index("a")
    assert_equal 1, ["a", "b", "c"].index("b")
    assert_equal 2, ["a", "b", "c"].index("c")
    assert_equal nil, ["a", "b", "c"].index("d")
  end

  def test_join
    assert_equal "", [].join
    assert_equal "", [].join(' ')
    assert_equal "", [].join(' - ')
    assert_equal "", [].join(' and ')
    assert_equal "abc", ["a", "b", "c"].join
    assert_equal "abc", ["a", "b", "c"].join("")
    assert_equal "a b c", ["a", "b", "c"].join(" ")
    assert_equal "a - b - c", ["a", "b", "c"].join(" - ")
    assert_equal "a and b and c", ["a", "b", "c"].join(" and ")
  end

  def test_length
    assert_equal 0, [].length
    assert_equal 1, [:a].length
    assert_equal 2, [:a, :b].length
    assert_equal 3, [:a, :b, :c].length
  end

  def test_reverse
    assert_equal [3, 2, 1], [1, 2, 3].reverse
    assert_equal [:c, :b, :a], [:a, :b, :c].reverse
  end

  def test_take
    assert_equal [], [].take(1) #take method on empty array returns empty array
    assert_equal [], [].take(2)
    assert_equal ["a", "b", "c"], ["a", "b", "c", "d", "e"].take(3)

    words = ["fish", "boy", "pumpkin", "flower"]
    assert_equal ["fish", "boy"], words.take(2)
    assert_equal ["fish", "boy", "pumpkin", "flower"], words
  end

  def test_plus
    a1 = [] + []
    a2 = [] + [:a]
    a3 = [:a] + [:b]
    a4 = [:a, :b] + [:b, :c]

    assert_equal [], a1
    assert_equal [:a], a2
    assert_equal [:a, :b], a3
    assert_equal [:a, :b, :b, :c], a4
  end

  def test_concat
    assert_equal [:a], [].concat([:a])
    assert_equal [:a, :b], [:a].concat([:b])
    assert_equal [:a, :b, :b, :c], [:a, :b].concat([:b, :c])
  end

  def test_shovel
    a1 = [] << []
    a2 = [] << nil
    a3 = [] << :a
    a4 = [:a] << :b
    a5 = [:a, :b] << :c
    a6 = [:a, :b] << :b

    assert_equal [[]], a1
    assert_equal [nil], a2
    assert_equal [:a], a3
    assert_equal [:a, :b], a4
    assert_equal [:a, :b, :c], a5
    assert_equal [:a, :b, :b], a6
  end

  def test_minus
    # With arrays, minus sign a - b  will
    # returns elements that are in a, but not b
    a1 = [] - []
    a2 = [:a] - []
    a3 = [:a, :b, :c] - [:a]
    a4 = [:a, :b, :c] - [:a, :b]
    a5 = [:a, :b, :a, :c, :a] - [:a]

    assert_equal [], a1 # subracted "nothing" from  empty array 
    assert_equal [:a], a2
    assert_equal [:b, :c], a3
    assert_equal [:c], a4
    assert_equal [:b, :c], a5 # the subtracted array will remove all matching elements
  end

  def test_pipe
    # pipe is the bitwise OR operator
    # with arrays, it will return the elements that are in a or b
    a1 = [] | []
    a2 = [] | [:a]
    a3 = [:a] | [:b]
    a4 = [:a, :b] | [:b, :c]
    a5 = [:a, :b, :b] | [:b, :b, :c]

    assert_equal [], a1
    assert_equal [:a], a2
    assert_equal [:a, :b], a3
    assert_equal [:a, :b, :c], a4
    assert_equal [:a, :b, :c], a5
  end

  def test_ampersand
    # amptersand '&' is the bitwise AND operator
    # with arrays, it will only return elements in both
    a1 = [] & []
    a2 = [] & [:a]
    a3 = [:a] & [:b]
    a4 = [:a, :b] & [:b, :c]
    a5 = [:a, :b, :b] & [:b, :b, :c]

    assert_equal [], a1
    assert_equal [], a2
    assert_equal [], a3
    assert_equal [:b], a4
    assert_equal [:b], a5 # if repeats, it will only return a single
  end

  class Wrapper
    attr_reader :value
    def initialize(value)
      @value = value
    end

    def inspect
      "#<Wrapper #{object_id}>"
    end
  end

  def test_intersection_of_objects
    a = Wrapper.new(:a)
    b = Wrapper.new(:b)
    b1 = Wrapper.new(:b)
    b2 = Wrapper.new(:b)
    c = Wrapper.new(:c)

    a1 = [a, b] & [b, c]
    a2 = [a, b1] & [b2, c]
    a3 = [a, b1, b2] & [b1, b2, c]

    assert_equal [b], a1
    assert_equal [], a2
    assert_equal [b1, b2], a3
  end

  def test_uniq
    # uniq returns an empty array with an empty array
    assert_equal [], [].uniq
    assert_equal [:a], [:a].uniq
    assert_equal [:a, :b], [:a, :a, :a, :b].uniq
  end

  # Adds item and returns the new array:
  #  - `push` appends
  #  - `unshift` prepends (whole list move right one index number)
  # Remove item and returns item that was removed
  # - `shift` removes first item (whole list moves left one index number)
  # - `pop` removes last item


  def test_push
    # appends to an array, and returns the array itself (can be chained)
    assert_equal [:a], [].push(:a)
    assert_equal [nil], [].push(nil)
    assert_equal [[]], [].push([])
    assert_equal [:a, :b], [:a].push(:b)
    assert_equal [:a, :b, :c], [:a, :b].push(:c)
    assert_equal [1, "apple", :c,["fish", 7, :x]], [1, "apple", :c].push(["fish", 7, :x])
  end

  def test_shift
    # removes FIRST item, and returns the item removed)
    assert_equal nil, [].shift
    assert_equal :a, [:a].shift
    assert_equal :a, [:a, :b].shift
  end

  def test_pop
    # like shift, removes the LAST item, and returns the item
    assert_equal nil, [].pop
    assert_equal :a, [:a].pop
    assert_equal :b, [:a, :b].pop
  end

  def test_unshift
    # prepends item, and returns the new array itselft (can be chained)
    assert_equal [:a], [].unshift(:a)
    assert_equal [nil], [].unshift(nil)
    assert_equal [[]], [].unshift([])
    assert_equal [:b, :a], [:a].unshift(:b)
    assert_equal [:c, :a, :b], [:a, :b].unshift(:c)
    assert_equal [["fish", 7, :x],1, "apple", :c], [1, "apple", :c].unshift(["fish", 7, :x])
  end

  def test_parallel_assignment
    fruit = ["apple", "banana", "cherry", "dewberry"]

    a, b, c, d = fruit
    assert_equal "apple", a
    assert_equal "banana", b
    assert_equal "cherry", c
    assert_equal "dewberry", d

    a, b = fruit
    assert_equal "apple", a
    assert_equal "banana", b

    a, *b = fruit
    # the asterisk consumes the remaining elements
    assert_equal "apple", a
    assert_equal ["banana", "cherry", "dewberry"], b

    *a, b = fruit
    # consumes all but the last element
    assert_equal ["apple", "banana", "cherry"], a
    assert_equal "dewberry", b

    a, b, *c = fruit
    assert_equal "apple", a
    assert_equal "banana", b
    assert_equal ["cherry", "dewberry"], c

    *a, b, c = fruit
    assert_equal ["apple", "banana"], a
    assert_equal "cherry", b
    assert_equal "dewberry", c

    a, *b, c = fruit
    assert_equal "apple", a
    assert_equal ["banana", "cherry"], b
    assert_equal "dewberry", c
  end

  def test_delete
    # deletes all items that match, and returns last item deleted
    protein = ["fish", "bacon", "chicken", "bacon", "bacon", "steak"]

    deleted = protein.delete("fish")
    assert_equal "fish", deleted
    assert_equal ["bacon", "chicken", "bacon", "bacon", "steak"], protein

    deleted = protein.delete("bacon")
    assert_equal "bacon", deleted
    assert_equal ["chicken", "steak"], protein
  end

  def test_delete_at
    veggies = ["carrot", "parsnip", "courgette"]
    veggie = veggies.delete_at(1)
    assert_equal "parsnip", veggie
    assert_equal ["carrot", "courgette"], veggies
  end

  def test_compact
    assert_equal ["a", "b", "c"], ["a", "b", "c"].compact
    assert_equal ["a", "b", "c"], ["a", nil, "b", "c", nil, nil].compact
    assert_equal [], [nil].compact
  end

  def test_flatten
    assert_equal [:a, :b, :c], [:a, :b, :c].flatten
    assert_equal [:a, :b, :c], [:a, [:b, :c]].flatten
    assert_equal [:a, :b, :c, :d, :e, :f, :g], [:a, [:b, [:c]], [:d], :e, [:f, :g]].flatten
  end

  # Uhm. Halp?
  def test_shuffle
    # Go try this in IRB a few times
    # ["a", "b", "c", "d"].shuffle
  end

  def test_sample
    # Go try this in IRB a few times
    # ["a", "b", "c", "d"].sample
  end
end
