require 'date'
require 'active_support/all'

monthnames = Date::MONTHNAMES
months = Hash.new
monthnames.each_with_index{ |month, index| months[month] = Time.days_in_month(index, 2019) }
months.each{ |var, index| puts var if index == 30}