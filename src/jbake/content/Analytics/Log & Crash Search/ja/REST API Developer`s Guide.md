title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > REST API Developer's Guide

HTTPプロトコルを使用してLog & Crash収集サーバーにログを送信することができ、以下のようなJSON形式で使用します。

```
{
	"projectName" : "__appkey__"、
	"projectVersion": "1.0.0",
	"logVersion": "v2",
	"body": "This log message come from HTTP client.",
	"logSource": "http",
	"logType": "nelo2-log",
	"host": "localhost"
}
```

[基本パラメータ]

```
Log Searchのためのパラメータ。

projectName: string,必須
	[in]アプリケーションキー。

projectVersion: string,必須
	[in]バージョン。ユーザーが指定できる。 「A~Z、a~z、0~9、-._」のみを含む。

body: string、オプション
	[in]ログメッセージ。

logVersion: string、必須
	[in]ログフォーマットのバージョン。 "v2"。

logSource: string、オプション
	[in]ログソース。 Log Searchでフィルタリングのために使用される。定義されていない場合は、"http"。

logType: string、オプション
	[in]ログタイプ。 Log Searchでフィルタリングのために使用される。定義されていない場合は、 "log"。

host: string、オプション
	[in]ログを送信する端末のアドレス。定義されていない場合、収集サーバーのpeer-addressを使用して自動的に埋める。
```

[その他のパラメータ]

```
sendTime; string、オプション
	[in]端末が送信した時間。Unix Timestampで入力。

logLevel; string、オプション
	[in] Syslog event用。

UserBinaryData; string、オプション
	[in]ログ検索画面で[ダウンロード|表示]リンク表示、base64エンコードされた値を入れて送信。

UserTxtData; string、オプション
	[in]ログ検索画面で[ダウンロード|表示]リンクを表示、base64エンコードされた値を入れて送信。

txt*; string、オプション
	[in]フィールド名がtxtで始まるフィールド(txtMessage、txt_descriptionなど)は、分析(analyzed)フィールドに保存される。ログ検索画面でフィールド値の一部の文字列で検索が可能。

long*; long、オプション
	[in]フィールド名がlongで始まるフィールド(longElapsedTime、long_elapsed_timeなど)は、long型のフィールドに格納される。ログ検索画面でlong型Range検索が可能。

double*; double、オプション
	[in]フィールド名がdoubleで始まるフィールド(doubleAvgScore、double_avg_scoreなど)は、double型のフィールドに格納される。ログ検索画面でdouble型Range検索が可能。
```

[カスタムフィールド]

```
カスタムフィールドの名前は"A-Z、a～z"で始まり、"A～Z、a～z、0～9、 - 、_"の文字を使用できます。

上記の基本的なパラメータやCrashパラメータと名前が重複してはいけません。

カスタムフィールドの長さは2kbyteで制限され、2kbyte以上を送信する時は、txt * prefixを付けてフィールドを作成する必要があります。
```

[戻り値]  
収集サーバーでは、次のように返します。

```
Content-Type: application/json

{
	"header":{
		"isSuccessful":true,
		"resultCode":0,
		"resultMessage":"Success"
	}
}

isSuccessful: boolean
	[out]成功した場合true、失敗した場合false。

resultCode: int
	[out]成功した場合0、失敗した場合エラーコード。

resultMessage: string
	[out]成功時に「Success」、失敗時にエラーメッセージ。
```

[Bulk送信]
Bulk送信のためにはJSON array形式で収集サーバーに送信します。

```
[
    {
        "projectName": "__アプリケーションキー__",
        "projectVersion": "1.0.0",
        "logVersion": "v2",
        "body": "This log message come from HTTP client. (1/2)",
        "logSource": "http",
        "logType": "nelo2-log",
        "host": "localhost"
    },
    {
        "projectName": "__アプリケーションキー__",
        "projectVersion": "1.0.0",
        "logVersion": "v2",
        "body": "This log message come from HTTP client. (2/2)",
        "logSource": "http",
        "logType": "nelo2-log",
        "host": "localhost"
    }
]
```

* Note
		※ web上では、受信時間を基準にログをソートして表示しますが、bulk送信の場合、同じ時間に受信したものとみなされ、
		ユーザーが送信した順序が維持されません。
		※ Bulkに送信するログの順序関係を維持するためには、各ログにlncBulkIndexフィールドを追加してinteger値を指定して
		送信すると、サーバーでは、この値を基準に降順で表示します。

```
[
    {
        "projectName": "__アプリケーションキー__",
        "projectVersion": "1.0.0",
        "logVersion": "v2",
        "body": "first message",
        "logSource": "http",
        "logType": "nelo2-log",
        "host": "localhost",
        "lncBulkIndex":1
    },
    {
        "projectName": "__アプリケーションキー__",
        "projectVersion": "1.0.0",
        "logVersion": "v2",
        "body": "second message",
        "logSource": "http",
        "logType": "nelo2-log",
        "host": "localhost",
        "lncBulkIndex":2
    }
]
```
	※ 上の例のように送信した場合、サーバーでは、second message → first message順に表示します。

収集サーバーは、送信された順序に従って、それぞれの結果値をJSON array形式で返します。

```
Content-Type: application/json

