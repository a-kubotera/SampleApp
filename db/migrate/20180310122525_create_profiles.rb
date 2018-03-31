class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.references :user, index: { unique: true }, foreign_key: true, null: false, comment: 'ユーザーID'
      t.string     :email,                                comment: 'メールアドレス'
      t.references :prefecture, null: false,              comment: '都道府県'
      t.string     :city,                                 comment: '区市町村'
      t.string     :tell,       null: false,              comment: '電話番号'
      t.timestamps
    end
  end
end
