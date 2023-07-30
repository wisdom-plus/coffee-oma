Review.create!(
  user: User.find(1),
  product: Product.find(1),
  title: '最高のドリッパーです',
  content: '簡単においしいコーヒーを淹れることができ���ドリッパーです',
  rate: 5
)

Review.create!(
  user: User.find(2),
  product: Product.find(1),
  title: 'すぐに壊れてしまいました',
  content: '２回使っただけなのに壊れてしまいました。',
  rate: 1
)

Review.create!(
  user: User.find(10),
  product: Product.find(1),
  title: '初心者用のドリッパーです',
  content: "初心者用のドリッパーです。
  上級者から初心者でも使える万能なドリッパーです",
  rate: 4
)
Review.create!(
  user: User.find(9),
  product: Product.find(2),
  title: '退屈なドリッパー',
  content: "粉をいれて湯をいれたらコーヒーの完成です
  簡単で悪く言えば、退屈なドリッパーです",
  rate: 2
)

Review.create!(
  user: User.find(3),
  product: Product.find(2),
  title: '簡単にコーヒーが���れれます',
  content: '粉とお湯をいれるだけで、いつでも同じ味のコーヒーを淹れることができます。',
  rate: 4
)

Review.create!(
  user: User.find(11),
  product: Product.find(10),
  title: '美味しく作れお掃除簡単',
  content: "すぐ作れるのと掃除が簡単で美味しい！
  キャンプにも持って行く予定です。",
  rate: 5
)
Review.create!(
  user: User.find(1),
  product: Product.find(5),
  title: 'コンパクトで��買い得',
  content: "コーヒーを挽くのも���も要らず、ゴリゴリどころかジョリジョリスリ��リ��けます。
  コンパクトだし持ち歩きにハンドルもバンドに収納できます。
  １人分位なら家でも毎日挽いても苦ではないです。",
  rate: 4
)
Review.create!(
  user: User.find(12),
  product: Product.find(6),
  title: '取りにく���',
  content: '一度に2，3枚出たときに、フィルターが元にキチンと収まらない（形が少し崩れて）。',
  rate: 3
)
Review.create!(
  user: User.find(8),
  product: Product.find(3),
  title: 'ドリップが安定する',
  content: "ウェーブドリッパーは、����のレ���ューにある���うに、確��にドリップのブレが無����ように感じます。
  常に安定したドリップになります。
  デメリットは、メリットの逆でドリップに変化をつけづらいことと、ペーパーコストが少し高いことでしょうか。",
  rate: 5
)
Review.create!(
  user: User.find(4),
  product: Product.find(9),
  title: '取り扱い要注意です',
  content: "残念ながら数回使ってサーバーが割れてしまいました。
  耐熱ガラスにしては薄手の為、使い始めの時に割れそうだなーと少し不安に思っていましたが、
  現実となりました。 取り扱い要注意です！",
  rate: 1
)

Review.create!(
  user: User.find(1),
  product: Product.find(7),
  title: '快適な使用感',
  content: "豆を挽いてる間にこちらに湯を移し、温度を下げて、毎日コーヒーを淹れています。
  細口で自分の加減で入れれるので、悩んで購入した甲斐がありました！",
  rate: 5
)
Review.create!(
  user: User.find(12),
  product: Product.find(8),
  title: 'これこそもとめていたスケール',
  content: "物凄く使いやすい。今まで安いスケールを20個近く試してきましたが、精度や拭きやすさ、強度で満足いくものはありませんでした。
  こちらの商品は見た目、拭きやすさ、精度に満足している上に、充電式で乾電池不要なのも◎。
  一台購入後、追加で2台購入しました。",
  rate: 5
)
Review.create!(
  user: User.find(4),
  product: Product.find(4),
  title: 'LED表示が思ったほど明るくない',
  content: "液晶がLEDで視認性がよく見やすいと思い少し割高ですが購入しました。
  ですが視認性はあまりよくないです。少し本体との取付に個体差によるズレがあるみたいで気になる方には気になると思います。",
  rate: 2
)
Review.create!(
  user: User.find(7),
  product: Product.find(11),
  title: '手間を惜しんでも使いたい...',
  content: "まず、ネルドリップを始めたらフィルター使えなくなります...
  砂糖と塩の味の違いが分かれば分かるくらい劇的に味、香りが変わります。

  使い勝手で言うと、ネルは毎回持ち手から外して洗い、水に浸けて保存する(ネルに着いた成分が空気に触れて酸化するのを防ぐため)のですが、外すのに少し難儀し、持ち手の金属部分が少し変形してしまいます。

  まあ、美味しいコーヒーが淹れられるので使い辛さなんて屁の河童ですけどね！
  これを読む人がいるとしたらネルドリップに興味があるのでしょう...",
  rate: 4
)
Review.create!(
  user: User.find(8),
  product: Product.find(11),
  title: 'ネック部分のガタつきがＮＧ',
  content: "オリーブネック部分が固定されずガタつき不安定で危ないと感じました。
  丸っこい玉に紐を通すだけですので当然かと。
  オリーブのウッド自体もフィットしないので不安定要素の一つです。",
  rate: 1
)
Review.create!(
  user: User.find(9),
  product: Product.find(12),
  title: '豆の消費量は凄いが',
  content: "これで作った水出しコーヒーは外したことがありません
  今までにシティーローストで８種類くらいの豆を使って作りましたが、
  みんなちゃんと味が出ていて美味い！！

  ただ、豆をふんだんに使うのでハマると豆がみるみるなくなっていきます笑",
  rate: 5
)
Review.create!(
  user: User.find(10),
  product: Product.find(12),
  title: '極細メッシュ！',
  content: "水だしコーヒーポットですが、水出しアイスティーや水出し煎茶にも
  使用したくて探して、探してこれに辿り着きました。
  極細メッシュでかなり細かい茶葉も絶対に逃さない！という
  意気込みを感じる作りになっています",
  rate: 4
)

