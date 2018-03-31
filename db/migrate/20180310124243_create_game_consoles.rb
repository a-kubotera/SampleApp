class CreateGameConsoles < ActiveRecord::Migration[5.1]
  def change
    create_table :game_consoles, comment: 'ゲーム機' do |t|
      t.string     :name,     null: false,  comment: 'ゲーム機名'
      t.timestamps
    end
    add_index :game_consoles, :name, unique: true
  end
end
