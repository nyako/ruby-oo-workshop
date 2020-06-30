# Here are some nonsensical classes that demonstrate the hierarchy of class inheritance in Ruby

# Animal is the base class
class Animal
  def warmblooded?
    # subclasses should return a boolean value when this method is called
    raise "I don't know!"
  end

  def says
    puts "#{sound}! I am a #{name}"
  end

  # this is a class method
  def self.procreate
    raise "Sorry, cannot procreate because method not implemented"
  end
end

# Mammal inherits from the Animal base class
class Mammal < Animal
  def warmblooded?
    # NOTE: the last line of every Ruby method is returned to the caller. Here, we return true
    true
  end

end

class Reptile < Animal
  def warmblooded?
    false
  end
end

class Cat < Mammal
  def name
    "cat"
  end
  def sound
    "purrrrrr"
  end
  def self.procreate
    # here, the procreate class method returns an instance of Cat
    Cat.new
  end
end

class Cobra < Reptile
  def name
    "cobra"
  end
  def sound
    "hissssss"
  end
end

# Here is an alternative way to implement the abstract methods "name" and "sound" from the base class
# Animal, equivalent to the above. The "name" and "sound" are defined as class attributes
class Dog < Mammal
  attr_accessor :name, :sound
  # You can think of attr_accessor as a shorthand that creates methods that return the instance 
  # variables associated to their respective attributes. Here, :name is "mapped" to the instance
  # variable @name. Likewise, :sound to @sound

  def initialize
    # every Ruby class has a constructor method. If you do not explicitly define it, it is fine.
    # Constructors are typically used to initialize instance variables.

    # Here are some instance variables
    @name = "dog"
    @sound = "woooooof"
  end
end

# Here is a flexible animal class that you can define the name and sound attributes for any
# instances of the class. Example:
#   cricket = NewSpecies.new
#   cricket.name = "cricket"
#   cricket.sound = "chirp chirp"
class NewSpecies < Animal
  attr_accessor :name, :sound
end

'''
  # Lets put it all together now.

  # instantiate the objects
  cat = Cat.new
  cobra = Cobra.new
  dog = Dog.new

  # here is how you call a class method
  another_cat = Cat.procreate

  # these will print "purrrrrr! I am a cat"
  cat.says
  another_cat.says

  # because we implemented attribute accessors in Dog, we can change the name and sound at instance level
  dog.name = "pitbull"
  dog.sound = "grrrrrr"
  dog.says
'''
