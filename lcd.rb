#!/usr/bin/env ruby

require 'tempfile'

class LCD
  LCDRC = File.expand_path(File.join(ENV["HOME"], "/.lcdrc"))

  attr_accessor :aliases

  def initialize
    self.aliases = Hash.new
    read_lcdrc
  end

  def read_lcdrc
    File.open(LCDRC) do |f|
      while f.eof? == false
        name, path = f.readline.split(",")
        self.aliases[name] = path.strip
      end
    end
  end

  def write_lcdrc
    tf = Tempfile.new("lcd")

    aliases.each_key do |key|
      tf.puts "#{key},#{aliases[key]}"
    end

    File.rename(tf.path, LCDRC)
  end

  def self.run(args)
    lcd = LCD.new

    case args[0]
    when "-a"
      name = args[1]
      path = Dir.pwd
      lcd.aliases[name] = path
      lcd.write_lcdrc
    when "-c"
      args.shift
      # replace any standalone argument that matches an alias with the path
      args.map! do |arg|
        if lcd.aliases.has_key? arg
          lcd.aliases[arg]
        else
          arg
        end
      end
      system("cp #{args.join(" ")}")
    when "-m"
      args.shift
      # replace any standalone argument that matches an alias with the path
      args.map! do |arg|
        if lcd.aliases.has_key? arg
          lcd.aliases[arg]
        else
          arg
        end
      end
      system("mv #{args.join(" ")}")
    when "-d"
      name = args[1]
      lcd.aliases.delete name
      lcd.write_lcdrc
    when "-l"
      name = args[1]
      if lcd.aliases.has_key? name
        puts lcd.aliases[name]
      else
        STDERR.puts "No such key"
        exit -1
      end
    when "-p"
      lcd.aliases.each_key do |key|
        puts "#{key}\t=> #{lcd.aliases[key]}"
      end
    end
  end
end

if __FILE__ == $0
  LCD.run(ARGV)
end
