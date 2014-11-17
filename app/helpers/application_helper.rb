module ApplicationHelper

	def get_energy_letter(energy_number)
		n = energy_number
		case n
		when 0..50
		  return "A"
		when 51..90
		  return "B"
		when 91..150
		  return "C"
		when 151..230
		  return "D"
		when 231..330
		  return "E"
		when 331..450
		  return "F"
		when 451..999
		  return "G"
		else
		  puts "Ce nombre : #{n} n'est pas possible !"
		end
	end

	def get_impact_letter(impact_number)
		n = impact_number
		case n
		when 0..4
		  return "A"
		when 5..10
		  return "B"
		when 11..20
		  return "C"
		when 21..35
		  return "D"
		when 36..55
		  return "E"
		when 56..80
		  return "F"
		when 81..999
		  return "G"
		else
		  puts "Ce nombre : #{n} n'est pas possible !"
		end
	end

	def get_price(price)
		return price.to_s.reverse.gsub(/(.{3})/, '\1 ').reverse
	end

	def get_decimal_number(number)
		return number.to_s.gsub(".",",")
	end

end
