class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users, primary_key: 'user_id' do |t|
      t.timestamps
    end
  end
end
