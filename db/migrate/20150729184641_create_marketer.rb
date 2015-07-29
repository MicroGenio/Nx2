class CreateMarketer < ActiveRecord::Migration
  def change
    create_table :marketers do |t|
      t.string :marketername
      t.string :email
      t.timestamps
    end
  end
end
