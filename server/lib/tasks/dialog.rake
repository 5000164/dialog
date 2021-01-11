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
end
