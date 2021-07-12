class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|
      t.string:postal_code,        null: false
      t.integer:prefectures_id,    null: false
      t.string:municipality,       null: false
      t.string:building
      t.string:tel,                null: false
      t.references :purchase,      null: false, foreign_key: true
      t.timestamps
    end
  end
end
