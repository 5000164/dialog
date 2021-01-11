class CreateUserGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :user_groups, id: false do |t|
      t.bigint :user_id, null: false, index: true
      t.bigint :group_id, null: false, index: true
      t.bigint :avatar_id, null: false
      t.timestamps
    end
    add_foreign_key :user_groups, :users, primary_key: 'user_id', on_delete: :cascade
    add_foreign_key :user_groups, :groups, primary_key: 'group_id', on_delete: :restrict
    add_foreign_key :user_groups, :avatars, primary_key: 'avatar_id', on_delete: :restrict
    add_index :user_groups, [:user_id, :group_id], unique: true
    add_index :user_groups, [:group_id, :avatar_id], unique: true
  end
end
