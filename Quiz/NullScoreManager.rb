$LOAD_PATH << (File.dirname(__FILE__))
require 'ScoreManager.rb'

class NullScoreManager < Quiz::ScoreManager
	def initialize(param,name)
		@@result = param
		@@username = name
		total 
	end 

	def compute
		tmp = 0
		@@results.each {|chk|
			tmp += chk ? 1 : 0 
		}
		@@score = tmp 
	end
end
