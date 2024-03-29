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
    if !@tail
      @tail = node
    else
      @tail.next_node = node
    end
    @tail = node
  end

  def prepend(value)
    node = Node.new(value, @head)
    @tail ||= node
    @head = node
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
    @tail = node
  end

  def find(input_value)
    return nil if @head.nil?

    node = @head
    index = 0

    loop do
      return index.to_s if input_value.eql? node.value

      break if node.value == @tail.value

      node = node.next_node
      index += 1
    end

    nil
  end

  def contains?(value)
    return nil if @head.nil?

    node = @head
    loop do
      if node.value == value
        return true
      end
      break if node == @tail
      node = node.next_node
    end

    return false
  end

  def to_s
    return nil if @head.nil?

    node = @head
    loop do
      print "#{node.value} -> "

      break if node.value == @tail.value

      node = node.next_node
    end

    print 'nil'
    puts
  end
end

list = LinkedList.new
list.prepend('Data 5')
list.append('Data 2')
list.prepend('Data 1')
list.prepend('Data 3')
list.append('Data 4')
list.to_s
p list.find('Data 4')
p list.contains?('Data 4')
list.pop
p list.contains?('Data 4')
list.to_s