require 'csv'
require './monkey_patch'


module CovidDataLoader
  # This is a Ruby module. The Ruby module is a "primitive" version of the Ruby class. It contains
  # methods just like Ruby classes do, but they cannot be instantiated.

  def self.table
    CSV.table('./covid19-my-cases.csv')
    # refer to Ruby documentation on how to manipulate a CSV object
    # https://ruby-doc.org/stdlib-2.0.0/libdoc/csv/rdoc/CSV.html
    # 
  end
end

class Query
  # this is the class that you will complete for this workshop

  attr_accessor :data

  def initialize(data)
    @data = data
  end

  def new_cases(date)
    # TODO: this method returns number of new cases on the given date
  end

  def total_cases(from: , to: )
    # TODO: this method returns the total number of cases, given the date range
  end

  def cfr(date)
    # The CFR (case-fatality ratio) is the ratio between total deaths and total number infected

    total_deaths = 0
    total_cases_on_date = nil

    # NOTE: data, @data, and self.data all refer to the same data object
    data.each do |row|
      if row[:date].to_date <= date.to_date
        total_deaths += row[:new_deaths]
      end

      if row[:date] == date
       total_cases_on_date = row[:total_infected]
      end
    end

    total_deaths*1.0 / total_cases_on_date
  end
end

def run
  dataset = CovidDataLoader.table

  # Your query class should be able to lookup and compute COVID-19 statistics from the given dataset

  # 1. Demonstrate how you can instantiate a Query class, given the dataset
  # q = ?

  # 2. demonstrate how you can extract the CFR (case-fatality ratio) for any given date

  # 3. Assign the variable n to the number of new cases for the date '2020-03-20'
  # n = ?

  # 4. Assign the variable t to the total number of cases between '2020-03-01' and '2020-03-31'
  # t = ?

  puts "Number of new cases on 2020-03-20 was: #{n}"
  puts "Total number of cases between 2020-03-01 and 2020-03-31 was: #{t}"

end

run
