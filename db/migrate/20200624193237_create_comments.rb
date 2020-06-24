class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.integer :commenter_id, null: false, index: true
      t.integer :artwork_id, null: false, index: true
      t.text  :body, null: false
      t.timestamps
    end
  end
end
