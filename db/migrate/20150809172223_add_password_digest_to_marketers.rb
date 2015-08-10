class AddPasswordDigestToMarketers < ActiveRecord::Migration
  def change
    add_column :marketers, :password_digest, :string
  end
end
