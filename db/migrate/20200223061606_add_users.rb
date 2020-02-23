class AddUsers < ActiveRecord::Migration[6.0]
  require 'csv'
  
  def up
    file = CSV.read('assets/data/training_data.16000.csv')
    user_handles = file.map { |row| row[4] }.uniq
    user_handles.each do |handle|
      User.create(handle: handle)
    rescue StandardError => e
      puts "Creation failed for user=#{handle} erroe=#{e.message}"
    end
  end

  def down
    User.destroy_all
  end
end
