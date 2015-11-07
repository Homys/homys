class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.datetime :date
      t.datetime :end_date
      t.text :summary
      t.text :content

      t.timestamps null: false
    end
  end
end
