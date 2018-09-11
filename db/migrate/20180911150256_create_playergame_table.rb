class CreatePlayergameTable < ActiveRecord::Migration[5.0]
  def change
    create_table :player_games do |t|
      t.integer :player_id
      t.integer :game_id
    end
  end
end
