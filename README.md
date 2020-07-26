# Thanks!

## リンク
- [Thanks!](https://thanks-app.work/)

## サイト概要
社員同士の感謝を伝え合う社内SNS

### サイトテーマ
貢献と感謝。<br>
働くことで貢献しよう。感謝の気持ちを表現しよう。<br>
働くということについて考えた結果、そこには貢献と感謝という大切な要素があると考えました。<br>
仕事は本来必要としている人の役に立つため、貢献するためにあるものです。<br>
そしてそれを必要としている人は必ず感謝の気持ちを抱いているはず。<br>
貢献と感謝を可視化できる形にすることで、働く人・企業双方にとって有用なアプリケーションを目指しました。<br>

### テーマを選んだ理由
前職で「サンキューカード」という社員同士の感謝を伝え合う制度がありました。<br>
手書きで感謝を伝えるその制度は自分自身とても良いものであると感じていました。<br>
しかし、手書きであるが故、管理や集計の煩雑さ、実際に相手の元へ届くまでのタイムラグがある、<br>
また感謝されるほどの貢献をした社員の評価に活かせていないなどの課題を抱えていました。<br>
今回アプリケーションを開発することでそれらの課題を解決し、<br>
働く人がよりお互いを思いやり、支え合って働けるサービスを提供したいと考えたからです。<br>

### ターゲットユーザー
ユーザー：導入先企業で働く社員<br>
企業：エンゲージメント経営を目指す企業

### 主な利用シーン
ユーザー：感謝を表現したいとき<br>
企業：貢献している社員を正当に評価したいとき

## 環境一覧
- 使用言語/フレームワーク<br>
  - ruby 2.5.7<br>
  - Rails 5.2.4.2<br>

- 開発環境<br>
  - Vagrant 2.2.6<br>
  - VirtualBox<br>

- 本番環境/デプロイ<br>
  - DB server<br>
    - RDS(MySQL)<br>
  - Web server<br>
    - Nginx<br>
  - AP server<br>
    - Puma<br>
  - Route53<br>
  - Certificate Manager<br>

- デプロイ<br>
  - capistrano<br>

- その他<br>
  - https<br>

## 設計書
- [Adminワイヤーフレーム](https://app.diagrams.net/#G1DngPQFpcCuxU0NKNSVKbqf2ePR2u7JUf)<br>
- [Userワイヤーフレーム](https://app.diagrams.net/#G1l9102QeSPrv3IIQ05bdY7Kd7d7ZPfYgL)<br>
- [UI_Flows_Admin](https://app.diagrams.net/#G1H1tlf6qJ0abrRmux3LF5yeQ_bc0u8AgT)<br>
- [UI_Flows_User](https://app.diagrams.net/#G1QCwq7zIU2CqByudgxAFem2cCAnIZu9Wo)<br>
- [ER図](https://app.diagrams.net/#G1G6fu3wetSF8ObgSZb6vQUfn9jT4QXe3Z)<br>

## 機能一覧
- [googleスプレッドシート](https://docs.google.com/spreadsheets/d/11ske6SFWajgfFdTrv7dg0c_PyO68K0bY4ohnrQZiVaQ/edit?usp=sharing)<br>

- 管理者機能<br>
  - 投稿一覧テーブル（CSVエクスポート）（gem roo）
  - CSV出力・入力（投稿・ユーザー・部署）
  - チャート機能（gem chartkick）
  - ユーザー管理（CSVインポート・エクスポート）（gem roo）
  - 部署管理（CSVインポート・エクスポート）（gem roo）
  - ユーザー検索（gem ransack）
  - ランキング

- ユーザー機能
  - タイムライン
  - 投稿（ユーザー検索＋投稿）
  - いいね（Ajax非同期通信）
  - コメント（Ajax非同期通信）
  - ランキング（投稿者・受信者・いいね数）
  - 新着通知（投稿・いいね・コメント）

- その他
  - コード解析（rubocop_airbnb）
  - ユーザー認証機能（gem devise）
    - 日本語化及びカスタマイズ（gem rails-i18n, gem devise-i18n）
  - CRUD処理
  - レイアウト（gem bootstrap 4.5, kaminari）
  - 画像編集（gem refile）
  - デバッグ（gem pry-rails）


