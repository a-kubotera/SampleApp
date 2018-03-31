class CreatePossessGames < ActiveRecord::Migration[5.1]
  def change
    create_table :possess_games, comment: '所持ゲーム機' do |t|
      t.references :profile,          null: false, comment: 'プロフィールID'
      t.references :game_console,     null: false, comment: 'ゲーム機ID'
    end
    # add_index :porfile_game_consoles, [:profile_id, :game_consoles_id], unique: true, name: 'index_profile_game_consoles'
  end
end
