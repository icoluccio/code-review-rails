class RemoveImageAndNicknameAndNameFromUsers < ActiveRecord::Migration[5.1]
  def change

    remove_column :users, :image, :string

    remove_column :users, :nickname, :string

    remove_column :users, :name, :string
  end
end
