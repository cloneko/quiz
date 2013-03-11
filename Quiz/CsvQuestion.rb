$LOAD_PATH << (File.dirname(__FILE__))
require 'Question.rb'
require 'csv'

class CsvQuestion < Quiz::Question
	def initialize(filepath = '',inputPrompt = '')
		@@prompt = inputPrompt == '' ? @@prompt : inputPrompt
		@filepath = filepath
		loadfile()
	end
	def prompt
		@@prompt
	end

	def q
		@@q
	end

	def loadfile()
		CSV.read(@filepath).each{|line| 
			@@q.push('Question' => line[0],'Answer' => line[1]);
		}
	end
end