Review.create!(
  user: User.find(1),
  product: Product.find(13),
  title: '最高！もう外でカフェラテは飲めない！',
  content: "もっと早く買っておけば良かったた！！！
  高いマシーン買うより経済的です！
  もう外でカフェラテを飲む事はないですね！
  大満足！",
  rate: 5
)

Review.create!(
  user: User.find(2),
  product: Product.find(13),
  title: 'ハンドドリップより準備と片付けが面倒',
  content: "洗浄についてですが私の場合は豆を変えるタイミングで洗剤を使用しています。
  腐敗したコーヒー臭は香り���損ねますし、ある程度使っていれば洗剤で洗っても金属臭さは特に感じません。
  濡れたままだとカビが生えるそうですが、いちいち水気を拭いているとハンドドリップより片付けが面倒です。",
  rate: 2
)

Review.create!(
  user: User.find(3),
  product: Product.find(13),
  title: '簡単、美味しい。',
  content: 'カプチーノ、ラテマッキアート、ミルクたっぷりにして1日に何杯も淹れます。夫婦2人で3カップ用。3分で淹れられるので、来客時はす���に淹れなおせば良し。4カップ、6カップ用と迷いましたが、3カップ用で充分でした。',
  rate: 5
)

Review.create!(
  user: User.find(4),
  product: Product.find(14),
  title: '緑茶の水出しと��陶器のドリッパー用に便利です',
  content: "樹脂製だから安っぽいのかなと思っていましたが、
  青緑がかったアンティークガラスのような色合いがほんのり感じられて、
  パッと見は安っぽい感じはありません。",
  rate: 5
)

