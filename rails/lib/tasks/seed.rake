Rails.root.glob('db/seeds/*.rb').each do |file|
  desc "Load the seed data from db/seeds/#{File.basename(file)}."
  task "db:seed:#{File.basename(file).gsub(/\..+$/, '')}" => :environment do
    puts "Loading seed data from #{file}..."
    load(file)
  end
end
