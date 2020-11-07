worker_processes 2
pid '/var/run/unicorn.pid'

# developmentとproductionで場合分け
if ENV['RAILS_ENV'] == 'production'
  listen 3000
else
  listen '/share/unicorn.sock'
end

# タイムアウトまでの時間を伸ばす
timeout 600