Review.create!(
  user: User.find(5),
  product: Product.find(14),
  title: 'なかなか気に入りました',
  content: "軽い！
  ずっとIwakiの水出しコーヒー用の奴を使ってたんですが今年もそろそろと思ったら上手く出来ない。水滴は落ちなくなる事が増えた。一度全ての粉に水分補給させてから毎回失敗なしでしたがそれも駄目。
  縦に長いのも地味に邪魔でこちらを購入。
  軽いし乱雑に扱ってもいいし最高。味はああいう水出しと比べてどうなのかわかりませんがきちんと濃く出るので問題ないです。蓋がちょい固いのと注ぎ口が完全に開いてるのでラップ必須なのがだるい。",
  rate: 4
)
Review.create!(
  user: User.find(6),
  product: Product.find(14),
  title: '割り切って使えばOK',
  content: "短い期間にガラス製のコーヒーサーバーを2度割ってしまったので、この際割れないのを買っちゃえとこちらを購入しました。
  樹脂製なので、ガラスのような高級感は当然ありません。でも割れる恐怖から解放され、洗いも気軽に洗えるようになりました。こっちの方が私の性分に合っているようです。
  このように割り切って使えばまったく問題ない商品だと思います。",
  rate: 4
)
Review.create!(
  user: User.find(7),
  product: Product.find(15),
  title: '見た目',
  content: '見た目は　おしゃれだが　���い勝手良くない　落ちるのが早いので　コクも香りも深くない　��分は三つ穴が　いいかな　�����嗜���なので　好き好きです　その日の気分で　使い分けてます',
  rate: 2
)
Review.create!(
  user: User.find(8),
  product: Product.find(15),
  title: 'よく考えられたもの',
  content: '普段使いのドリッパーが割れた��め、探して見たところとて��気になったので購入。単純な構造だけど美しい、でも味はどうかな…なんて考えてましたがまったく問題は���りませんでした。骨組みだけなので洗った感はでませんがよく考えられたものだと感心してます',
  rate: 5
)
Review.create!(
  user: User.find(9),
  product: Product.find(16),
  title: 'カッコイイ',
  content: "そりゃまぁ機能だけならプラ製のものでも良いわけですが、コイツがいると気分が上がりますね。
  コーヒーを飲む、だけでなく、淹れる作業も楽しくしてくれます。
  使っているうちに傷んだようになりますがそれもまた味わいですね。",
  rate: 5
)
Review.create!(
  user: User.find(10),
  product: Product.find(16),
  title: 'かっこいいから購入',
  content: "コーヒーにはまりだし、普通の大きなスプーンで豆をはかりに乗せていたら、コーヒー通には見えないと家族に言われ
  そこで探したらいい物発見したので購入しました。
  一杯やく一人前の10ｇ位だと言う事で、はかりを使う手間も省けて、コーヒー通に一歩近づけたかなと思う",
  rate: 5
)
Review.create!(
  user: User.find(11),
  product: Product.find(17),
  title: ' ドリップより好き',
  content: "最近ドリップだと美味しく感じないことが多かったので、プレスコーヒ―試してみたくて購入。
  お湯入れて４分放置でOKなので、雑な私でも安定した味が出せました。
  個人的にはドリップより好きです。
  お湯は2回に分けて注ぐという説明を多く見ますが、私は１回派です。
  好みの問題だと思うので、好きな回数探すのが良いと思います。",
  rate: 4
)
Review.create!(
  user: User.find(12),
  product: Product.find(17),
  title: 'ガラス部分の耐久性に問題',
  content: "10回ほど使用したでしょうか。
  本体ガラスビーカーの下部にヒビが入ってしまっていました。
  金属のフレームの下あたりを中心に十字のヒビなのですが、フレームから外してもいないし、落としたりぶつけた記憶もありません。
  ビーカー部分だけ交換するか、廃棄するか考えますが、耐久性には問題あると思います。",
  rate: 1
)

Review.create!(
  user: User.find(1),
  product: Product.find(18),
  title: '5つ星のうち5.0 珈琲の旨味が増し増し',
  content: "動画サイトでレビューを見かけ購入してみました。
  淹れ方やテクニックもあるのでしょうが、明らかに、普段使用しているコーヒーメーカーで淹れたモノより一味も二味も美味しいと感じました。
  比べるのが失礼かな…とにかく美味しく点てられます。",
  rate: 5
)
Review.create!(
  user: User.find(2),
  product: Product.find(18),
  title: '味の変化にビックリ！！',
  content: "ドリッパーでこんなに味が変わることに驚きでした。
  しっかりとしたボディー感のなかに、後味スッキリで、バランスの良い抽出ができます。
  同じ豆で、カリタ・メリタと試してみましたが、ＫＯＮＯ式ドリッパーの味にはまりました！
  ユーチューバーが勧めるだけのことはありますね。",
  rate: 5
)
Review.create!(
  user: User.find(3),
  product: Product.find(19),
  title: '使えなくはないけど',
  content: "このコーノのフィルター無しにはいい味が出せないと思ってるので買ってるのですが…
  梱包時に太い輪ゴムでギュッとやるのやめて。ペーパーの形が崩れるから。笑
  使えなくはないけどね〜",
  rate: 4
)
Review.create!(
  user: User.find(4),
  product: Product.find(19),
  title: '美味しく珈琲がたてられます。',
  content: '美味しい珈琲が飲めますが、コーノ式は技術が必要なので最初はうまく行かないかもしれません。豆は中びきで使うと良いですよ。',
  rate: 4
)
Review.create!(
  user: User.find(5),
  product: Product.find(20),
  title: '汚れがほとんど付かない',
  content: "フィルターとの接触がほとんどないので、汚れがつきません。
  水滴もつかないので、扱いが簡単になります。

  おすすめです。",
  rate: 5
)

Review.create!(
  user: User.find(6),
  product: Product.find(20),
  title: 'おいしいコーヒーが飲める',
  content: "陶器のドリッパーと違い、空気の逃げ道があるからか、蒸らす際にボコっと
  空気が上がってこないことに最初は戸惑いました。
  しかし、キント―のステンレスフィルターと違い、粉を捨てるのが圧倒的に楽になりました。
  味はステンレスフィルターの方が好みですが、掃除のことを考えるとケメックスの見た目を壊さず
  よい品に出会えたと思っています。",
  rate: 4
)

puts 'Review created!'
