# Grade book

def get_grade(score1, score2, score3)
  letter_value(mean_score([score1, score2, score3]))
end

def mean_score(scores)
  scores.sum / scores.length
end

def letter_value(score)
  case score
  when 90..100 then 'A'
  when 80...90 then 'B'
  when 70...80 then 'C'
  when 60...70 then 'D'
  else              'F'
  end
end

# puts letter_value(70) == 'C'
# puts letter_value(65) == 'D'

puts get_grade(95, 90, 93) == "A"
puts get_grade(50, 50, 95) == "D"

# Alternative option: Use an if-elsif and check if the score is
# greater than a particular value

# Solution 2

LETTER_GRADES = {
  90..100 => 'A',
  80..89 => 'B',
  70..79 => 'C',
  60..69 => 'D',
  0..59 => 'F'
}

def get_grade_v2(score1, score2, score3)
  mean = (score1 + score2 + score3) / 3
  LETTER_GRADES.find { |range, _| range.include?(mean) }[1]
end

puts get_grade_v2(95, 90, 93) == "A"
puts get_grade_v2(50, 50, 95) == "D"
