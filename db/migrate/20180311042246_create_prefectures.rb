class CreatePrefectures < ActiveRecord::Migration[5.1]
  def change
    create_table :prefectures, comment: '都道府県' do |t|
      t.string :name, null: false, comment: '都道府県名'
    end
  end
end
