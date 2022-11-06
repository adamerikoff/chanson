class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :release_date, default: 1995
      t.references :artist, null: false, foreign_key: true

      t.timestamps
    end
  end
end
