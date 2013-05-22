class Year
  attr_reader :year 

  def initialize(year)
    @year = year
  end

  def leap?
    divisible_by(4) && ( !divisible_by(100) || divisible_by(400) )
  end

  def divisible_by(number)
    year % number == 0
  end
end

# return all leap years from 1 to 2013
leap_years = []

(1..2013).each do |number|
  if Year.new(number).leap? 
    leap_years << number
  end
end

p leap_years.count # => 488
p leap_years
