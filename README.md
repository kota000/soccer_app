## 概要

　『 SOCCER FUN 』

 　サッカー専用の掲示板アプリです。掲示板・コメントを作成し情報共有ができるサービスです。

 　初めてアプリを利用する人でも見てすぐに使っていただけるようにできるだけシンプルに作成しました。

## リンク
　http://www.soccerfun.site

## 制作の背景
　掲示板アプリは多くありますがサッカー専用の掲示板はあまりなくまた、UIUXが優れたアプリが少なかったため今回作成してみました。
 

## 使用技術


### バックエンド

* Ruby　2.6.6
* Ruby on Rails　5.2.4


### フロントエンド

* HTML
* scss
* Bootstrap
* JavaScript
* jQuery


### テスト

* rspec


### インフラ・開発環境等

【開発環境】

* Docker
* Docker-Compose


【本番環境】

* AWS(EC2, RDS for MySQL, Route53, ALB, ACM)
* Nginx
* Puma
* Mysql5.7

【その他】

* GitHub
* CircleCI
* rubocop_airbnb
* Ajax
* Google認証

【アピールポイント】

* rspecでの統合テストを多く作成
* 本番環境でAWSを使用
* 実際に利用していただけるようUIUX、レスポンシブ対応にこだわりました。また、userログインをしていなくても投稿を閲覧できるようにしました。
* 現場での開発を想定し、GitHubを使用してこまめなcommitやPull request機能を使いました。
* userログインをしていなくても投稿を閲覧できるようにしました。
* rubocopを利用しリファクタリングを何度も行いコードの可読性を意識して作成しました。


