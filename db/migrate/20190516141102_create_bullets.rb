class CreateBullets < ActiveRecord::Migration[5.2]
  def change
    create_table :bullets do |t|
      t.string :gratitude
      t.string :priority
      t.string :accomplishment
      t.string :reflection
      t.string :favorite
      t.string :photo
      t.date :date
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
