# Friday 13th

require 'date'

def friday_13th(year)
  (1..12).count { |month| Date.new(year, month, 13).friday? }
end

puts friday_13th(2015) == 3
puts friday_13th(1986) == 1
puts friday_13th(2019) == 2

# Further Exploration

def months_with_5_fridays(year)
  (1..12).count do |month|
    count_fridays(year, month) == 5
  end
end

def count_fridays(year, month)
  day = Date.new(year, month, 1)
  fridays = 0
  while day.month == month
    fridays += 1 if day.friday?
    day += 1
  end
  fridays
end

puts months_with_5_fridays(2019)
puts months_with_5_fridays(2018)
puts months_with_5_fridays(2017)
puts months_with_5_fridays(2016)
puts months_with_5_fridays(2015)

# With Group_by

def months_with_5_fridays_v2(year)
  date_start = Date.new(year, 1, 1)
  date_end = Date.new(year, 12, 31)

  (date_start..date_end).select(&:friday?)
                        .group_by(&:month)
                        .count { |_, fridays| fridays.length == 5 }
end

puts months_with_5_fridays_v2(2019)
puts months_with_5_fridays_v2(2018)
puts months_with_5_fridays_v2(2017)
puts months_with_5_fridays_v2(2016)
puts months_with_5_fridays_v2(2015)