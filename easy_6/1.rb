DEGREE = "\xC2\xB0"
MAX_FRACTIONAL_DIGITS = 10
TOTAL_DEGREES = 360
CONVERSION_FACTOR = 60

def dms(angle)
  degrees, remainder = conversion_cycle(angle % TOTAL_DEGREES, 1)
  minutes, remainder = conversion_cycle(remainder, CONVERSION_FACTOR)
  seconds = conversion_cycle(remainder, CONVERSION_FACTOR)[0]

  format(%(#{degrees}#{DEGREE}%02d'%02d"), minutes, seconds)
end

# Provides the converted output (rounded) and remainder
def conversion_cycle(input, conversion_factor)
  converted = input * conversion_factor
  remainder = (converted - converted.floor).round(MAX_FRACTIONAL_DIGITS)
  [converted.floor, remainder]
end

# REFACTOR: Avoid intermittent rounding

puts dms(30) == %(30°00'00")
puts dms(76.73) == %(76°43'48")
puts dms(254.6) #== %(254°36'00")
puts dms(93.034773) == %(93°02'05")
puts dms(0) == %(0°00'00")
puts dms(360) == %(360°00'00") || dms(360) == %(0°00'00")
puts dms(400) == %(40°00'00")
puts dms(-40) == %(320°00'00")
puts dms(-420) == %(300°00'00")