class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.string :title
      t.string :description
      t.string :importance
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
