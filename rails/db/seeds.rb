# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

12.times do |n|
  name = Faker::Internet.unique.username
  email = Faker::Internet.unique.email
  password = Faker::Internet.password
  User.create!(email: email,
              password: password,
              username: name,
              confirmed_at: Time.zone.now,
              icon: File.open("./public/seed/icon-#{n}.png")
  )
end

Product.create!(
  imageurl:File.open("./public/seed/product-01.jpg"),
  itemcaption:"大きな穴からペーパーの先端が出ることで、
  注がれたお湯がドリッパーからの制限を受けることなく、
  よりネルドリップに近い抽出ができる
  また、お湯を注ぐ速度により珈琲の味を変えることができるため、
  お好みの珈琲が楽しめる
  珈琲粉の膨らみを妨げない、スパイラルリブ採用
  ドリッパー内部のリブ（凸部）を高く上部まで付けることにより、
  ペーパーとドリッパーの密着をふせぎ、空気の抜ける空間ができる
  蒸らしの際に、この空間から空気が抜け珈琲粉がしっかりと膨らむ",
  itemname: "ハリオV60コーヒードリッパー01",
  itemprice: 1027,
  itemurl: "https://www.amazon.co.jp/HARIO-%E3%83%8F%E3%83%AA%E3%82%AA-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%89%E3%83%AA%E3%83%83%E3%83%97-VDG-01B/dp/B002VUP2M8/ref=sr_1_20?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&dchild=1&keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC&qid=1615521096&sr=8-20",
  shopname: "HARIO",
)