{
    "header":{
        "isSuccessful":true,
        "resultCode":0,
        "resultMessage":"Success"
    },
    "body":{
        "data":{
            "total":5,
            "errors":2,
            "resultList":[
                {"isSuccessful":true, "resultMessage":"Success"},
                {"isSuccessful":true, "resultMessage":"Success"},
                {"isSuccessful":false, "resultMessage":"LogVersion Mismatch: v1, /v2/log"},
                {"isSuccessful":false, "resultMessage":"The project(invalidProject) is not registered"},
                {"isSuccessful":true, "resultMessage":"Success"}
            ]}
        }
    }
}

total: int
  [out] 送信されたすべてのログの数。

errors: int
  [out] 送信されたログの中のエラー数。

resultList: array
  [out] 送信された各ログの結果値。
```

> 注意  
> 1. JSON/HTTPでLog & Crash収集サーバーにログを送信する時、次のアドレスを使用する必要があります。  
> Log & Crash: api-logncrash.cloud.toast.com  
> 送信方式 : POST  
> URI: /v2/log  
> Content-Type: "application/json"  
> 2. ログを送信する前に、Log & Crashにプロジェクトを登録したかを確認します。  
> 3. 「logTime」はLog & Crashシステムで使用します。そのキーを使用する時はLog & Crashでは無視します。  
> 4. キー名に空白文字が入らないように注意してください。例えば、"UserID"と"UserID "は、異なるキーとして認識されます。  

## サンプル

[curlを使用して正常にログを送信した場合]

```
//POSTメソッドを使用してログを送信
$ curl -H "content-type:application/json" -XPOST 'http://api-logncrash.cloud.toast.com/v2/log' -d '{
	"projectName" : "__アプリケーションキー__",
	"projectVersion": "1.0.0",
	"logVersion": "v2",
	"body": "this log message come from http client, and it is a simple sample.",
	"logSource": "http",
	"logType": "nelo2-http"
}'
```

[ログ送信が失敗した場合]

```
//URLが間違っている場合(log → loggg)
$ curl -v -H 'content-type:application/json' -XPOST "api-logncrash.cloud.toast.com/v2/loggg" -d '{
	"projectName" : "__アプリケーションキー__"、
	"projectVersion": "1.0.0",
	"logVersion": "v2",
	"body": "this log message come from http client, and it is a simple sample.",
	"logSource": "http",
	"logType": "nelo2-http"
}'


//間違ったフィールドのキーを使用した場合(_xxx)
$ curl -v -H 'content-type:application/json' -XPOST "api-logncrash.cloud.toast.com/v2/log" -d '{
	"projectName" : "__アプリケーションキー__",
	"projectVersion": "1.0.0",
	"logVersion": "v2",
	"body": "this log message come from http client, and it is a simple sample.",
	"logSource": "http",
	"logType": "nelo2-http",
	"_xxx": "this is a invalid key"
	}'
カスタムキーは、"A～Z、a～z、0～9、-_"を含み、最初の文字はアルファベットにする必要がある。
```

[curlを使用してbulkログを送信した場合]

```
//POSTメソッドを使用してログを送信
$ curl -H "content-type:application/json" -XPOST 'http://api-logncrash.cloud.toast.com/v2/log' -d '[
    {
        "projectName": "__アプリケーションキー__",
        "projectVersion": "1.0.0",
        "logVersion": "v2",
        "body": "This log message come from HTTP client, and it is a simple bulk sample. (1/2)",
        "logSource": "http",
        "logType": "nelo2-log"
    },
    {
        "projectName": "__アプリケーションキー__",
        "projectVersion": "1.0.0",
        "logVersion": "v2",
        "body": "This log message come from HTTP client, and it is a simple bulk sample. (2/2)",
        "logSource": "http",
        "logType": "nelo2-log"
    }
]'
```
