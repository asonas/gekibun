class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.text :commnent_body

      t.timestamps
    end
  end
end
