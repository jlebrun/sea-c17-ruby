#!/usr/bin/env ruby
#
# 4 points
#
# Extend the playlist program with some user-friendly features.
#
# 1. Allow a user to specify the name of the playlist file as a command line
# argument. The program should accept file names with and without a .m3u
# extension. For example:
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa
#   => Build a shuffled playlist
#   => Created salsa.m3u with 16 songs
#
# If no name is given, the program should output a helpful usage message and
# immediately exit. For example:
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb
#   Usage: 2_build_a_shuffled_playlist_extended.rb PLAYLIST
#
# 2. If the playlist file already exists, the program should ask the user to
# either cancel the operation, overwrite the file with new content, or append
# new content to the end of the file. For example
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa.m3u
#   => Build a shuffled playlist
#   => WARNING: salsa.m3u already exists
#   => (c)ancel, (o)verwrite, or (a)ppend > c
#   => Canceled
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa.m3u
#   => Build a shuffled playlist
#   => WARNING: salsa.m3u already exists
#   => (c)ancel, (o)verwrite, or (a)ppend > o
#   => Overwrote salsa.m3u with 16 songs
#
#   $ ruby 2_build_a_shuffled_playlist_extended.rb salsa.m3u
#   => Build a shuffled playlist
#   => WARNING: salsa.m3u already exists
#   => (c)ancel, (o)verwrite, or (a)ppend > a
#   => Appended salsa.m3u with 16 songs
#
# A few methods you might find useful are:
#
#   String#end_with?(suffix) → true or false
#
#     Returns true if the string ends with the given suffix, otherwise false.
#
#     "code.rb".end_with?(".rb")   #=> true
#
#   File.exists?(file_name) → true or false
#
#     Return true if the named file exists, otherwise false.
#
#   File.open(file_name, mode) { |file|  }
#
#     Opens file_name with a "mode" and then passes the opened file to a block.
#     Possible modes include:
#
#     "w"   Truncates an existing file to zero length or creates a new file for
#           writing.
#
#     "a"   Starts at end of a file, if it exists, otherwise creates a new file
#           for writing.

abort "Usage 2_build_a_shuffled_playlist_extended.rb PLAYLIST" unless ARGV.first

def playlister(file_name, mode, action)
  songs = Dir["**/*.{mp3,MP3,m4a,M4A}"].shuffle

  f = File.open(file_name, mode)
  f.puts songs

  puts "=> #{action} #{file_name} with #{songs.size} songs"
end

file_name = ARGV[0]
file_name += ".m3u" unless file_name.end_with?(".m3u")

puts "=> Build a shuffled playlist"

if File.exists?(file_name)
  puts "=> WARNING: #{file_name} already exists"

  loop do
    print "=> (c)ancel, (o)verwrite, or (a)ppend > "
    action = $stdin.gets.chomp

    if action == "c"
      puts "=> Canceled"
      break
    elsif action == "o"
      playlister(file_name, "w", "Overwrote")
      break
    elsif action == "a"
      playlister(file_name, "a", "Appended")
      break
    else
      puts "=> Invalid choice. Please enter c, o, or a"
    end
  end
else
  playlister(file_name, "w", "Created")
end
