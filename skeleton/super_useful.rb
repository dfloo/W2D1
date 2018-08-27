# PHASE 2
def convert_to_int(str)
  begin
  stuff = Integer(str)

  rescue ArgumentError
    puts "argument was #{stuff}"
  rescue
    "whoa"
  ensure
    stuff ||= nil
  end
  stuff
end

# puts convert_to_int("banana")
# puts convert_to_int("8")
# puts convert_to_int(4)
# puts convert_to_int([4])
# puts convert_to_int(4,6)

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError
  else 
    raise StandardError 
  end 
end

def feed_me_a_fruit
  begin
  puts "Hello, I am a friendly monster. :)"

  puts "Feed me a fruit! (Enter the name of a fruit:)"
  maybe_fruit = gets.chomp
  reaction(maybe_fruit) 
  
  rescue CoffeeError
    puts "ooh coffee"
    retry 
  end
end  

# feed_me_a_fruit

# PHASE 4
class BestieError < StandardError 
end

class PastimeError < StandardError; end
class NameError < StandardError; end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    begin
      @name = name
      @yrs_known = yrs_known 
      @fav_pastime = fav_pastime
      raise NameError if name.length < 1
      raise BestieError if yrs_known < 5
      raise PastimeError if fav_pastime.length < 1
    rescue NameError
      puts "Enter a valid name!"
      name = gets.chomp
      retry
    rescue BestieError
      puts "Lets wait a few more years"
      yrs_known = gets.chomp.to_i
      retry
    rescue PastimeError
      puts "Enter a pastime!"
      fav_pastime = gets.chomp
      retry
    end
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end

