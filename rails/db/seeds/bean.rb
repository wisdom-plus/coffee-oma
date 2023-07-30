Bean.create!(
  area: 'スルミナス',
  country: 'ブラジル',
  description: '主に南米のアラビカ種を配合したオーガニックブレンドはディープなコクのある苦味と、 ほのかな甘みと包み込む様な、 優しい酸味が特徴的です',
  images: [File.open('./public/seed/bean-01.jpg')],
  name: 'TOKYO COFFEE',
  purification: 'ナチェラル',
  roast: 'ミディアム',
  url: 'https://www.amazon.co.jp/TOKYO-COFFEE-%E6%9D%B1%E4%BA%AC%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC-%E3%82%AA%E3%83%BC%E3%82%AC%E3%83%8B%E3%83%83%E3%82%AF%E3%83%96%E3%83%AC%E3%83%B3%E3%83%89-%E8%87%AA%E5%AE%B6%E7%84%99%E7%85%8E%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC/dp/B01AABXQ36/ref=sr_1_2_sspa?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&dchild=1&keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E8%B1%86&qid=1615536696&sr=8-2-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyNjdHRTVFTVc0NUJEJmVuY3J5cHRlZElkPUExMDQ2NjU1MlkzVDBKVk8yODJUTiZlbmNyeXB0ZWRBZElkPUFVVlpST0o5Wk5HNTImd2lkZ2V0TmFtZT1zcF9hdGYmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl',
  user: User.find(1),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30D6\u30E9\u30B8\u30EB \u30D6\u30EC\u30F3\u30C9]
)
Bean.create!(
  area: 'キアンバ',
  country: 'ケニア',
  description: "偶然買ったコーヒー豆ですが、おいしかったのでシェアさせ��いただきます。
  どこで買ったのかを忘れてしまったのですがまたどこかで出会いたいです
  浅煎り的焙煎が効いた味ですごく美味しいです",
  images: [File.open('./public/seed/bean-02.jpg')],
  name: Faker::Coffee.unique.blend_name,
  purification: 'ナチェラル',
  roast: '焙煎度不明',
  user: User.find(1),
  tag_list: ['コーヒー豆', ' ケニア', 'ナチェラル']
)
Bean.create!(
  area: 'セラード',
  country: 'ブラジル',
  description: "Little Napで販売されているオリジナルブレンドです
  深煎りの豆です",
  images: [File.open('./public/seed/bean-03.jpg')],
  name: 'Little Nap original blend',
  purification: 'ナチェラル',
  roast: 'フルシティ',
  user: User.find(9),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30D6\u30E9\u30B8\u30EB \u30D6\u30EC\u30F3\u30C9 \u30D5\u30EB\u30B7\u30C6\u30A3]
)
Bean.create!(
  country: 'ブラジル　エチオピア',
  description: 'たいへんおいしいコーヒーブレンドです',
  images: [File.open('./public/seed/bean-04.jpg')],
  name: 'Mocha blend',
  purification: 'ウォッシュド',
  roast: 'ハイ',
  user: User.find(4),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30D6\u30E9\u30B8\u30EB \u30D6\u30EC\u30F3\u30C9 \u30A8\u30C1\u30AA\u30D4\u30A2]
)
Bean.create!(
  area: 'アンティグア',
  country: 'グァテマラ',
  description: 'グァテマラ特有のコクがあり、コーヒーらしい味になっています',
  images: [File.open('./public/seed/bean-05.jpg')],
  name: 'ALL ARABICA coffee',
  purification: 'ナチェラル',
  roast: 'シティ',
  user: User.find(7),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30B0\u30A1\u30C6\u30DE\u30E9 \u30B7\u30C6\u30A3 \u30CA\u30C1\u30A7\u30E9\u30EB]
)
Bean.create!(
  country: 'コロンビア',
  description: '収穫量が少ない希少な超大型豆。酸味はまろやかで香ばしいほろ苦さ',
  images: [File.open('./public/seed/bean-06.jpg')],
  name: '珈琲問屋',
  purification: 'ナチェラル',
  roast: 'フルシティ',
  user: User.find(3),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30B3\u30ED\u30F3\u30D3\u30A2 \u30D5\u30EB\u30B7\u30C6\u30A3 \u30CA\u30C1\u30A7\u30E9\u30EB
               \u30DE\u30E9\u30B4\u30B8\u30C3\u30DA]
)
Bean.create!(
  country: 'エチオピア',
  description: "エチオピア西部ウォレガ地方の産出品であるモカレケンプティは、野性的な栽培をされているため、独特の風味をもっています。エチオピアの非水洗式精製コーヒーは品質に多少のブレが生じがちですが、本品は品質的には安定している地域です。
  モカ特有の果実ような芳醇な香りで甘く、フルーティーなアロマを感じます。とても柔らかな酸味をもち、上品で甘美な味わいが堪能出来る逸品です。",
  images: [File.open('./public/seed/bean-07.jpg')],
  name: '珈琲問屋',
  purification: 'ナチェラル',
  roast: 'ミディアム',
  user: User.find(10),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30A8\u30C1\u30AA\u30D4\u30A2 \u30DF\u30C7\u30A3\u30A2\u30E0 \u30CA\u30C1\u30A7\u30E9\u30EB
               \u30E2\u30AB\u30EC\u30B1\u30F3\u30D7\u30C7\u30A3]
)
Bean.create!(
  area: 'コナ',
  country: 'ハワイ',
  description: "【特徴���
  甘い香りと柔らかな酸味をもつミディアムボディー。ワイン風味のなかにスパイシーな風味が見事に調和されています。",
  images: [File.open('./public/seed/bean-08.jpg')],
  name: '珈琲問屋',
  purification: 'ナチェラル',
  roast: 'フルシティ',
  user: User.find(8),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30CF\u30EF\u30A4 \u30D5\u30EB\u30B7\u30C6\u30A3 \u30CA\u30C1\u30A7\u30E9\u30EB \u30B3\u30CA]
)
Bean.create!(
  country: 'キューバ',
  description: "酸味とコクのバランスがとれブレンドのベースにも適する良質なコーヒー。
  産地：キューバ",
  images: [File.open('./public/seed/bean-09.jpg')],
  name: '珈琲問屋',
  purification: 'ナチェラル',
  roast: 'フレンチ',
  user: User.find(6),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30AD\u30E5\u30FC\u30D0 \u30D5\u30EC\u30F3\u30C1 \u30CA\u30C1\u30A7\u30E9\u30EB]
)

