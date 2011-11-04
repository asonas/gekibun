class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :message
      t.integer :tweet_id

      t.timestamps
    end
  end
end
