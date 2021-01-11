class CreateCandidates < ActiveRecord::Migration[6.1]
  def change
    create_table :candidates, primary_key: 'candidate_id' do |t|
      t.bigint :user_id, null: false
      t.timestamps
    end
    add_foreign_key :candidates, :users, primary_key: 'user_id', on_delete: :cascade
    add_index :candidates, :user_id, unique: true
  end
end
