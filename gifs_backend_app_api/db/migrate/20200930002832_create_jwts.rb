class CreateJwts < ActiveRecord::Migration[6.0]
  def change
    create_table :jwts do |t|

      t.timestamps
    end
  end
end
