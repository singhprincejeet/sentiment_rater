class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :handle, null: false, index: { unique: true }
      
      t.timestamps
    end
  end
end
