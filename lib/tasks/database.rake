namespace :database do
  desc "TODO"
  task cleanup: :environment do
    Monster.where(name: [Monster::MISSING]).all.destroy_all
  end

end
