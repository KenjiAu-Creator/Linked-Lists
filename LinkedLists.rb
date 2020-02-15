class LinkedList
  def initialize
    @head = nil
    @@node_count = 0
  end

  def append(value)
    # Create new node class and define the value
    new_node = Node.new
    new_node.value(value)
    @@node_count += 1

    if (@head == nil)
      @head = new_node
      @last_node = @head
    else
      @last_node.next_node(new_node)
      @last_node = new_node
    end
  end
  
  def prepend(value)
    # Create new node class and define the value
    new_node = Node.new
    new_node.value(value)
    @@node_count += 1

    if (@head == nil)
     @head = new_node
     @last_node = new_node
    else
      new_node.next_node(@head)
      @head = new_node
    end
  end

  def size
    #returns total number of nodes in list
    puts @@node_count
    return @@node_count
  end

  def head
    #returns the first node in the list
    puts @head.data.inspect
    return @head
  end

  def tail
    # returns the last node in the list
    puts @last_node.data.inspect
    return @last_node
  end

  def at(index)
    #returns the node at the given index
    n = 0
    current_node = @head
    until n == index
      n += 1
      current_node = current_node.next_node_linked
    end

    return current_node
    
  end

  def pop
    # removes the last node from the list
    current_node = @head
    until (current_node.next_node_linked == @last_node)
      current_node = current_node.next_node_linked
    end

    @last_node = current_node
    removed_node = current_node.next_node_linked.clone
    current_node.next_node_linked = nil
    
    return removed_node
  end

  def contains?(value)
    # Returns true if the passed in value is in the list. Otherwise false
    current_node = @head
    until current_node.data == nil
      if current_node.data == value
        return true
      
      else
        if current_node.next_node_linked == nil
          return false
        end

        current_node = current_node.next_node_linked
      end
    end

    return false
  end

  def find?(value)
    # returns the index of the node containing value or nil if not found
    index = 0
    current_node = @head

    until current_node.data == nil
      puts current_node.data
      if current_node.data == value
        puts index
        return index
      else
        index += 1
        current_node = current_node.next_node_linked
      end
    end

    return nil

  end

  def to_s
    # represent your LinkedList objects as a string so you can print them out
    # and preview the min the console. 
    # Format: ( value) -> (value) -> (value) -> nil

    current_node = @head
    until (current_node.next_node_linked == nil)
      print "(#{current_node.data.inspect}) -> "
      current_node = current_node.next_node_linked
    end
    print "(#{current_node.data.inspect}) -> nil"
    print "\n"
  end

  def insert_at(value, index)
    current_index = 0
    current_node = @head
    until current_index == (index-1)
      current_index += 1
      current_node = current_node.next_node_linked
    end

    new_node = Node.new
    new_node.value(value)
    
    shifted_node_value = current_node.next_node_linked
    new_node.next_node(shifted_node_value)

    current_node.next_node(new_node)
  end

  def remove_at(index)
    current_index = 0
    current_node = @head
    
    until current_index == (index - 1)
      current_index += 1
      current_node = current_node.next_node_linked
    end

    current_node.next_node(current_node.next_node_linked.next_node_linked)

  end

end

class Node
  attr_accessor :data, :next_node_linked
  
  def initialize
    @data = nil
    @next_node_linked = nil
  end

  def value(data)
    @data = data
  end

  def next_node(node)
    @next_node_linked = node
  end
end

examplelist = LinkedList.new
examplelist.append("dog")
examplelist.append("cow")
examplelist.prepend("cat")
examplelist.pop
examplelist.append("horse")
examplelist.find?("horse")
examplelist.to_s
examplelist.insert_at("tiger", 2)
examplelist.remove_at(1)
examplelist.to_s