# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: "admin@example.com", password: ENV['ADMIN_PASSWORD'],password_confirmation: ENV['ADMIN_PASSWORD]']) if Rails.env.production?
12.times do |n|
  name = Faker::Internet.unique.username
  email = Faker::Internet.unique.email
  password = Faker::Internet.password
  User.create!(email: email,
              password: password,
              username: name,
              confirmed_at: Time.zone.now,
              icon: File.open("./public/seed/icon-#{n+1}.png")
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
  tag_list: ["コーヒー" ,"ドリッパー", "HARIO", "V60"]
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
  tag_list: ["コーヒー" ,"カリタ" ,"ドリッパー"]
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
  tag_list: ["コーヒー", "カリタ", "ドリッパー", "ウェーブドリッパー"]
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
  tag_list: ["コーヒー" ,"スケール", "HARIO", "V60"]
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
  tag_list: ["コーヒー", "コーヒーミル", "ハリオ", "HARIO", "ミル"]
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
  tag_list: ["コーヒー" ,"カリタ" ,"ウェーブ", "コーヒーフィルター", "ホワイト"]
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
  tag_list: ["コーヒー" ,"ドリップケトル", "シービージャパン", "ブラック"]
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
  tag_list: ["コーヒー", "コーヒースケール", "TIMEMORE","ホワイト", "ブラック"]
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
  tag_list: ["コーヒー", "サーバー", "ハリオ" ,"コーヒーサーバー" ,"V60"]
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
  tag_list: ["コーヒー" ,"エアロプレス" ,"エアロプレスGO"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-11.jpg"),
  itemcaption: "贅沢なくつろぎの時間を演出するオリーブウッド
  ぬくもりのあるオリーブウッドのハンドルは使うほどに手になじみます。
  V60計量スプーン付き",
  itemname: "ドリップポット ウッドネック オリーブウッド DPW-1-OV",
  itemprice: 3960,
  itemurl: "https://www.tonya.co.jp/shop/g/g39458/",
  shopname: "HARIO",
  tag_list: ["コーヒー" ,"HARIO" ,"ドリップポット","ネルドリップ"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-12.jpg"),
  itemcaption: "珈琲粉と水だけでアイス珈琲が作れます。
  粉全体が湿るように少量ずつ水を注ぎ、「の」の字を描くようにドリップします。水を注ぎ終えたら、冷蔵庫で8時間程抽出してできあがりです。",
  itemname: "水出し珈琲ポットミニ 600ml　MCPN-7CBR",
  itemprice: 997,
  itemurl: "https://www.tonya.co.jp/shop/g/g39476/",
  shopname: "HARIO",
  tag_list: ["コーヒー" ,"HARIO" ,"水出しコーヒー"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-13.jpg"),
  itemcaption: "●イタリア100年の伝統。
  ●1919年から今日に渡り、100年以上も調理器具を作り続けてきたビアレッティはイタリアの老舗ブランドです。
  ●定番ともいえる直火式エスプレッソメーカー「モカエキスプレス」は、伝統的な美しいフォルムをそのままに、人間工学に基づいた新しいハンドルを採用するなど、今でも細部へのこだわりと進化を続けています。

  ●ビアレッティのアイコンともいえる「モカエキスプレス」
  ●1933年に発売されてからほとんど形を変えず、世界中で愛されています。
  ●形が変わらないのは変える必要がないから。おいししエスプレッソを入れる道具として完成された形です。

  ●モカエキスプレスで簡単にエスプレッソを淹れることができます。
  ●出来立てのエスプレッソにミルクを入れて本格的なカフェラテやカプチーノに。お湯で割れば好みの濃さのアメリカンにもなります。
  ●アレンジができるのもモカエキスプレスならではの特徴です。
  ●お好きな時間、お好きな場所でエスプレッソをお楽しみいただけます。",
  itemname: "ビアレッティ モカエキスプレス 0001162/AP",
  itemprice: 3173,
  itemurl: "https://www.amazon.co.jp/BIALETTI-%E3%83%93%E3%82%A2%E3%83%AC%E3%83%83%E3%83%86%E3%82%A3-06799-%E3%83%A2%E3%82%AB%E3%82%A8%E3%82%AD%E3%82%B9%E3%83%97%E3%83%AC%E3%82%B9-3%E3%82%AB%E3%83%83%E3%83%97/dp/B0000AN3QI/ref=sr_1_7?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%2B%E5%99%A8%E5%85%B7&qid=1638594643&sr=8-7&th=1",
  shopname: "BIALETTI",
  tag_list: ["コーヒー" ,"BIALETTI" ,"水出しコーヒー","マキネッタ","モカエキスプレス"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-14.jpg"),
  itemcaption: "水出しアイスコーヒー専用ストレーナー付き
  フィルターは300メッシュ (目の細かい)のポリエステルを使用。水洗いしてくり返し使える
  サーバーは耐久性に優れる素材を使用。軽量で、落としても割れない
  注いだ量が分かりやすい目盛り付き
  液だれしにくい注ぎ口形状",
  itemname: "珈琲考具 コーヒーサーバー 水出しフィルター付き ",
  itemprice: 2200,
  itemurl: "https://www.amazon.co.jp/%E4%B8%8B%E6%9D%91%E4%BC%81%E8%B2%A9-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC-%E5%89%B2%E3%82%8C%E3%81%AB%E3%81%8F%E3%81%84%E3%82%B5%E3%83%BC%E3%83%90%E3%83%BC-%E6%B0%B4%E5%87%BA%E3%81%97%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF%E3%83%BC%E4%BB%98%E3%81%8D-42922/dp/B08R849PX9/ref=sr_1_78?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%2B%E5%99%A8%E5%85%B7&qid=1638595316&sr=8-78&th=1",
  shopname: "下村企販",
  tag_list: ["コーヒー" ,"下村企販" ,"水出しコーヒー","コーヒーサーバー","樹脂製"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-15.jpg"),
  itemcaption: "ドリップ時に発生するガスを外に逃がす! 壁のないドリッパー
  ガスの抜けが良いので、お湯が均一にコーヒー粉を通り雑味を出さない
  香りをダイレクトに抽出できて、豆のもつ旨みを最大限に引き出す
  コーヒーサーバーやカップに直接セットして使用できる
  1~2杯用・2~4杯用・4~6杯用のフィルターに使用できる
  ワイヤーフレームのすき間からドリップした量が確認でき、淹れすぎを防げる",
  itemname: "珈琲考具 ワンドリッパー",
  itemprice: 1980,
  itemurl: "https://www.amazon.co.jp/%E4%B8%8B%E6%9D%91%E4%BC%81%E8%B2%A9-%E7%8F%88%E7%90%B2%E8%80%83%E5%85%B7-%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC-%E3%83%AF%E3%83%B3%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC-42158/dp/B07ZRZZCRF/ref=pd_vtp_21/355-5607422-3177714?pd_rd_w=EfClA&pf_rd_p=949e26f5-c2ef-4c96-bfde-49d7614d0317&pf_rd_r=A73PYSP81BPBM0B6HN4Z&pd_rd_r=fb2d6e4e-7295-4c99-a7ca-235883a96d87&pd_rd_wg=mk0wP&pd_rd_i=B07ZRZZCRF&th=1",
  shopname: "下村企販",
  tag_list: ["コーヒー" ,"下村企販" ,"アウトドア","コーヒードリッパー","ステンレス"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-16.jpg"),
  itemcaption: "美味しいコーヒーの為に
  美味しいコーヒーを淹れるためには、コーヒー豆、粉の計量が大切

  日本製の銅メジャーカップで海外でも人気",
  itemname: "カリタ コーヒーメジャー 銅 10g",
  itemprice: 500,
  itemurl: "https://www.amazon.co.jp/%E3%82%AB%E3%83%AA%E3%82%BF-%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%A1%E3%82%B8%E3%83%A3%E3%83%BC-%E9%8A%85-10g-44001/dp/B000HA9M6Q/ref=pd_vtp_54/355-5607422-3177714?pd_rd_w=8ZzLu&pf_rd_p=949e26f5-c2ef-4c96-bfde-49d7614d0317&pf_rd_r=TGG1B1K6RAX8JKQCFK8S&pd_rd_r=8affae14-78a8-4c7f-95a9-b26d381dd526&pd_rd_wg=Vo79W&pd_rd_i=B000HA9M6Q&th=1",
  shopname: "カリタ",
  tag_list: ["コーヒー" ,"カリタ" ,"銅製","コーヒーメジャー"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-17.jpg"),
  itemcaption: "フレンチプレスは、最もコーヒー豆の成分を抽出するのに適した92℃~96℃のお湯の温度を目安に、ゆっくりと豆の膨らみを確かめるようにお湯を注ぐことで、コーヒー豆の旨みや香り、おいしさに必要な豆の油分(コーヒーオイル)を余すことなく抽出します。
  コーヒー豆本来の味が最大限に引き出された豊かな味わいのコーヒーをお楽しみください。",
  itemname: "BODUM ボダム CHAMBORD シャンボール フレンチプレス 350ml シルバー ",
  itemprice: 4025,
  itemurl: "https://www.amazon.co.jp/%E3%80%90%E6%AD%A3%E8%A6%8F%E5%93%81%E3%80%91-%E3%83%9C%E3%83%80%E3%83%A0-CHAMBORD-%E3%83%95%E3%83%AC%E3%83%B3%E3%83%81%E3%83%97%E3%83%AC%E3%82%B9%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%A1%E3%83%BC%E3%82%AB%E3%83%BC-1923-16J/dp/B0051OOM68/ref=sr_1_41?keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC&pd_rd_r=955e7adf-a13f-4b22-aafe-4e7cf5be397c&pd_rd_w=BmVEm&pd_rd_wg=bygyc&pf_rd_p=4c715b9a-8add-4447-8dd3-50bc5addefdb&pf_rd_r=6QK8D2RN7CSVDDYQ4VHE&qid=1638597608&sr=8-41&th=1",
  shopname: "ボダム",
  tag_list: ["コーヒー" ,"ボダム" ,"フレンチプレス","コーヒーメーカー"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-18.jpg"),
  itemcaption: "リブをさらに短くして誰でもしっかりコーヒーの風味を抽出できるようにしたMDKシリーズ。
  環境ホルモンの出ない（ビスフェノールフリー）素材を採用し、安全性が高く、クラックの入りにく耐久性のあるフィルターとなりました。",
  itemname: "KONO式 コーノ 珈琲サイフォン 名門フィルター クリア 透明 2人用 (MDK型)",
  itemprice: 1798,
  itemurl: "https://www.amazon.co.jp/KONO%E5%BC%8F-%E7%8F%88%E7%90%B2%E3%82%B5%E3%82%A4%E3%83%95%E3%82%A9%E3%83%B3-%E5%90%8D%E9%96%80%E3%83%95%E3%82%A3%E3%83%AB%E3%82%BF%E3%83%BC-MDK%E5%9E%8B-MDK-21/dp/B08GZ3XN7B/ref=sr_1_8?keywords=KONO&qid=1638598649&s=home&search-type=ss&sr=1-8",
  shopname: "KONO",
  tag_list: ["コーヒー" ,"KONO" ,"名門ドリッパー","コーヒードリッパー","2人用"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-19.jpg"),
  itemcaption: "当工房でお薦めするのは円錐形のフィルターです。 底が平らなフィルターより抽出をスムーズにコントロールできます。",
  itemname: "コーノ式ペーパー 1～2人用 100枚入り",
  itemprice: 898,
  itemurl: "https://www.amazon.co.jp/%EF%BC%AB%EF%BC%AF%EF%BC%AE%EF%BC%AF-%E3%82%B3%E3%83%BC%E3%83%8E%E5%BC%8F%E3%83%9A%E3%83%BC%E3%83%91%E3%83%BC-1%EF%BD%9E2%E4%BA%BA%E7%94%A8-100%E6%9E%9A%E5%85%A5%E3%82%8A/dp/B006QQWA7S/ref=pb_allspark_dp_sims_pao_desktop_session_based_2/355-5607422-3177714?pd_rd_w=cAOdr&pf_rd_p=2562f525-4075-4561-9863-48d7a49161bd&pf_rd_r=NDY5DS9AN96PYT6PR6Q2&pd_rd_r=08525c10-f4df-4015-bd33-2b9aba965155&pd_rd_wg=PX5ox&pd_rd_i=B006QQWA7S&psc=1",
  shopname: "KONO",
  tag_list: ["コーヒー" ,"KONO" ,"名門ドリッパー","ペーパー","1~2人用"]
)
Product.create!(
  imageurl:File.open("./public/seed/product-20.jpg"),
  itemcaption: "より気軽に、ストレスなくコーヒーを楽しんで欲しい」という思いのもと作られました。
  抽出する速度や挽きの粗さで、フレンチプレスやネルドリップやペーパードリップのようなテイストが ドリップできます。",
  itemname: "MT.FUJI DRIPPER/富士山ドリッパー",
  itemprice: 3630,
  itemurl: "https://www.amazon.co.jp/%E3%82%A4%E3%83%AB%E3%82%AB%E3%83%8A-Ilcana-ILB-001-MT-FUJI-%E5%AF%8C%E5%A3%AB%E5%B1%B1%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC/dp/B072X1VGWK/ref=sr_1_140?keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E3%83%89%E3%83%AA%E3%83%83%E3%83%91%E3%83%BC&pd_rd_r=955e7adf-a13f-4b22-aafe-4e7cf5be397c&pd_rd_w=BmVEm&pd_rd_wg=bygyc&pf_rd_p=4c715b9a-8add-4447-8dd3-50bc5addefdb&pf_rd_r=6QK8D2RN7CSVDDYQ4VHE&qid=1638598452&sr=8-140&th=1",
  shopname: "イルカナ",
  tag_list: ["コーヒー" ,"イルカナ","コーヒードリッパー","富士山ドリッパー"]
)
Bean.create!(
  area:"スルミナス",
  country:"ブラジル",
  description: "主に南米のアラビカ種を配合したオーガニックブレンドはディープなコクのある苦味と、 ほのかな甘みと包み込む様な、 優しい酸味が特徴的です",
  image: File.open("./public/seed/bean-01.jpg"),
  name: "TOKYO COFFEE",
  purification: "ナチェラル",
  roast: "ミディアム",
  url:"https://www.amazon.co.jp/TOKYO-COFFEE-%E6%9D%B1%E4%BA%AC%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC-%E3%82%AA%E3%83%BC%E3%82%AC%E3%83%8B%E3%83%83%E3%82%AF%E3%83%96%E3%83%AC%E3%83%B3%E3%83%89-%E8%87%AA%E5%AE%B6%E7%84%99%E7%85%8E%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC/dp/B01AABXQ36/ref=sr_1_2_sspa?__mk_ja_JP=%E3%82%AB%E3%82%BF%E3%82%AB%E3%83%8A&dchild=1&keywords=%E3%82%B3%E3%83%BC%E3%83%92%E3%83%BC%E8%B1%86&qid=1615536696&sr=8-2-spons&psc=1&spLa=ZW5jcnlwdGVkUXVhbGlmaWVyPUEyNjdHRTVFTVc0NUJEJmVuY3J5cHRlZElkPUExMDQ2NjU1MlkzVDBKVk8yODJUTiZlbmNyeXB0ZWRBZElkPUFVVlpST0o5Wk5HNTImd2lkZ2V0TmFtZT1zcF9hdGYmYWN0aW9uPWNsaWNrUmVkaXJlY3QmZG9Ob3RMb2dDbGljaz10cnVl",
  user: User.find(1),
  tag_list: ['コーヒー豆','ブラジル','ブレンド']
)
Bean.create!(
  area:"キアンバ",
  country:"ケニア",
  description: "偶然買ったコーヒー豆ですが、おいしかったのでシェアさせていただきます。
  どこで買ったのかを忘れてしまったのですがまたどこかで出会いたいです
  比較的焙煎が効いた味ですごく美味しいです",
  image: File.open("./public/seed/bean-02.jpg"),
  name: Faker::Coffee.unique.blend_name,
  purification: "ナチェラル",
  roast: "焙煎度不明",
  user:User.find(1),
  tag_list: ['コーヒー豆',' ケニア','ナチェラル']
)
Bean.create!(
  area:"セラード",
  country:"ブラジル",
  description: "Little Napで販売されているオリジナルブレンドです
  深煎りの豆です",
  image: File.open("./public/seed/bean-03.jpg"),
  name: "Little Nap original blend",
  purification: "ナチェラル",
  roast: "フルシティ",
  user: User.find(9),
  tag_list: ['コーヒー豆','ブラジル','ブレンド','フルシティ']
)
Bean.create!(
  country:"ブラジル　エチオピア",
  description: "たいへんおいしいコーヒーブレンドです",
  image: File.open("./public/seed/bean-04.jpg"),
  name: "Mocha blend",
  purification: "ウォッシュド",
  roast: "ハイ",
  user:User.find(4),
  tag_list: ['コーヒー豆','ブラジル','ブレンド','エチオピア']
)
Bean.create!(
  area:"アンティグア",
  country:"グァテマラ",
  description: "グァテマラ特有のコクがあり、コーヒーらしい味になっています",
  image: File.open("./public/seed/bean-05.jpg"),
  name: "ALL ARABICA coffee",
  purification: "ナチェラル",
  roast: "シティ",
  user: User.find(7),
  tag_list: ['コーヒー豆','グァテマラ','シティ','ナチェラル']
)

Review.create!(
  user: User.find(1),
  product: Product.find(1),
  title: "最高のドリッパーです",
  content: "簡単においしいコーヒーを淹れることができるドリッパーです",
  rate: 5
)

Review.create!(
  user: User.find(2),
  product: Product.find(1),
  title: "すぐに壊れてしまいました",
  content: "２回使っただけなのに壊れてしまいました。",
  rate: 1
)

Review.create!(
  user: User.find(10),
  product: Product.find(1),
  title: "初心者用のドリッパーです",
  content: "初心者用のドリッパーです。
  上級者から初心者でも使える万能なドリッパーです",
  rate: 4
)
Review.create!(
  user: User.find(9),
  product: Product.find(2),
  title: "退屈なドリッパー",
  content: "粉をいれて湯をいれたらコーヒーの完成です
  簡単で悪く言えば、退屈なドリッパーです",
  rate: 2
)

Review.create!(
  user: User.find(3),
  product: Product.find(2),
  title: "簡単にコーヒーが淹れれます",
  content: "粉とお湯をいれるだけで、いつでも同じ味のコーヒーを淹れることができます。",
  rate: 4
)

Review.create!(
  user: User.find(11),
  product: Product.find(10),
  title: "美味しく作れお掃除簡単",
  content: "すぐ作れるのと掃除が簡単で美味しい！
  キャンプにも持って行く予定です。",
  rate: 5
)
Review.create!(
  user: User.find(1),
  product: Product.find(5),
  title: "コンパクトでお買い得",
  content: "コーヒーを挽くのも力も要らず、ゴリゴリどころかジョリジョリスリスリ挽けます。
  コンパクトだし持ち歩きにハンドルもバンドに収納できます。
  １人分位なら家でも毎日挽いても苦ではないです。",
  rate: 4
)
Review.create!(
  user: User.find(12),
  product: Product.find(6),
  title: "取りにくい",
  content: "一度に2，3枚出たときに、フィルターが元にキチンと収まらない（形が少し崩れて）。",
  rate: 3
)
Review.create!(
  user: User.find(8),
  product: Product.find(3),
  title: "ドリップが安定する",
  content: "ウェーブドリッパーは、他のレビューにあるように、確かにドリップのブレが無いように感じます。
  常に安定したドリップになります。
  デメリットは、メリットの逆でドリップに変化をつけづらいことと、ペーパーコストが少し高いことでしょうか。",
  rate: 5
)
Review.create!(
  user: User.find(4),
  product: Product.find(9),
  title: "取り扱い要注意です",
  content: "残念ながら数回使ってサーバーが割れてしまいました。
  耐熱ガラスにしては薄手の為、使い始めの時に割れそうだなーと少し不安に思っていましたが、
  現実となりました。 取り扱い要注意です！",
  rate: 1
)

Review.create!(
  user: User.find(1),
  product: Product.find(7),
  title: "快適な使用感",
  content: "豆を挽いてる間にこちらに湯を移し、温度を下げて、毎日コーヒーを淹れています。
  細口で自分の加減で入れれるので、悩んで購入した甲斐がありました！",
  rate: 5
)
Review.create!(
  user: User.find(12),
  product: Product.find(8),
  title: "これこそもとめていたスケール",
  content: "物凄く使いやすい。今まで安いスケールを20個近く試してきましたが、精度や拭きやすさ、強度で満足いくものはありませんでした。
  こちらの商品は見た目、拭きやすさ、精度に満足している上に、充電式で乾電池不要なのも◎。
  一台購入後、追加で2台購入しました。",
  rate: 5
)
Review.create!(
  user: User.find(4),
  product: Product.find(4),
  title: "LED表示が思ったほど明るくない",
  content: "液晶がLEDで視認性がよく見やすいと思い少し割高ですが購入しました。
  ですが視認性はあまりよくないです。少し本体との取付に個体差によるズレがあるみたいで気になる方には気になると思います。",
  rate: 2
)
BeanReview.create!(
  user: User.find(1),
  bean: Bean.find(1),
  acidity: 4,
  bitter: 3,
  flavor: 4,
  rich: 4,
  sweet: 3,
  title: "ミディアムで",
  content:"豆の硬さは柔らか目。飲んだ瞬間直ぐに苦みに似た渋みが来ます！。
  その後それが段々と抜けて行き　ラストに上品な酸味が来ます！
  特徴のあるコーヒーは癖になりますよね！"
)
BeanReview.create!(
  user: User.find(2),
  bean: Bean.find(1),
  acidity: 5,
  bitter: 5,
  flavor: 5,
  rich: 5,
  sweet: 5,
  title: "味も香りも気に入っています",
  content:"味も香りも気に入っています。"
)
BeanReview.create!(
  user: User.find(12),
  bean: Bean.find(1),
  acidity: 3,
  bitter: 3,
  flavor: 3,
  rich: 4,
  sweet: 4,
  title: "コーヒーを始めたばかりの初心者ですが、 癖も少なく大変おいしかったです。 宅配で受け取る時からいい香",
  content:"コーヒーを始めたばかりの初心者ですが、
  癖も少なく大変おいしかったです。
  宅配で受け取る時からいい香りが漂ってたまりません。"
)
BeanReview.create!(
  user: User.find(10),
  bean: Bean.find(1),
  acidity:4 ,
  bitter: 3,
  flavor: 3,
  rich: 5,
  sweet: 5,
  title: "色々飲んでみてはじめてわかりました。ブラジルのコーヒーはとてもバランスの取れた飲みやすいものなんです ",
  content:"バランスの良い風味でした。ストレート以外にも、オリジナルブレンドのベースとして重宝してます。"
)


BeanReview.create!(
  user: User.find(4),
  bean: Bean.find(2),
  acidity: 3,
  bitter: 2,
  flavor: 4,
  rich: 5,
  sweet: 3,
  title: "コクも酸味も香りもバランス良く 一日に何杯も飲んでしまいそうです",
  content:"コクも酸味も香りもバランス良く
  一日に何杯も飲んでしまいそうです"
)

BeanReview.create!(
  user: User.find(9),
  bean: Bean.find(2),
  acidity: 3,
  bitter: 1,
  flavor: 3,
  rich: 3,
  sweet: 3,
  title: "バランスが良いです。",
  content:"酸味と、コクのバランスが良くて、！リピートしてます"
)

BeanReview.create!(
  user: User.find(2),
  bean: Bean.find(3),
  acidity: 2,
  bitter: 4,
  flavor: 4,
  rich: 3,
  sweet: 2,
  title: "凄く飲みやすい",
  content:"酸味が苦手なのでマンデリン等飲む事が多いのですが、これはスッキリと軽く飲みやすいです。
  酸味も主張しません。
  次回も注文しようと思います"
)

BeanReview.create!(
  user: User.find(10),
  bean: Bean.find(5),
  acidity: 4,
  bitter: 5,
  flavor: 3,
  rich: 3,
  sweet: 2,
  title: "とにかくこのガテマラを続けて飲んでいます",
  content:"とにかくこのガテマラを続けて飲んでいます。
  私の大好きな彼女のお気に入りでもあるので、
  販売中止になんかしないでくださいね。

  これからもよろしくお願いします。"
)


BeanReview.create!(
  user: User.find(1),
  bean: Bean.find(5),
  acidity: 4,
  bitter: 3,
  flavor: 3,
  rich: 2,
  sweet: 4,
  title: "やっぱりガテマラ　最高！！",
  content:"やっぱりガテマラ　最高！！"
)

BeanReview.create!(
  user: User.find(11),
  bean: Bean.find(4),
  acidity: 3,
  bitter: 3,
  flavor: 3,
  rich: 3,
  sweet: 3,
  title: "酸味・苦味のバランスが良くクセが無い。",
  content:"クリアな飲み口で豆本来の味も感じる。
  「普通のコーヒーが飲みたい」人にはオススメ。
  温度が下がっても酸味の主張はそこまで出てこない。
  因みに私は個性強い味の方が好きなので物足りないです。"
)

BeanReview.create!(
  user: User.find(4),
  bean: Bean.find(4),
  acidity: 3,
  bitter: 3,
  flavor: 3,
  rich: 3,
  sweet: 3,
  title: "くせがなく飲みやすい。この値段で、この味、コ・ス・パがいいね。",
  content:"くせがなく飲みやすい。この値段で、この味、コ・ス・パがいいね。"
)
9.times do |n|
  u = User.find(n + 1)
  Report.create!(
    user: u,
    review: Review.find(1)
  )
  Report.create!(
    user: u,
    review: Review.find(2)
  )
end

10.times do |n|
  Relationship.create!(
    user: User.find(n+1),
    follow: User.find(n +2)
  )
  Relationship.create!(
    user: User.find(n +2),
    follow: User.find(n + 1)
  )
  if n != 0 && n % 2 == 0
    Relationship.create!(
      user: User.find(n+1),
      follow: User.find(1)
    )
  end
  ProductLike.create!(
    user: User.find(n +1),
    liked_id: n +1
  )
  ProductLike.create!(
    user: User.find(n +2),
    liked_id: n +1
  )
  if n < 4
    BeanLike.create!(
      user: User.find(n +1),
      liked_id: n + 1
    )
    BeanLike.create!(
      user: User.find(n+2),
      liked_id: n+1
    )
    ProductReviewLike.create!(
      user: User.find(n +3),
      liked_id: 1
    )
    BeanReviewLike.create!(
      user: User.find(n+3),
      liked_id: 1
    )
  end
  ProductReviewLike.create!(
    user: User.find(n +1),
    liked_id: n +1
  )
  BeanReviewLike.create!(
    user: User.find(n + 1),
    liked_id: n + 1
  )
end
