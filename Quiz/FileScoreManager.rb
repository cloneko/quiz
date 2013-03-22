$LOAD_PATH << (File.dirname(__FILE__))
require 'pstore'
require 'ScoreManager.rb'

class FileScoreManager < Quiz::ScoreManager
	def initialize(filename = '/tmp/tmp',name = '',result = nil,time = nil)
    @@result = result
    @@username = name
    @@filename = filename
    @@time = time

    total
    scoreupdate
	end


  def scoreupdate
    db = PStore.new(@@filename)
    db.transaction do
      puts @@time
      puts @@score

      current = db.fetch(@@username,[])

      if current == [] || (current['time'].to_i >= @@time.to_i && current['score'].to_i >= @@score.to_i)
        db[@@username] = {'time' => @@time,'score' => @@score,'date' => Time.now.to_i }
      end
      db.commit
    end


  end

end
