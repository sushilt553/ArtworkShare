class ChangeLIkeable < ActiveRecord::Migration[5.2]
  def change
    remove_column :likes, :likeable_type
    add_column :likes, :likeable_type, :string
  end
end
