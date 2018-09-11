class CreatePlayerTable < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :name
      t.string :location
      t.integer :age
    end
  end
end
