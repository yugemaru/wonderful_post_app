class TagName < ActiveRecord::Migration[6.1]
  def change
    change_column :tags , :name ,:string , null: false
  end
end
