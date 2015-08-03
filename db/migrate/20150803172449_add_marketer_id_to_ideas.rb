class AddMarketerIdToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :marketer_id, :integer
  end
end
