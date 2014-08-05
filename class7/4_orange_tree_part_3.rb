#!/usr/bin/env ruby
#
# 4 points
#
# This program is br0ken! Fix it so the output looks like this:
#
#   $ ruby 4_orange_tree_part_3.rb
#   true
#   true
#   true
#
# Copy the previous OrangeTree class and replace the following method:
#
#   OrangeTree#initialize(fruit = 50)
#
#     Sets it's @fruit instance variable to the fruit parameter, which defaults
#     to 50.
#
#     orange_tree = OrangeTree.new
#     orange_tree.fruit  #=> 50
#
#     orange_tree = OrangeTree.new(20)
#     orange_tree.fruit  #=> 20
#
# And extend the OrangeTree class with the following method:
#
#   OrangeTree#==(other) → true or false
#
#     Given another object, returns true if both objects have the same amount of #     fruit. Otherwise, returns false.
#
#     OrangeTree.new(20) == OrangeTree.new(20)
#     OrangeTree.new(20) != OrangeTree.new(10)

class OrangeTree
  def initialize(fruit = 50)
    @fruit = fruit
  end

  def fruit
    @fruit
  end

  def pick!(amount = 1)
    return nil if fruit < amount
    @fruit -= amount
  end

  def ==(other)
    fruit == other.fruit
  end
end


puts OrangeTree.new == OrangeTree.new(50)
puts OrangeTree.new(20) == OrangeTree.new(20)
puts OrangeTree.new(20) != OrangeTree.new(10)
