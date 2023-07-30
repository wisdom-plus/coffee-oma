News.create!(
  title: 'coffee-omaのサービス開始のお知らせ',
  user_id: 1,
  publicshed_at: Time.now,
  active: true
)
ActionText::RichText.create!(
  record_type: 'News',
  record_id: 1,
  name: 'content',
  body: '<p>新サービス「Coffee-oma」を開始いたします。本サービスは、コーヒーに関するアイテムやコーヒー豆のレビューサイトとなっており、レビュー機能、ライク機能を実装。<br>ユーザー同士の交流を促進するための機能として、フォロー機能、リアルタイムチャット機能を実装しております。</p><p><br>利用無料となっており、あなたのコーヒーライフにぜひご活用ください。</p><p>あなたのレビューを心よりお待ちしております。</p>'
)

puts 'News created!'
