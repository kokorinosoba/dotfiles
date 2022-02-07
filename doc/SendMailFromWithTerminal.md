# メールをターミナルから送信する
## 準備
[こちら](https://rcmdnk.com/blog/2013/11/14/computer-mac/)を参照。
[ここ](https://contentsviewer.work/Master/ShellScript/SendMail)も参考に。

### アカウント・パスワードの設定
Gmailアカウント情報のデータベースを作成。

```
sudo vim /etc/postfix/gmail_passwd
```

内容は以下。
この際に入力するパスワードは[アプリパスワード](https://myaccount.google.com/apppasswords)で作成したパスワードを入力する。
アプリは「メール」を選択する。

```
smtp.gmail.com:587 user@gmail.com:password
```

作成後、データベースファイルを作成。

```
sudo postmap /etc/postfix/gmail_passwd
```

上記コマンドを入力すると`gmail_passwd.db`が作成される。
作成後は元ファイルはいらないため、削除する。

```
sudo rm /etc/postfix/gmail_passwd
```


### postfixの設定
アカウント・パスワードの設定を含めた情報を`/etc/postfix/main.cf`に書き込み。
`sudo vim /etc/postfix/main.cf`

```
# Posifix Configuratoins
#
relayhost = smtp.gmail.com:587

# SASL Authentication
smtp_sasl_auth_enable = yes
smtp_sasl_password_maps = hash:/etc/postfix/gmail_passwd
smtp_sasl_security_options = noanonymous

# TLS Settings
smtp_use_tls = yes
smtp_tls_security_level = encrypt
tls_random_source = dev:/dev/urandom

smtp_always_send_ehlo = yes
smtp_sasl_mechanism_filter = plain
```

## 送信
あとは送信するだけ。
