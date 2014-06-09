class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.references :commentable, polymorphic: true
      t.belongs_to :user
      t.string :body
      t.timestamps
    end
  end

  def down
    drop_table :comments
  end
end
