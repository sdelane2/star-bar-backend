class CreateFavoriteHoroscopes < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_horoscopes do |t|
      t.integer :user_id
      t.integer :horoscope_id
      t.timestamps
    end
  end
end
