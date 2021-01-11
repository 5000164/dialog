namespace :dialog do
  desc "システムユーザーを追加する"
  task add_system_user: :environment do |task|
    user = User.new
    user.save
    Rails.logger.info "#{task.name}: システムユーザーを追加しました"
  end

  desc "アバターを追加する"
  task :add_avatar, [:name, :image_path] => [:environment] do |task, args|
    avatar = Avatar.new(name: args.name, image_path: args.image_path)
    avatar.save
    Rails.logger.info "#{task.name}: アバターを追加しました"
  end

  desc 'グループを作成する'
  task create_group: :environment do |task|
    ActiveRecord::Base.transaction do
      group_expired_at = DateTime.now + 7
      group = Group.new(expired_at: group_expired_at)
      group.save
      avatars = Avatar.all.sample(4)
      Candidate.all.sample(4).map.with_index { |candidate, index|
        user_group = UserGroup.new(user_id: candidate.user_id, group_id: group.group_id, avatar_id: avatars[index].avatar_id)
        user_group.save
        candidate.destroy
      }
    end
    Rails.logger.info "#{task.name}: グループを作成しました"
  end
end
