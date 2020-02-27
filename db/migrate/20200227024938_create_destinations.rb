class CreateDestinations < ActiveRecord::Migration
  def change
    create_table :destinations do |t|
      t.string :destination
      t.string :content
      t.integer :user_id
      
      t.timestamps null: false
    end
  end
end
