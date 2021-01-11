class CreateAvatars < ActiveRecord::Migration[6.1]
  def change
    create_table :avatars, primary_key: 'avatar_id' do |t|
      t.string :name, null: false
      t.string :image_path, null: false
      t.timestamps
    end
  end
end
