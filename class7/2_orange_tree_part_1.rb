#!/usr/bin/env ruby
#
# 4 points
#
# This program is br0ken! Fix it so the output looks like this:
#
#   $ ruby 2_orange_tree_part_1.rb
#   true
#
# Make an OrangeTree class with the following methods:
#
#   OrangeTree#initialize
#
#     Sets it's @fruit instance variable to 50.
#
#   OrangeTree#fruit → Integer
#
#     Returns the value of the @fruit instance variable
#
#     orange_tree = OrangeTree.new
#     orange_tree.fruit  #=> 50

class OrangeTree
  def initialize
    @fruit = 50
  end

  def fruit
    @fruit
  end
end

orange_tree = OrangeTree.new

puts orange_tree.fruit == 50
