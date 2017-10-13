title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Analytics > Log&Crash Search > Log4j Developer's Guide

Log & Crash Log4J SDKはLog & Crash Search収集サーバーにログを送信する機能を提供します。
Log & Crash Log4J SDKの特徴は次の通りです。

- ログを収集してサーバーに送信します。
- Log & Crash Searchから送られたログの照会/検索ができます。
- マルチスレッディング環境で動作します。

## 動作環境

- Log4J 2.x

## ダウンロード

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)でLog4J SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Log4J.v2 SDK]をクリックします。
```

## インストール

### 構成

Log4J SDKは、次のように構成されています。

```
docs/       ; Log4J 2 SDKドキュメント
lib/        ; Log4J 2 ライブラリ
sample/     ; Log4J 2 サンプル
```

### SDKサンプル

一緒に提供されているsample/log4j2/について説明します。

1.Eclipseを起動し、メニューから「File - Import - Maven - Existing Maven Projects」を実行して、sample/log4j2/を開きます。  
2.「src/test/resources/log4j2.xml」ファイルを開いて発行されたアプリケーションキーとバージョンを修正し、必要な場合は収集サーバーのアドレスを変更します。

```
<collectorUrl>http://api-logncrash.cloud.toast.com </collectorUrl>
<appkey>__app_key__</appkey>
<version>1.0.0</version>
```

3.Eclipseメニューから「Project - Properties - Java Build Path - Libraries」を選択して「toast-logncrash-log4j2-sdk- <version > .jar」を追加します。
4.Eclipseメニューから「Run - Run As - JUnit Test」を選択して実行します。

## 使用例

1.Log4J SDKライブラリをProjectに追加します。  
- 例えば、Eclipseのメニュー「Project - Properties - Java Build Path - Libraries」を選択して「toast-logncrash-log4j2-sdk- <version > .jar」を追加します。

2.Mavenを使用している場合は、pom.xmlにdependencyを追加します。  

```
<dependency>
      <groupId>org.apache.logging.log4j</groupId>
      <artifactId>log4j-api</artifactId>
      <version>2.3</version>
  </dependency>
  <dependency>
      <groupId>org.apache.logging.log4j</groupId>
      <artifactId>log4j-core</artifactId>
      <version>2.3</version>
  </dependency>
  <dependency>
      <groupId>commons-lang</groupId>
      <artifactId>commons-lang</artifactId>
      <version>2.5</version>
  </dependency>
  <dependency>
      <groupId>org.apache.httpcomponents</groupId>
      <artifactId>httpclient</artifactId>
      <version>4.2.6</version>
  </dependency>
  <dependency>
      <groupId>org.apache.httpcomponents</groupId>
      <artifactId>httpcore</artifactId>
      <version>4.2.4</version>
  </dependency>
  <dependency>
      <groupId>javax.servlet</groupId>
      <artifactId>servlet-api</artifactId>
      <version>2.4</version>
  </dependency>
  <dependency>
      <groupId>org.json</groupId>
      <artifactId>json</artifactId>
      <version>20090211</version>
  </dependency>
```

- SLF4Jを使用している場合は、次のdependencyを追加します。

```
<dependency>
    <groupId>org.slf4j</groupId>
    <artifactId>slf4j-api</artifactId>
    <version>1.7.2</version>
</dependency>
<dependency>
    <groupId>org.apache.logging.log4j</groupId>
    <artifactId>log4j-slf4j-impl</artifactId>
    <version>2.3</version>
</dependency>
```

3.Mavenを使用していない場合は、次のライブラリをダウンロードしてclass pathに追加します。  

```
log4j, 2.3
log4j-core, 2.3
commons-lang, 2.5
httpclient, 4.2.6
httpcore, 4.2.4
servlet-api, 2.4
json, 20090211
```

4.Appender設定と構成のためにlog4j2.xmlを作成します。  

- 全体の構成は、sample/log4j/src/test/resources/log4j.xmlをご覧ください。  
- collectorUrl、appKeyには必ず**収集サーバーのアドレス**、**発行されたアプリケーションキー**を使用する必要があります。

```
<Appenders>
    <LogNCrashHttpAppender name="HTTP">
    <collectorUrl>http://api-logncrash.cloud.toast.com </collectorUrl>

    <appKey>__app_key__</appKey>
    <version>1.0.0</version>
    <logSource>http-log4j2</logSource>
    <logType>log</logType>
    <enable>true</enable>
    <debug>false</debug>
    </LogNCrashHttpAppender>
    </Appenders>
    ...
    <Loggers>
    <Root level="debug">
    <AppenderRef ref="HTTP"/>
    </Root>
</Loggers>
```

5.Javaで次のように使用します。

```
...
private static Logger log4j2Logger = LogManager.getLogger(LogNCrashLog4j2Sample.class);
...
// CustomField Test
ThreadContext.put("custom", "custom log test");
log4j2Logger.debug("LogNCrash Log4J2 Test");
...
try {
    String npe = null;
    npe.toString();
} catch (Exception e) {
    log4j2Logger.error(e.toString(), e);
}
```

## API List

### log4j.xml設定項目

- collectorUrl：収集サーバーのアドレス。  
	HTTP：http://api-logncrash.cloud.toast.com
- appKey：プロジェクトアプリケーションキー、必須。
- version：プロジェクトのバージョン、デフォルト値「1.0.0」。
- logSource：ログソース、デフォルト値「http-log4j」。
- logType：ログタイプ、デフォルト値「log」。
- enable：Appenderの使用可否設定、デフォルト値「true」。
- debug：デバッグを使用するかどうかの設定、デフォルト値「false」。  

## 制約事項

- 現在、**log4j 1.2**バージョンでは動作しません。

## FAQ

### Java stack traceをlog4j 2(Log & Crash Search含む)に記録するには？

log4j 2 を利用して、stack traceを出力するには、log.error(e.getMessage()、e);フォームを使用します。 log.error(e);の場合は、stack traceが出力されません。  

```
String[] aa = null;
try {
    aa[0] = "111";
} catch (NullPointerException e) {
    log.error(e); //stacktrace出力されない。
    log.error(e.getMessage(), e); ///stacktrace出力
}
```
