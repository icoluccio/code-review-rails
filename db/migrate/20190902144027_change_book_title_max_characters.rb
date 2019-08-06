class ChangeBookTitleMaxCharacters < ActiveRecord::Migration[5.1]
  def change
    change_column :books, :title, :string, limit: 25
  end
end
