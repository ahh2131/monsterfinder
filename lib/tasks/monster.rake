namespace :monster do
  desc "TODO"
  task cleanup: :environment do

    monsters = Monster.where('created_at < ?', Time.now - 5.days).where("total_vote_count < ?", 1).count
  end

end
