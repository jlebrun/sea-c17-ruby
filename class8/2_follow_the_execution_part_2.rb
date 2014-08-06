#!/usr/bin/env ruby
#
# 4 points
#
# Extend the previous program so the method accepts a parameter and displays
# it's value to the user.
#
# For example:
#
#   $ ruby 2_follow_the_execution_part_2.rb
#   Executing the method
#   method_param is dinner
#   Executing the block
#
# Hint: Don't over think this one. The simpler the better.

def follow_the_execution(method_param, &block)
  puts "Executing the method"
  puts "method_param is #{method_param}"
  block.call
end

follow_the_execution("dinner") do
  puts "Executing the block"
end
