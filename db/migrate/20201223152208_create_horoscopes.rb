class CreateHoroscopes < ActiveRecord::Migration[6.0]
  def change
    create_table :horoscopes do |t|
      t.string :current_date
      t.string :description
      t.integer :lucky_number
      t.string :lucky_color
      t.string :mood
      t.string :compatibility

      t.timestamps
    end
  end
end
