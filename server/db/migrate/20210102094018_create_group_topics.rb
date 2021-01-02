class CreateGroupTopics < ActiveRecord::Migration[6.1]
  def change
    create_table :group_topics, id: false do |t|
      t.bigint :group_id, null: false
      t.bigint :topic_id, null: false
      t.timestamps
    end
    add_foreign_key :group_topics, :groups, primary_key: 'group_id', on_delete: :restrict
    add_foreign_key :group_topics, :topics, primary_key: 'topic_id', on_delete: :cascade
    add_index :group_topics, [:group_id, :created_at]
    add_index :group_topics, [:group_id, :topic_id], unique: true
  end
end
