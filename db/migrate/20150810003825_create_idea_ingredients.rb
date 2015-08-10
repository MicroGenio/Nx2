class CreateIdeaIngredients < ActiveRecord::Migration
  def change
    create_table :idea_ingredients do |t|
      t.integer :ingredient_id
      t.integer :idea_id
    end
  end
end
