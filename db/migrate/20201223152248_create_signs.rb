class CreateSigns < ActiveRecord::Migration[6.0]
  def change
    create_table :signs do |t|
      t.string :name
      t.daterange :duration

      t.timestamps
    end
  end
end
