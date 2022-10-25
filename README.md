## ディレクトリ構成

|--common      ...IAMなど他プロジェクトへの流用可能なものの管理<br>
|--share       ...gatewayサーバなど環境を跨ぐリソース管理<br>
|--open        ...環境ごとのディレクトリ作成<br>
|--open-VPC.tf ...環境ごとのVPC周りの作成<br>
|--main.tf<br>
|--README.md<br>

## 前準備
aws上で以下のリソースを手動作成
・S3(terraformのbackend設定用)
・Key Pairs(EC2のssh用キー)

## 運用方針
EC2への接続は基本的にSSM(踏み台なし運用などの理由により)

