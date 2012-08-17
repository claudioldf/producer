class AddDraftAndSlugToPost < ActiveRecord::Migration
  def change
    add_column :posts, :draft, :boolean
    add_column :posts, :slug, :string
  end
end
