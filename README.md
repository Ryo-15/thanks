# Thanks!

### サイトリンク
[Thanks!](https://thanks-app.work/)

## サイト概要
社員同士の感謝を伝え合う社内SNS

### サイトテーマ
貢献と感謝。<br>
働くことで貢献しよう。感謝の気持ちを表現しよう。<br>
働くということについて考えた結果、そこには貢献と感謝という大切な要素があると考えました。<br>
仕事には必要としている人のため、貢献するためという側面があります。<br>
そして必要としている人は貢献や働きに対して感謝の気持ちを抱いていると思います。<br>
貢献と感謝を可視化できる形にすることで、働く人・企業双方にとって有用なアプリケーションを目指しました。<br>

### テーマを選んだ理由
前職で「サンキューカード」という社員同士の感謝を伝え合う制度がありました。<br>
手書きで感謝を伝えるその制度は自分自身とても良いものであると感じていました。<br>
しかし手書きであるが故、管理や集計の煩雑さ、実際に相手の元へ届くまでのタイムラグがある、<br>
また感謝されるほどの貢献をした社員の評価に活かせていないなどの課題を抱えていました。<br>
今回アプリケーションを開発することでそれらの課題を解決し、<br>
働く人がよりお互いを思いやり、支え合って働けるサービスを提供したいと考え、このテーマを選びました。<br>

### ターゲットユーザー
ユーザー：導入先企業で働く社員<br>
企業：エンゲージメント経営を目指す企業

### 主な利用シーン
ユーザー：感謝を表現したいとき<br>
企業：貢献している社員を正当に評価したいとき

## 環境/使用技術一覧
- 使用言語/フレームワーク
  - フロントエンド
    - Bootstrap 4
    - JavaScript
    - jQuery
    - Ajax
  - バックエンド
    - ruby 2.6.3
    - Rails 5.2.4.2

- 開発環境
  - Vagrant 2.2.6
  - VirtualBox

- 本番環境/デプロイ
  - DB server
    - RDS(MySQL)
  - Web server
    - Nginx
  - AP server
    - Puma
  - Route53
  - Certificate Manager
  - capistrano

## 設計書
- [Adminワイヤーフレーム](https://app.diagrams.net/#G1DngPQFpcCuxU0NKNSVKbqf2ePR2u7JUf)
- [Userワイヤーフレーム](https://app.diagrams.net/#G1l9102QeSPrv3IIQ05bdY7Kd7d7ZPfYgL)
- [UI_Flows_Admin](https://app.diagrams.net/#G1H1tlf6qJ0abrRmux3LF5yeQ_bc0u8AgT)
- [UI_Flows_User](https://app.diagrams.net/#G1QCwq7zIU2CqByudgxAFem2cCAnIZu9Wo)
- [ER図](https://app.diagrams.net/#G1G6fu3wetSF8ObgSZb6vQUfn9jT4QXe3Z)

## 機能一覧
- [googleスプレッドシート](https://docs.google.com/spreadsheets/d/11ske6SFWajgfFdTrv7dg0c_PyO68K0bY4ohnrQZiVaQ/edit?usp=sharing)

- 管理者機能
  - 投稿一覧テーブル
  - CSV出力・入力（投稿・ユーザー・部署）
  - チャート機能
  - ユーザー管理
  - ユーザー新規登録
  - 部署管理
  - 部署新規登録
  - ユーザー検索（氏名・カナ氏名）
  - 月間ランキング（送った数・受け取った数・いいね数）

- ユーザー機能
  - タイムライン
  - 投稿（ユーザー検索＋投稿）
  - いいね（Ajax非同期通信）
  - コメント（Ajax非同期通信）
  - 月間ランキング（送った数・受け取った数・いいね数）
  - 新着通知（投稿・いいね・コメント）

- その他
  - ユーザー認証機能
  - CRUD処理
  - レイアウト（bootstrap 4.5, kaminari）
  - コード解析（rubocop_airbnb）
  - デバッグ（pry-rails）
  - テストコード（Rspec）
  - AI自然言語処理（Natural language API）


