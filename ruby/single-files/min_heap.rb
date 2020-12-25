class MinHeap
  @@storage = Array.new

  def add(value)
    @@storage.push(value)
    heapify_up
  end

  def shift
    if @@storage.empty?
      return nil
    end

    value = @@storage.first

    if @@storage.length == 1
      return @@storage.pop
    end

    @@storage[0] = @@storage.pop
    heapify_down

    return value
  end

  def heapify_up
    index = @@storage.length - 1
    while has_parent(index) && @@storage[index] < parent(index)
      parent_index = self.class.index_of_parent(index)
      swap(index, parent_index)
      index = parent_index
    end
  end

  def heapify_down
    index = 0
    while has_left_child(index)
      smallest_location = self.class.index_of_left_child(index)

      if has_right_child(index) && right_child(index) < left_child(index)
        smallest_location = self.class.index_of_right_child(index)
      end

      if @@storage[index] < @@storage[smallest_location]
        break
      else
        swap(index, smallest_location)
        index = smallest_location
      end
    end
  end

  def swap(first, second)
    tmp = @@storage[first]
    @@storage[first] = @@storage[second]
    @@storage[second] = tmp
  end

  def self.index_of_parent(index)
    return (index - 1) / 2
  end

  def self.index_of_left_child(index)
    return (index * 2) + 1
  end

  def self.index_of_right_child(index)
    return (index * 2) + 2
  end

  def has_parent(index)
    index > 0 && self.class.index_of_parent(index) >= 0
  end

  def has_left_child(index)
    self.class.index_of_left_child(index) < @@storage.length
  end

  def has_right_child(index)
    self.class.index_of_right_child(index) < @@storage.length
  end

  def parent(index)
    if has_parent(index)
      @@storage[self.class.index_of_parent(index)]
    else
      nil
    end
  end

  def left_child(index)
    if has_left_child(index)
      @@storage[self.class.index_of_left_child(index)]
    else
      nil
    end
  end

  def right_child(index)
    if has_right_child(index)
      @@storage[self.class.index_of_right_child(index)]
    else
      nil
    end
  end

  def storage
    @@storage
  end
end

require "test/unit"

class TestMinHeap < Test::Unit::TestCase

  def test_min_heap
    1000.times do
      heap = MinHeap.new
      values = Array.new

      1000.times do
        value = rand(-4611686018427387904..4611686018427387903)
        values.push(value)
        heap.add(value)
      end

      values.sort!

      values.each do |value|
        assert_equal(value, heap.shift)
      end
    end
  end
end
