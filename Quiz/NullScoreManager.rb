$LOAD_PATH << (File.dirname(__FILE__))
require 'ScoreManager.rb'

class NullScoreManager < Quiz::ScoreManager
# do nothing
end
