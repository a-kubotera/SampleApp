class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users, comment: 'ユーザー' do |t|
      t.string :name, null: false, comment: 'ユーザー名'
      t.timestamps
    end
  end
end
