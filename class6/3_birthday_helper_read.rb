#!/usr/bin/env ruby
#
# 4 points
#
# Write a program that reads in names and birth dates from birth_dates.yml.
# Given a name, it should output when that person's next birthday will be and
# how old they will be.
#
# For example:
#
#   $ 3_birthday_helper_read.rb Alex
#   Alex will be 78 on 2014-10-04
#
# The program should also handle names that are not capitalized:
#
#   $ ruby 3_birthday_helper_read.rb jane
#   Jane will be 56 on 2015-03-27
#
# And reject names that don't have a birth date:
#
#   $ ruby 3_birthday_helper_read.rb Andre3000
#   Unknown birth date for 'Andre3000'
#
# Hint: Represent a birth date as a Time on midnight in UTC.
#
# A few methods that may help you:
#
#   File.read(file_path) → String
#
#     Opens the file_path and returns the contents as a String.
#
#     File.read("file.txt")  #=> "Hello world!"
#
#   YAML.load(str) → Object
#
#     Parses a YAML formatted string and returns the resulting Object.
#
#     YAML.load("--- foo")          #=> "foo"
#     YAML.load("---\nfoo: bar\n")  #=> { "foo" => "bar" }
#
#   Time#strftime("%F") → String
#
#     Returns a Time as a String in YYYY-MM-DD format
#
#     Time.new.utc.strftime("%F")   #=> "2014-07-23"

require 'yaml'

name = ARGV.first

abort "Usage: 3_birthday_helper_read.rb NAME" unless name

name = name.capitalize

bday = YAML.load(File.read("birth_dates.yml"))
bdate = bday[name]

abort "Unknown birth date for '#{name}'" unless bdate

puts "#{name}'s birth date is #{bdate}"

b_month = bdate.month
b_daynum= bdate.day
b_year = bdate.year
now = Time.new.utc

next_year = 0

if now.month > bdate.month || now.month == bdate.month && now.day > bdate.day
  next_year = 1
end

age = now.year - bdate.year + next_year
next_bday_year = age + bdate.year

next_bday = Time.utc(next_bday_year, b_month, b_daynum).strftime("%F")
puts "#{name} will be #{age} on #{next_bday}"