Bean.create!(
  country: 'ペルー　ルワンダ　ウェストジャバ',
  description: "ウェストジャバ、ルワンダ、ペルー。環境保全を考えたサステナブルなコーヒー栽培に挑戦する、3つの産地のコーヒーをブレンドし、すべての人にコーヒーの未来を約束するという想いが込められたコーヒー。北米では、“長い冒険”“壮大な旅”を意味する「オデッセイ ブレンド」という名称で親しまれています。

  タンジェリンゼストやマジパン（砂糖とアーモンドを挽いて練りあわせたお菓子）を思わせる風味が特徴のコーヒーです。チョコレートのようななめらかな口あたりで、後味にはちみつの甘みを感じさせます。シトラス感ある酸味とはちみつのような甘みのバランスがとれた爽やかな味わいを、秋の高く澄んだ空と一緒に楽しむのもこの季節だけの特別な時間です。
  --公式ウェブサイトより",
  images: [File.open('./public/seed/bean-10.jpg')],
  name: 'STARBUCKS COFFEE',
  purification: 'ナチェラル',
  roast: 'ミディアム',
  user: User.find(1),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30DF\u30C7\u30A3\u30A2\u30E0 \u30CA\u30C1\u30A7\u30E9\u30EB \u30DA\u30EB\u30FC
               \u30D6\u30EC\u30F3\u30C9]
)
Bean.create!(
  country: 'タンザニア',
  description: "さっぱりとした味わいのコーヒー。キリッとした表情が楽しめる。
  さっぱりとしていて、飲みやすめだが、後味にかけてショートな印象が残念。焙煎が中途半端な浅い味を感じる。
  酸味はあるが、そこまで強くはない。リンゴの酸味。苦さはほぼない。

  さっぱりとしているので、夕方から夜に飲むようなコーヒーというよりは、朝1番に飲みたくなるような味わい。キリッと1日を迎えたくなる。",
  images: [File.open('./public/seed/bean-11.jpg')],
  name: 'ドトール',
  purification: 'ナチェラル',
  roast: 'シティ',
  user: User.find(6),
  tag_list: %W[\u30B3\u30FC\u30D2\u30FC\u8C46 \u30BF\u30F3\u30B6\u30CB\u30A2 \u4E0D\u660E \u30CA\u30C1\u30A7\u30E9\u30EB
               \u30AD\u30EA\u30DE\u30F3\u30B8\u30A7\u30ED]
)

puts 'Bean created!'
