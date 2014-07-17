class RenameBodyToContentOnShouts < ActiveRecord::Migration
  def change
    rename_column :shouts, :body_type, :content_type
    rename_column :shouts, :body_id, :content_id
  end
end
