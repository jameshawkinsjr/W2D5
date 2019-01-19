require_relative 'p05_hash_map'
require_relative 'p04_linked_list'

class LRUCache
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map.get(key) 
      update_node!(@map.return_node)
      @map.return_node.value
    else
      new_node = calc!(key)
      update_node(new_node)
    end
  end

  def to_s
    'Map: ' + @map.to_s + '\n' + 'Store: ' + @store.to_s
  end

  private

  def calc!(key)
    val = prc.call(key)
    Node.new(key, val)
    # suggested helper method; insert an (un-cached) key
    # run the proc
    # create new node (key, val)
    # append to list
    # insert to hash map

  end

  def update_node!(node)
    

    # suggested helper method; move a node to the end of the list
    # if cache is max size => eject!
    # linked list remove(key) and then append(key,val)
    # return node
  end

  def eject!
    # linked list remove(key) the oldest element
  end
end
