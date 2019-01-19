class HashSet
  attr_reader :count
  
      def initialize(num_buckets = 8)
      @store = Array.new(num_buckets) { Array.new }
      @count = 0
    end
  
    def insert(num)
      num = num.hash
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
      num = num.hash
      index = num % @store.length
      if @store[index].include?(num)
        @store[index].delete(num)
        @count-=1
      end 
      num
    end
  
    def include?(num)
      num = num.hash
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
  

