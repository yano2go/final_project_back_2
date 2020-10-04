class CreateGifs < ActiveRecord::Migration[6.0]
  def change
    create_table :gifs do |t|
      t.string :name
      t.string :category
      t.string :description
      t.string :gif_url

      t.timestamps
    end
  end
end
