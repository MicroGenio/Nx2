class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      t.boolean :like
      t.integer :marketer_id, :idea_id
      t.timestamps
    end
  end
end
