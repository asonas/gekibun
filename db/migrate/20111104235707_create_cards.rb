class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :message
      t.integer :tweet_id
      t.integer :twitter_user_id
      t.text :twitter_user_name

      t.timestamps
    end
  end
end
