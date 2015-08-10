class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
    t.text :body
    t.integer :marketer_id, :idea_id
    t.timestamps
    end
  end
end
