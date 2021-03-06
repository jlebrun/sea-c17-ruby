#!/usr/bin/env ruby
#
# 4 points
#
# Modify the previous method with the following change:
#
#   grandfather_clock(str, &block)
#
#     Accepts a String and a block. Calls the block, passing in the string,
#     once for each hour that's passed today.
#
#     grandfather_clock("GONGGGGGGG!") do |sound|
#       puts sound
#     end
#
#     Output:
#
#     The hour is 2
#     GONGGGGGGG!
#     GONGGGGGGG!

# your code here


def grandfather_clock(str, &block)
  now = Time.new
  hour = now.hour
  hour = hour - 12 if hour > 12
  puts "The hour is #{hour}"
  hour.times {block.call str}
end

grandfather_clock("GONGGGGGGG!") do |sound|
  puts sound
end
