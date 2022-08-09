class RemoveUserMadeAddUserComments < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :comments, :text
    remove_column :recipes, :made, :boolean
  end
end
