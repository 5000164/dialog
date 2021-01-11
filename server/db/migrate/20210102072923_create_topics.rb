class CreateTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :topics, primary_key: 'topic_id' do |t|
      t.bigint :user_id, null: false
      t.bigint :group_id, null: false, index: true
      t.string :content, null: false
      t.timestamps
    end
    add_foreign_key :topics, :users, primary_key: 'user_id', on_delete: :cascade
    add_foreign_key :topics, :groups, primary_key: 'group_id', on_delete: :restrict
  end
end
