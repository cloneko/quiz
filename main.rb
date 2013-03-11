
$LOAD_PATH << (File.dirname(__FILE__)) 
require "readline"
require 'Quiz/CsvQuestion.rb'
require 'Quiz/NullScoreManager.rb'

# Username Check

username = ENV['LOGNAME'] == '' ? '' : ENV['LOGNAME']
if(username == '')
	then
		print 'Prease input your name: '
		Readline.readline
	end

q = CsvQuestion.new('keywords.csv').q;
results = [];

q.each{|current|
	puts current['Question']
	print 'input:'
	input = Readline.readline 
	result = current['Answer'] == input ? true : false;
	results.push({current['Question'] => result}) 
}

score = NullScoreManager.new(results,username)


puts score.username + "'s Result: " + score.score.to_s + ' of ' + score.questions.to_s + ' (' + (score.score.to_f / score.questions.to_f * 100).to_s + '%)'
