class CreateArtists < ActiveRecord::Migration[7.0]
  def change
    create_table :artists do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :about, null: false

      t.timestamps
    end
  end
end
