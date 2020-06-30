# A monkey patch in Ruby is the ability to dynamically rewrite or extend a Ruby 
# class/method/attribute at run time. Some references:
#
# 1. https://en.wikipedia.org/wiki/Monkey_patch
# 2. https://culttt.com/2015/06/17/what-is-monkey-patching-in-ruby/

# Here is an example of a monkey patch
class String
  # String is a native Ruby class

  def to_date
    # this method converts a string object into a Date object, so that when we perform some like:
    #     my_date_object = "2020-12-31".to_date
    # we will obtain a Date object whose date value is equivalent to Dec 31st, 2020

    Date.parse self

    #NOTE: "self" refers to the instance of the String class
  end
end
