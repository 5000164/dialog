class CreateStatements < ActiveRecord::Migration[6.1]
  def change
    create_table :statements, primary_key: 'statement_id' do |t|
      t.bigint :user_id, null: false
      t.bigint :group_id, null: false
      t.string :content, null: false
      t.timestamps
    end
    add_foreign_key :statements, :users, primary_key: 'user_id', on_delete: :cascade
    add_foreign_key :statements, :groups, primary_key: 'group_id', on_delete: :restrict
    add_index :statements, [:group_id, :created_at]
  end
end
