class AddTweets < ActiveRecord::Migration[6.0]
  require 'csv'
  def up
    file = CSV.read('assets/data/training_data.16000.csv')
    file.each do |row|
      user = User.find_by(handle: row[4])
      Tweet.create(id: row[1], content: row[5], user: user, sentiment: row[0])
    rescue StandardError => e
      puts "Creation failed for tweet=#{row[1]} erroe=#{e.message}"      
    end
  end

  def down
    Tweet.destroy_all
  end
end
