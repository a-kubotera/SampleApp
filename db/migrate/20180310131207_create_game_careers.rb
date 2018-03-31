class CreateGameCareers < ActiveRecord::Migration[5.1]
  def change
    create_table :game_careers, comment: 'ゲーム経歴' do |t|
      t.references :profile,  null: false, comment: 'プロフィールID'
      t.string     :name,     null: false, comment: '経歴'
    end
  end
end
