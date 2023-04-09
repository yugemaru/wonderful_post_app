class ChangeColumnName < ActiveRecord::Migration[6.1]
  def change
    def up
      rename_column :tag_articles, :article_id,:articles_id
      rename_column :tag_articles, :tag_id, :tags_id
    end
  end
end
