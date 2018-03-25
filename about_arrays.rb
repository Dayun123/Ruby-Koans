require File.expand_path(File.dirname(__FILE__) + '/neo')

class AboutArrays < Neo::Koan
  def test_creating_arrays
    empty_array = Array.new
    assert_equal Array, empty_array.class
    assert_equal 0, empty_array.size
  end

  def test_array_literals
    array = Array.new
    assert_equal [], array

    array[0] = 1
    assert_equal [1], array

    array[1] = 2
    assert_equal [1, 2], array

    array << 333
    assert_equal [1, 2, 333], array
  end

  def test_accessing_array_elements
    array = [:peanut, :butter, :and, :jelly]

    assert_equal :peanut, array[0]
    assert_equal :peanut, array.first
    assert_equal :jelly, array[3]
    assert_equal :jelly, array.last
    assert_equal :jelly, array[-1]
    assert_equal :butter, array[-3]
  end

  def test_slicing_arrays
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut], array[0,1]
    assert_equal [:peanut, :butter], array[0,2]
    assert_equal [:and, :jelly], array[2,2]
    assert_equal [:and, :jelly], array[2,20]
    assert_equal [], array[4,0]
    assert_equal [], array[4,100]
    # I don't understand this one, gonna have to do some digging...
    # Here is a good explanation: https://stackoverflow.com/questions/3568222/array-slicing-in-ruby-explanation-for-illogical-behaviour-taken-from-rubykoans
    assert_equal nil, array[5,0]
  end

  def test_arrays_and_ranges
    assert_equal Range, (1..5).class
    # (1..5) is a Range, not an array
    assert_not_equal [1,2,3,4,5], (1..5)
    # (1..5) is the Range from 1-5, inclusive
    assert_equal [1, 2, 3, 4, 5], (1..5).to_a
    # (1...5) is the Range from 1-4, or 1-5 exclusive
    assert_equal [1, 2, 3, 4], (1...5).to_a
  end

  def test_slicing_with_ranges
    array = [:peanut, :butter, :and, :jelly]

    assert_equal [:peanut, :butter, :and], array[0..2]
    assert_equal [:peanut, :butter], array[0...2]
    assert_equal [:and, :jelly], array[2..-1]
  end

  def test_pushing_and_popping_arrays
    array = [1,2]
    # pushes the value ':last' onto the end of the array
    array.push(:last)

    assert_equal [1,2,:last], array

    # pops the last element from the array
    popped_value = array.pop
    assert_equal :last, popped_value
    assert_equal [1,2], array
  end

  def test_shifting_arrays
    array = [1,2]
    # unshift is like push, but pushes to the beginning of the array
    array.unshift(:first)

    assert_equal [:first, 1, 2], array

    # shift is like pop, but pops from the front of the array
    shifted_value = array.shift
    assert_equal :first, shifted_value
    assert_equal [1, 2], array
  end

end
