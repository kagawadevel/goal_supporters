# goals_supporters  
## 概要（コンセプト）
勉強・筋トレ・資格取得等、自分が達成したいことを予め設定しておき、同じ目的をもったユーザー同士でグループを作成し、お互いに日々取り組めているかを報告・称賛しあうサービス。
## バージョン
- rails 5.2.3
- ruby 2.6.3
## 機能一覧
- ログイン機能
    - ログイン
    - ログアウト
    
- ユーザー機能
    - ユーザー登録
    - ユーザー編集
    - ユーザー削除
    
- グループ機能
    - 新規グループ作成
    - グループ編集
    - グループへのタグ付け
    - グループ削除

- タグ作成機能（seedデータで作成）
    - タグ作成
    - タグ編集
    - タグ削除 
    
- 目標登録機能
    - 新規目標作成
    - 目標編集
    - 目標達成済み
    - 目標削除
    

## カタログ設計  

  https://docs.google.com/spreadsheets/d/1dfSOcIvFsssa73VVfuFs-ZJ7oqcaADTux02gvyeFK5k/edit#gid=0  
## テーブル定義
https://docs.google.com/spreadsheets/d/1dfSOcIvFsssa73VVfuFs-ZJ7oqcaADTux02gvyeFK5k/edit#gid=25420550
## ER図
https://docs.google.com/spreadsheets/d/1dfSOcIvFsssa73VVfuFs-ZJ7oqcaADTux02gvyeFK5k/edit#gid=1778430887
## 画面変遷図
https://docs.google.com/spreadsheets/d/1dfSOcIvFsssa73VVfuFs-ZJ7oqcaADTux02gvyeFK5k/edit#gid=11503092
## ワイヤーフレーム
https://cacoo.com/diagrams/pSKOXxBigOv33Kym/A7D20
## 使用予定gem

- device
- carrierwave
- mini_magick
- kaminari
- fog-aws
- ransack
