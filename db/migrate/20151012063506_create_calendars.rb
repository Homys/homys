class CreateCalendars < ActiveRecord::Migration
  def change
    create_table :calendars do |t|
      t.string :name
      t.datetime :date
      t.string :importance
      t.integer :owner_id

      t.timestamps null: false
    end
  end
end
