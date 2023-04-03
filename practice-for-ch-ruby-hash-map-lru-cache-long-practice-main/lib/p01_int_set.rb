require "set"
require "byebug"
class MaxIntSet

  attr_accessor :store
  def initialize(max)
    @max = max
    @store = Array.new(max,false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
     if @store[num] == true
      @store[num] = false
     end
  end

  def include?(num)
    if @store[num] == true
      return true
    end
    false
  end

  private

  def is_valid?(num)
    if num > 0 && num <= @max
      return true
    else
      return false
    end
  end

  def validate!(num)
  end
end

class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  attr_accessor :store
  def insert(num)
      i = num % self.num_buckets
      @store[i] << num
  end

  def remove(num)
    i = num % self.num_buckets
    @store[i].delete(num)
  end

  def include?(num)
    @store.each do |subarr|
      if subarr.include?(num)
        return true
      end
    end
    false
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  attr_accessor :store

  def insert(num)
    if !include?(num)
      i = num % self.num_buckets
      @store[i] << num
      @count += 1
    end
  end

  def remove(num)
    if include?(num)
      i = num % self.num_buckets
      @store[i].delete(num)
      count -= 1
    end
  end

  def include?(num)
    @store.each do |subarr|
      if subarr.include?(num)
        return true
      end
    end
    false
  end

  private

  def num_buckets
    @store.length
  end

  def resize!
    
  end

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end
end