module Enumerable
  # Your code goes here
  def my_all?
    enumerator = 0
    self.my_each do |element|
      if (yield element)
        enumerator += 1
      end
    end
    enumerator == self.length ? true : false
  end

  def my_any?
    validator = false
    self.my_each do |element|
      if (yield element)
        validator = true
      end
    end
    validator
  end

  def my_count
    if (block_given?)
      enumerator = 0
      self.my_each do |element|
        if (yield element)
          enumerator += 1
        end
      end
      enumerator
    else
      self.size
    end
  end

  def my_each_with_index 
    index = 0
    self.my_each do |element|
      yield element, index
      index += 1
    end
    self
  end

  def my_inject (initial_value)
    sum = initial_value
    self.my_each do |element|
      sum = yield sum, element
    end
    sum
  end

  def my_map
    output_array = []
    self.my_each do |element|
      output_array << yield(element)
    end
    output_array
  end

  def my_none?
    validator = true
    self.my_each do |element|
      if (yield element)
        validator = false
      end
    end
    validator
  end

  def my_select
    output_array = []
    self.my_each do |element|
      if (yield element)
        output_array << element
      end
    end
    output_array
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    for element in self do
      yield element
    end
    self
  end
end
