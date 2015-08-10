class AddAdminToMarketers < ActiveRecord::Migration
  def change
    add_column :marketers, :admin, :boolean, default: false
  end
end
