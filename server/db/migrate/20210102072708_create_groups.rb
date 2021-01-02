class CreateGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :groups, primary_key: 'group_id' do |t|
      t.datetime :expired_at, null: false, index: true
      t.timestamps
    end
  end
end
