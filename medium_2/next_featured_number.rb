# Next Featured Number Higher than a Given Value

def featured(n)
  candidate = candidate_featured_number(n + 1)

  while candidate.digits.length < 11
    digits = candidate.digits
    return candidate if digits == digits.uniq
    candidate += 14
  end

  "There is no possible next featured number."
end

def candidate_featured_number(n)
  n += 1 until n % 7 == 0 && n.odd?
  n
end

puts featured(12) == 21
puts featured(20) == 21
puts featured(21) == 35
puts featured(997) == 1029
puts featured(1029) == 1043
puts featured(999_999) == 1_023_547
puts featured(999_999_987) == 1_023_456_987
puts featured(9_999_999_999)
# -> There is no possible number that fulfills those requirements
