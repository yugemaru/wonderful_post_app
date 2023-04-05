class ArticlesUserId < ActiveRecord::Migration[6.1]
  def change
    change_column :articles, :user_id, :bigint, null: false
  end
end
