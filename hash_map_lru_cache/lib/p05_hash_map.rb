require_relative 'p04_linked_list'

class HashMap
  attr_accessor :count
  include Enumerable

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    index = key.hash % @store.length 
    return true if @store[index].include?(key)
    false
  end

  def return_node(key)
    index = key.hash % @store.length 
    @store[index] if @store[index]
  end

  def set(key, val)
    index = key.hash % @store.length 
    if get(key).nil?
      @store[index].append(key, val)
      @count += 1
      if count > @store.length 
        resize!
      end
    else
      @store[index].update(key, val)
    end
  end

  def get(key)
    index = key.hash % @store.length 
    current_node = @store[index].first
    until current_node == @store[index].last.next
      if current_node.key == key
        return current_node.val
      end
      current_node = current_node.next
    end
    nil
  end

  def delete(key)
    index = key.hash % @store.length 
    unless get(key).nil?
      @store[index].remove(key) 
      @count -= 1
    end
  end

  def each(&prc)
    @store.each do |list|
      list.each do |node|
        prc.call(node.key, node.val)
      end
    end
  end

  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end


  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    resized_arr = Array.new(@store.length*2) { LinkedList.new }
    
    @store.each do |list|
      list.each do |node|
        index = node.key.hash % resized_arr.length
        resized_arr[index].append(node.key, node.val) 
      end 
    end
    @store = resized_arr
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end

# class ResizingIntSet
#   attr_reader :count

#     def initialize(num_buckets = 20)
#     @store = Array.new(num_buckets) { Array.new }
#     @count = 0
#   end

#   def insert(num)
#     index = num % @store.length
#     unless @store[index].include?(num)
#       index = num % @store.length
#       @store[index].push(num) 
#       @count+=1
#       if count > @store.length 
#         resize!
#       end 
#       return true
#     end  
#   end

#   def remove(num)
#     index = num % @store.length
#     if @store[index].include?(num)
#       @store[index].delete(num)
#       @count-=1
#     end 
#     num
#   end

#   def include?(num)
#     index = num % @store.length
#     @store[index].include?(num)
#   end

#   private

#   def [](num)
#     # optional but useful; return the bucket corresponding to `num`
#   end

#   def num_buckets
#     @store.length
#   end

#   def resize!
#     resized_arr = Array.new(@store.length*2) { Array.new }
    
#     @store.each do |bucket|
#       bucket.each do |el|
#         index = el % resized_arr.length
#         resized_arr[index].push(el) 
#       end 
#     end 

#   @store = resized_arr
#   end 
   
# end 
