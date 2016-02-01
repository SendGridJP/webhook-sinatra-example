# webhook-sinatra-example

SendGridのWebhook受信アプリケーションのサンプルコードです。
Event WebhookおよびParse Webhookに対応しています。
[Sinatra](http://www.sinatrarb.com/)上で動作します。

# 前提条件
- Ruby：2.2.2
- Sinatra：1.4.x

# 起動方法
```
$ git clone https://github.com/SendGridJP/webhook-sinatra-example
$ cd webhook-sinatra-example
$ bundle install
$ rackup
```

# SendGridの設定
## Event Webhook
1. Webポータルで[SETTINGS > Mail Settings > Event Notification](https://app.sendgrid.com/settings/mail_settings)を開きます。
1. HTTP POST URLを設定します。  
http(s)://`Webアプリケーションのホスト名`/event_receiver
1. SELECT ACTIONSで受信したいイベントのチェックをONにします。
1. 「Test Your Integration」ボタンを選択してイベントがWebアプリケーションにPOSTされることを確認します。
1. SendGrid経由で[送信](https://sendgrid.com/docs/API_Reference/Web_API/mail.html)したメールの各イベントがアプリケーションにPOSTされることを確認します。

## Parse Webhook
1. Webポータルで[SETTINGS > Inbound Parse](https://app.sendgrid.com/settings/parse)を開きます。
1. 「Add Host & URL」ボタンを選択して各設定を行います。[参考](https://sendgrid.kke.co.jp/blog/?p=827)
  1. HOSTNAME：メールの宛先ドメイン。
  1. URL：http(s)://`Webアプリケーションのホスト名`/parse_receiver
  1. SPAM CHECK：OFF
  1. SEND RAW：OFF
1. 「Save」ボタンを選択して保存します。
1. HOSTNAMEに設定したドメインの任意のメールアドレス宛にメールを送信して、受信したメールの内容がWebアプリケーションにPOSTされることを確認します。
