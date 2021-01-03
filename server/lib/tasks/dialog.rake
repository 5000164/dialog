namespace :dialog do
  desc "システムユーザーを追加する"
  task add_system_user: :environment do |task|
    user = User.new
    user.save
    Rails.logger.info "#{task.name}: システムユーザーを追加しました"
  end
end
