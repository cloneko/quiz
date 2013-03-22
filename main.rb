
pwd = File.dirname(__FILE__)
$LOAD_PATH << pwd
require "readline"
require 'Quiz/CsvQuestion.rb'
require 'Quiz/FileScoreManager.rb'


# Username Check

username = ENV['LOGNAME'] == '' ? '' : ENV['LOGNAME']
if(username == '')
	then
		print 'Prease input your name: '
		Readline.readline
	end

#q = CsvQuestion.new(pwd + '/data/css-proplist.csv').q;
#q = CsvQuestion.new('data/css-value.csv').q;
q = CsvQuestion.new('keywords.csv').q;
results = []

starttime = Time.now 

q.each{|current|
	puts current['Question']
	print 'input:'
	input = Readline.readline 
	result = current['Answer'] == input ? true : false
	results.push({current['Question'] => result}) 
}
endtime = Time.now
totaltime = (endtime - starttime).to_i 

#score = NullScoreManager.new(username,results,totaltime)
score = FileScoreManager.new('/tmp/tmp',username,results,totaltime)


puts score.username + "'s Result: " + score.score.to_s + ' of ' + score.questions.to_s + ' (' + (score.score.to_f / score.questions.to_f * 100).to_s + '%)'

puts totaltime.to_s + ' seconds'
