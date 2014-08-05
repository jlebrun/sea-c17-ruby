#!/usr/bin/env ruby
#
# 4 points
#
# This program is br0ken! Fix it so the output looks like this:
#
#   $ ruby 3_orange_tree_part_2.rb
#   true
#   true
#   true
#   true
#   true
#   true
#   true
#   true
#   true
#   true
#   true
#
# Copy the previous OrangeTree class and extend it with the following method:
#
#   OrangeTree#pick!(amount = 1) → Integer or nil
#
#     Returns nil if @fruit is less than the amount to pick.
#     Otherwise, subtracts the amount from @fruit and returns it's new value.
#     The default amount is 1.
#
#     orange_tree = OrangeTree.new
#     orange_tree.fruit      #=> 50
#     orange_tree.pick!      #=> 49
#     orange_tree.pick!(5)   #=> 44
#     orange_tree.pick!(50)  #=> nil
#     orange_tree.fruit      #=> 44

class OrangeTree
  def initialize
    @fruit = 50
  end

  def fruit
    @fruit
  end

  def pick!(amount = 1)
    return nil if fruit < amount
    @fruit -= amount
  end
end

orange_tree = OrangeTree.new

puts orange_tree.fruit == 50
puts orange_tree.pick! == 49
puts orange_tree.pick!(5) == 44
puts orange_tree.pick!(50) == nil
puts orange_tree.fruit == 44

puts orange_tree.pick!(43) == 1
puts orange_tree.fruit == 1
puts orange_tree.pick! == 0
puts orange_tree.fruit == 0
puts orange_tree.pick! == nil
puts orange_tree.fruit == 0
