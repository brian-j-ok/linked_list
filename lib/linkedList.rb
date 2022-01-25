require_relative 'node'
require 'pry'

# Linked List Class
class LinkedList
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
  end

  def append(value)
    node = Node.new(value)
    @head ||= node
    if @tail.nil?
      @tail = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    node = Node.new(value)
    @tail ||= node
    if @head.nil?
      @head = node
    else
      node.next_node = @head
      @head = node
    end
  end

  def size
    return nil if @head.nil?

    size = 1
    node = @head

    until node.next_node.nil?
      size += 1
      node = node.next_node
    end

    size
  end

  def at(index_input)
    return nil if @head.nil?

    index = 0
    node = @head

    return "#{node.value}" if index.zero?

    until index == index_input
      node = node.next_node
      index += 1
    end

    "#{node.value}"
  end

  def pop
    return nil if @head.nil?

    node = @head
    node = node.next_node until node.next_node == @tail
    node.next_node = nil
  end

  # def find(input_value)
  #   return nil if @head.nil?

  #   node = @head
  #   index = 0

  #   loop do
  #     p node.value
  #     return index if input_value.eql? node.value

  #     node = node.next_node
  #     index += 1
  #     break if node == @tail
  #   end

  #   nil
  # end

  def to_s
    return nil if @head.nil?

    node = @head
    
    until node.nil?
      print "( #{node.value} ) -> "
      node = node.next_node
    end
    
    print "( #{@tail.value} ) -> "
    print 'nil'
    puts
  end
end

list = LinkedList.new
list.append('Data 2')
list.prepend('Data 1')
list.prepend('Data 3')
list.append('Data 4')
puts list.size
puts list.at(0)
list.pop
puts list.size
puts list.to_s
# puts list.find('Data 1')
