a,b,C=gets.chomp.split(" ").map(&:to_i)
S = 0.5 * a * b * Math.sin(Math::PI * C / 180.0)
L = a + b + (a**2 + b**2 - 2*a*b*Math.cos(Math::PI * C / 180.0))**0.5
h = Math.sin(Math::PI * C / 180.0) * b 
puts "#{format("%0.5f", S)} #{format("%0.5f", L)} #{format("%0.5f", h)}"