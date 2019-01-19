class MaxIntSet
  def initialize(max)
    @store = Array.new(max){false}
  end

  def insert(num)
    raise "Out of bounds" if num > @store.length
    raise "Out of bounds" if num < 0
    @store[num] = true
  end

  def remove(num)
    raise "Out of bounds" if num > @store.length
    raise "Out of bounds" if num < 0
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    index = num % @store.length
    @store[index].push(num)
    true
  end

  def remove(num)
    index = num % @store.length
    @store[index].delete(num)

  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num)
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

  def insert(num)
    index = num % @store.length
    unless @store[index].include?(num)
      index = num % @store.length
      @store[index].push(num) 
      @count+=1
      if count > @store.length 
        resize!
      end 
      return true
    end  
  end

  def remove(num)
    index = num % @store.length
    if @store[index].include?(num)
      @store[index].delete(num)
      @count-=1
    end 
    num
  end

  def include?(num)
    index = num % @store.length
    @store[index].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    resized_arr = Array.new(@store.length*2) { Array.new }
    
    @store.each do |bucket|
      bucket.each do |el|
        index = el % resized_arr.length
        resized_arr[index].push(el) 
      end 
    end 

  @store = resized_arr
  end 
   
end 
