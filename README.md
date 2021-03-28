# README

## 製作背景
* DMMWEBCAMPにてチーム開発課題として架空のECサイトを製作しました。
## 概要
* 長野県にある小さな洋菓子店「ながのCAKE」の商品を通販するためのECサイト開発。
## 案件背景
* 元々近隣住民が顧客だったが、昨年始めたInstagramから人気となり、全国から注文が来る
ようになった。
InstagramのDMやメールで通販の注文を受けていたが、情報管理が煩雑になってきたため、
管理機能を含んだ通販サイトを開設しようと思い至った。

## 通販について
* 通販では注文に応じて製作する受注生産型としている。
* 現在通販での注文量は十分に対応可能な量のため、1日の受注量に制限は設けない。
* 送料は1配送につき全国一律800円。
* 友人や家族へのプレゼントなど、注文者の住所以外にも商品を発送できる。
* 支払方法はクレジットカード、銀行振込から選択できる。
## 用語の定義
* 顧客 : ながのCAKEの商品を購入する人（客）
* 会員 : ECサイトにユーザー登録している顧客
* ECサイト : 顧客が利用するサイト
* 管理サイト : 店で働く事務員・パティシエ等が利用するサイト（管理者用サイト）
* 注文ステータス : 注文の状態遷移を表す（後述）。
* 製作ステータス : 注文に紐付く注文商品の状態遷移を表す（後述）。
* 販売ステータス : 商品の販売状況を表す。現状、販売中、売切れの2パターンがある。販売停止商品は「売切れ」をセットする。
* 会員ステータス : 現状、有効・退会の2パターンがある。
* ジャンル : 商品の種類
* 注文個数 : 1回の注文に紐付く注文個数の合計。
* 商品小計 : 商品単価（税込）×個数

# 実装機能/使用方法
## Customer （顧客・会員）
- 顧客は会員登録、ログイン・ログアウト、退会ができます。  
- 会員のログインはメールアドレスとパスワードで行えます。  
- 会員がログインしている状態かどうか、ページのヘッダーにユーザ名を表示するなどして判断できます。  
- サイトの閲覧はログインなしで行えます。  
- 商品をカートに入れ、1度に複数種類、複数商品の購入ができます。また、カート内の商品は個数変更・削除ができます。  
- カートへの商品追加はログインなしでは行えなえません。  
- 会員はマイページからユーザ情報の閲覧・編集、注文履歴の閲覧、配送先の閲覧・編集ができます。  
- 注文履歴には購入履歴ごとに下記の情報が表示されます。 
 - 購入日  
	- 購入内容(商品名、個数、金額など)  
	- 購入価格総計  
	- 送付先  
	- ステータス(入金待ち/発送待ち/発送済み) 
- 会員登録時、下記の情報をユーザ情報として入力できます。
	- 名前(姓・名)  
	- 名前(カナ姓・カナ名)  
	- 郵便番号  
	- 住所  
	- 電話番号  
	- メールアドレス  
	- パスワード 
- 商品は税込価格で表示されます。
## Admin　（店舗側）
- 管理者用メールアドレスとパスワードでログインできます。
- 商品の新規追加、編集、販売停止が行えます。
- 商品情報は下記のものを持っています。
	 - 商品名  
	- 商品説明文  
	- ジャンル  
	- 税抜価格  
	- 商品画像  
	- 販売ステータス(販売中/売り切れ)
- 会員登録されているユーザ情報の閲覧、編集、退会処理が行えます。
- ユーザの注文履歴が一覧・詳細表示できます。
- 注文履歴には注文ごとに下記の情報が表示されます。
	 - 購入者  
	- 購入日  
	- 購入内容
	 - 請求額合計  
	- 送付先  
	- 注文ステータス(入金待ち/入金済み/発送済み)  
	- 製作ステータス(製作待ち/製作中/製作完了)
- 注文ステータス、製作ステータスの更新ができます。
## 使用言語
* HTML&CSS  
* Ruby
* フレームワーク
	- Ruby on rails (5.2.4)

## Gem
- device
- rubocop-airbnb
- bootstrap
- jquery-rails
- kaminari
- refile
- refile-mini_magick
- byebyg
- pry-byebug
- pry-rails

## 作成者
* DMM_psp
  * 可部晋太郎(https://github.com/shintarokabe)
  * 駒木優一(https://github.com/yuuichi-komaki)
  * 冨田克昌(https://github.com/Katsumasa-Toda)
  * 古屋友樹(https://github.com/furuya-tomoki)

