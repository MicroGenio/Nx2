class IdeaStyles < ActiveRecord::Migration
  def change
    create_table :idea_styles do |t|
      t.integer :style_id
      t.integer :recipe_id
    end
  end
end