Product.create!(
  imageurl:File.open("./public/seed/product-02.jpg"),
  itemcaption:"カリタ三つ穴ドリッパー
  雑味がでる前に美味しさだけをドリップする
  軽くて扱い易いプラスチック製
  1~2人用",
  itemname: "カリタ コーヒードリッパー 101-D ",
  itemprice: 417,
  itemurl: "https://www.amazon.co.jp/Kalita-%E3%82%AB%E3%83%AA%E3%82%BF-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%A1%E3%82%B8%E3%83%A3%E3%83%BC-1-2%E4%BA%BA%E7%94%A8-04001/dp/B001TM6FF2/ref=psdc_251688011_t4_B002VUP2M8",
  shopname: "Kalita",
)
Product.create!(
  imageurl:File.open("./public/seed/product-03.jpg"),
  itemcaption:"長時間フィルターとウェーブゾーンにコーヒー液がとどまらないので、
  雑美成分の抽出が少なく美味しさだけをドリップするドリッパー【
  特長】・味ブレの少ないドリップコーヒーを、ご家庭で手軽にお楽しみいただけるドリッパー。
  ・このフィルターは底が平らになっており、注ぐお湯が多少ブレてもしっかりと粉全体に馴染んでくれる特長があります。
  ・また、カリタの特長である3つの穴があいており、長時間お湯が溜まりにくいため雑味が少なく、美味しいドリップを可能にしてくれます。
  ・1～2人用です。",
  itemname: "カリタ ウェーブドリッパー 155",
  itemprice: 1650,
  itemurl: "https://www.amazon.co.jp/%E3%82%AB%E3%83%AA%E3%82%BF-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC-%E3%82%B9%E3%83%86%E3%83%B3%E3%83%AC%E3%82%B9%E8%A3%BD-%E3%82%A6%E3%82%A7%E3%83%BC%E3%83%96%E3%82%B7%E3%83%AA%E3%83%BC%E3%82%BA-04021/dp/B004W5L1XY/ref=rtpb_17?pd_rd_w=j47TD&pf_rd_p=c221ae92-96f8-424c-884c-196b2fc439b0&pf_rd_r=DVH847KYHQYS2NKNT365&pd_rd_r=e086efea-4a5b-4832-bbfa-e860a0963f39&pd_rd_wg=VUQ1u&pd_rd_i=B004W5L1XY&psc=1",
  shopname: "Kalita",
)
Product.create!(
  imageurl:File.open("./public/seed/product-04.jpg"),
  itemcaption: "おいしいコーヒーを淹れるためには、抽出量と抽出時間の計測が不可欠。
  V60ドリップスケールは両方を同時に計測することができるハンドドリップのためのスケール
  ※V60メタルドリップスケールは充電式バッテリー/バックライト仕様",
  itemname: "V60メタルドリップスケール ヘアラインシルバー  VSTM-2000HSV",
  itemprice: 6682,
  itemurl: "https://www.amazon.co.jp/dp/B00TF7AJ64/ref=sspa_dk_detail_2?psc=1&pd_rd_i=B00TF7AJ64p13NParams&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyOVFMVUpEQTJYQ1FVJmVuY3J5cHRlZElkPUEwODUzNjE5RjUyRkg3VVRKMEwzJmVuY3J5cHRlZEFkSWQ9QTNMQlIyU1pXWUtKS1gmd2lkZ2V0TmFtZT1zcF9kZXRhaWwyJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==",
  shopname: "HARIO",
)
Product.create!(
  imageurl:File.open("./public/seed/product-05.jpg"),
  itemcaption:"●セラミック製の臼は摩擦熱が発生しにくく、熱によるコーヒー粉へのダメージを防ぐ。
  ●透明な目盛り付きボトルなので、挽いた量が一目でわかり、計量カップいらず。
  ●粉の粗さは、つまみを回すだけで簡単に調節可能。
  ●使用しない時は、ハンドルを本体に引っ掛けて収納できるので、置き場をとらず便利。",
  itemname: "ハリオ　コーヒーミル 手挽き セラミック スリム MSS-1TB",
  itemprice: "2118",
  itemurl: "https://www.amazon.co.jp/HARIO-%E3%83%8F%E3%83%AA%E3%82%AA-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%9F%E3%83%AB-%E3%82%BB%E3%83%A9%E3%83%9F%E3%83%83%E3%82%AF-MSS-1TB/dp/B001804CLY/ref=rtpb_1?pd_rd_w=zKV8Y&pf_rd_p=c221ae92-96f8-424c-884c-196b2fc439b0&pf_rd_r=GQEG37KEA87W4MKJRSVQ&pd_rd_r=1fc8179a-32ef-42f5-8b88-ec4c4161355f&pd_rd_wg=sPx9o&pd_rd_i=B001804CLY&psc=1",
  shopname: "HARIO",
)
Product.create!(
  imageurl:File.open("./public/seed/product-06.jpg"),
  itemcaption:"初心者からプロのバリスタまで、誰もが手軽に、ベストな味わいをお楽しみいただけるKalitaオリジナルのプロダクトシリーズ
  ウェーブフィルター185(155)は、ドリッパーとの接触面が少ないから、長時間フィルター内のかたよったところにお湯がたまらず、すみやかにドリップされる
  かたよってお湯を注いでも、ウェーブゾーンは底が平らなので粉に均一になじみやすい",
  itemname: "カリタ コーヒーフィルター ウェーブシリーズ ホワイト 1~2人用 50枚入り ",
  itemprice: 265,
  itemurl: "https://www.amazon.co.jp/%E3%82%AB%E3%83%AA%E3%82%BF-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF%E3%83%BC-%E3%82%A6%E3%82%A7%E3%83%BC%E3%83%96%E3%82%B7%E3%83%AA%E3%83%BC%E3%82%BA-KWF-155-22211/dp/B077GNRRM7/ref=pd_rhf_dp_s_pd_crcd_3?pd_rd_w=OZm3y&pf_rd_p=c64ec15c-e5a8-4bbe-8e01-8e7767b5ef59&pf_rd_r=0ZBWYR3CA0FXXX78R49Y&pd_rd_r=7423904f-a731-4f7f-a4b7-7f7205329884&pd_rd_wg=lk4fH&pd_rd_i=B077GNRRM7&psc=1",
  shopname: "Kalita",
)
Product.create!(
  imageurl:File.open("./public/seed/product-07.jpg"),
  itemcaption:"●抽出温度が一目で分かる温度計が蓋の中央に付いている便利なドリップケトル
  ●コーヒーの味を決める大事な要素となるお湯の温度。
  ●一般的に最適な抽出温度と言われている84度~92度の部分が一目でが分かりやすい目盛り
  ●湯量の微調整ができる注ぎやすい細口タイプ
  ●お湯を一定の量で静かに落とすことができ、微妙な調整も自在
  ●少しづつ丁寧に注ぐことで、じっくりと蒸らしながら美味しいコーヒーを抽出することができます
  ●ドリップしやすい細口形状・握りやすいグリップ形状",
  itemname: "シービージャパン ドリップケトル ブラック QAHWA",
  itemprice: 5335,
  itemurl: "https://www.amazon.co.jp/dp/B076H5SW81/ref=sspa_dk_detail_6?psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzTEUzOEg1VTI3V1FWJmVuY3J5cHRlZElkPUEwMTkxOTk0Mk5ONDdLM0k2TVdZVSZlbmNyeXB0ZWRBZElkPUFKOTNSVkpSUDRQR0wmd2lkZ2V0TmFtZT1zcF9kZXRhaWwyJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==",
  shopname: "シービージャパン",
)
Product.create!(
  imageurl:File.open("./public/seed/product-08.jpg"),
  itemcaption:"源がついていない時はまっさらな黒いボックスのように見えるほどシンプルなデザインでかっこいいです。
  type-CのUSBで充電できるタイプです。
  サイズは、15.2cm × 13cm × 2.6cmで、大きすぎず、小さいすぎず、ちょうどいいサイズ。
  計量は、0.5ｇ – 2000ｇまで可能。
  カラーはホワイトとブラックの2色展開。",
  itemname: "TIMEMORE コーヒー用スケール LED TES005 (ブラック)",
  itemprice: 5700,
  itemurl: "https://www.amazon.co.jp/dp/B07YCSF8VP/ref=sspa_dk_detail_4?psc=1&pd_rd_i=B07YCSF8VP&pd_rd_w=nBFKI&pf_rd_p=cc3bc4d9-2af6-4e19-b3b8-31051adadc9e&pd_rd_wg=0x2Pi&pf_rd_r=CWXRTAF3WZK32SYCA541&pd_rd_r=a5fcede2-5176-42a4-8530-6a85ca96866f&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEzM1laOFNPWFUxOTlPJmVuY3J5cHRlZElkPUEwMDMxMDYzMzBXRUVPNjA1TDdYTSZlbmNyeXB0ZWRBZElkPUExWUpCSkNYQjY0SjZUJndpZGdldE5hbWU9c3BfZGV0YWlsJmFjdGlvbj1jbGlja1JlZGlyZWN0JmRvTm90TG9nQ2xpY2s9dHJ1ZQ==",
  shopname: "TIMEMORE",
)
Product.create!(
  imageurl:File.open("./public/seed/product-09.jpg"),
  itemcaption:"オール耐熱ガラス製のサーバー
  ●ポット・フタとともに耐熱ガラス製のサーバーです。
  ●フタにはシリコンパッキン付きの安心設計です。
  ●V60シリーズのサーバーとして、フタの上にV60ドリッパー(VD-01、02、03)がのせられるデザイン。
  ●フタをしたまま電子レンジOK。
  ※V60シリーズ「02」サイズ対応のサーバーです。",
  itemname: "HARIO (ハリオ) V60 レンジサーバー コーヒードリップ 600ml クリア XGS-60TB",
  itemprice: 1545,
  itemurl: "https://www.amazon.co.jp/HARIO-%E3%83%8F%E3%83%AA%E3%82%AA-%E3%83%AC%E3%83%B3%E3%82%B8%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%89%E3%83%AA%E3%83%83%E3%83%97-XGS-60TB/dp/B000P4931S/ref=rtpb_1?pd_rd_w=e6U7t&pf_rd_p=c221ae92-96f8-424c-884c-196b2fc439b0&pf_rd_r=N9DBW7BD51BFJ7KCQEN0&pd_rd_r=f70fbe62-9f5e-4815-bf9c-d3deb8687589&pd_rd_wg=0k4zY&pd_rd_i=B000P4931S&psc=1",
  shopname: "HARIO",
)
Product.create!(
  imageurl:File.open("./public/seed/product-10.jpg"),
  itemcaption:"いつでもどこでも使いやすい、簡単、コンパクトな「AEROPRESS (R) GO」
  空気の力を利用したコーヒー抽出器具エアロプレスコーヒーメーカーの持ち運び便利なコンパクトタイプ
  すべての部品を一つにまとめて、持ち運びできる",
  itemname: "エアロプレスゴー",
  itemprice: 5940,
  itemurl: "https://www.amazon.co.jp/%E3%82%A8%E3%82%A2%E3%83%AD%E3%83%97%E3%83%AC%E3%82%B9-AEROPRESS-%E3%82%A8%E3%82%A2%E3%83%AD%E3%83%97%E3%83%AC%E3%82%B9%E3%82%B4%E3%83%BC/dp/B086LFKT6T/ref=sr_1_8?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&dchild=1&keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC+%E3%82%A2%E3%82%A4%E3%83%86%E3%83%A0&qid=1615528194&sr=8-8",
  shopname: "エアロプレス",
)
