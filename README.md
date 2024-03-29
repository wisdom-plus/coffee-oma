![github issue](https://img.shields.io/github/issues/wisdom-plus/coffee-oma?style=plastic)
[![codecov](https://codecov.io/gh/wisdom-plus/coffee-oma/branch/master/graph/badge.svg?token=PYLRMXDK0D)](https://codecov.io/gh/wisdon-plus/coffee-oma)

# Coffee-oma

Coffee-oma はコーヒーに関する器具や、豆などの評価や感想を投稿しシェアする web アプリケーションです。
コーヒー用品やコーヒー豆の評価や使い方などを集めたサイトがあるといいなと思い開発しました。

## [Coffee-oma](https://coffee-oma.com)

(現在は停止中)
![coffee-oma-logo](https://user-images.githubusercontent.com/48266893/112326442-deefcb80-8cf7-11eb-9432-cc83ade690de.png)

# 特に見ていただきたい点

- ### インフラ面

  - 開発環境では docker-compose を利用し、本番環境では AWS(ECS Fargate)を利用している
  - CircleCI を利用し、CI/CD パイプラインを構築している
  - Terraform を使い、インフラをコード化している

- ### バックエンド面

  - action_mailer,active_job,active_cable,action_text など Rails の標準搭載されている機能を利用しているところ
  - DRY,KISS,YAGNI の原則を意識したコード
  - N+1 が起こらないようにデータの取得に気をつけているところ
  - テストのカバレッジを取得し、100%になるようにしている

- ### フロントエンド面

  - シンプルな UI になるようにしているところ
  - アニメーションを追加し、UX を意識している
  - viteを利用した、開発環境の構築

- ### その他

  - チーム開発を意識し、Github flow に従った開発手法を取り入れている点。
  - isseus,Projectsなどを利用し、課題・進行状況を記録している

# 機能一覧

- ユーザ機能(devise)
- 投稿機能
- 画像投稿機能(carrierwave, fog-aws)
- 検索機能(ransack)
- ページネーション機能(kaminari)
- 無限スクロール機能
- 投稿に対するレビュー機能
- レビューに対しての通報機能(Active Job,Sidekiq)
- お気に入り機能(STI)
- 通知機能
- DM 機能(Action_Cable)
- お問い合わせ機能(Action_Mailer)
- フォロー機能
- コーヒーの抽出レシピの投稿機能(豆のレビューに紐付け)
- タグ機能(acts-as-taggable-on)
- 管理者機能(activeadmin)
- 運営からのお知らせ機能(Action text)
- reCAPTCHA
- 履歴機能
- チャート機能(chart.js)
- レート星機能
- セキュリティ脆弱性性的分析ツール(Brakeman)
- テストカバレッジ(simplecov,codecov)
- javascriptバンドル(vite)
- turbo-rails

# 使用している技術一覧

- Ruby 3.1.3
- rails 7.0.4
- AWS(VPC,ECR,ECS,RDS,Elasticache,ALB,VPCEndpoint,ACM,Route53,S3,SES,CloudWatch,CloudWatchEvent)
- mysql 8.0
- Docker 20.10.5, docker-compose 1.28.5
- terraform 1.0.2
- Rspec, Capybara, rubocop, selenium
- jQuery
- Nginx 1.19.4
- puma
- Brakeman
- Codecov
- Vite_Ruby
- turbo-rails
- view_component
- stimulus
- packwerk

# ER 図

![DB](https://user-images.githubusercontent.com/48266893/135635840-a01ace88-b00b-4ba3-be28-d35fe1566f2f.png)

# クラウドアーキテクチャー

![ポートフォリオクラウドアーキテクチャー](https://user-images.githubusercontent.com/48266893/135717678-44db6833-6216-42ab-bccd-aa98c4b22f9e.PNG)
