class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    total = 0
    self.each do |el|
      total += el.hash
      total = total.hash
    end
    total
  end
end

class String
  def hash
    total = 0
    self.each_char do |char|
      total += char.ord.hash
      total = total.hash
    end
    total
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    total = 0
    keys = self.keys.sort
    vals = self.values.sort
    keys.each do |key|
      total += key.hash
      total = total.hash
    end
    vals.each do |val|
      total += val.hash
      total = total.hash
    end
    total
  end
end
