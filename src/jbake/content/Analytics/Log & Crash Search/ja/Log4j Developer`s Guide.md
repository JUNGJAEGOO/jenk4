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

- Log4J 1.2.x (1.2.14, 1.2.16, 1.2.17)

## ダウンロード

[Toast Cloud](http://docs.cloud.toast.com/ko/Download/)でLog4J SDKをダウンロードできます。

```
[DOCUMENTS] > [Download] > [Analytics > Log & Crash Search] > [Log4J SDK]をクリックします。
```

## インストール

### 構成

Log4J SDKは、次のように構成されています。

```
docs/       ; Log4J SDKドキュメント
lib/        ; Log4Jライブラリ
sample/     ; Log4Jサンプル
```

### SDKサンプル

一緒に提供されているsample/log4j/について説明します。

1.Eclipseを起動し、メニューから「File - Import - Maven - Existing Maven Projects」を実行して、sample/log4j/を開きます。  
2.「src/test/resources/log4j.xml」ファイルを開いて発行されたアプリケーションキーとバージョンを修正し、必要な場合は収集サーバーのアドレスを変更します。

```
<param name="collectorUrl" value="http://api-logncrash.cloud.toast.com" />
<param name="appKey" value="__app_key__" />
<param name="version" value="1.0.0" />
```

3.Eclipseメニューから「Project - Properties - Java Build Path - Libraries」を選択して「toast-logncrash-log4j-sdk- <version > .jar」を追加します。
4.Eclipseメニューから「Run - Run As - JUnit Test」を選択して実行します。

## 使用例

1.Log4J SDKライブラリをProjectに追加します。  
- 例えば、Eclipseのメニュー「Project - Properties - Java Build Path - Libraries」を選択して「toast-logncrash-log4j-sdk- <version > .jar」を追加します。

2.Mavenを使用している場合は、pom.xmlにdependencyを追加します。  

```
<dependency>
  <groupId>log4j</groupId>
  <artifactId>log4j</artifactId>
  <version>1.2.17</version>
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
  <groupId>org.slf4j</groupId>
  <artifactId>slf4j-log4j12</artifactId>
  <version>1.7.2</version>
</dependency>
```

3.Mavenを使用していない場合は、次のライブラリをダウンロードしてclass pathに追加します。  

```
log4j, 1.2.17
commons-lang, 2.5
httpclient, 4.2.6
httpcore, 4.2.4
servlet-api, 2.4
json, 20090211
```

4.Appender設定と構成のためにlog4j.xmlを作成します。  

- 全体の構成は、sample/log4j/src/test/resources/log4j.xmlをご覧ください。  
- collectorUrl、appKeyには必ず**収集サーバーのアドレス**、**発行されたアプリケーションキー**を使用する必要があります。

```
<appender name="logncrash-http" class="com.toast.java.logncrash.log4j.LogNCrashHttpAppender">
	 <param name="collectorUrl" value="http://api-logncrash.cloud.toast.com" />
	 <!-- v2 -->
	 <!--	  -->
	 <param name="appKey" value="__app_key__" />
	 <param name="version" value="1.0.0" />
	 <param name="logSource" value="http-log4j" />
	 <param name="logType" value="log" />
	 <param name="Threshold" value="ALL" />
	 <param name="errorCodeType" value="default" />
	 <param name="enable" value="true" />
	 <param name="debug" value="false" />
</appender>
...
<root>
 <appender-ref ref="logncrash-http" />
</root>
```

5.propertiesに設定するには、log4j.propertiesを作成します。  

```
log4j.rootLogger=ALL, STDOUT, logncrash-http
log4j.appender.STDOUT=org.apache.log4j.ConsoleAppender
log4j.appender.STDOUT.Threshold=DEBUG
log4j.appender.STDOUT.layout=org.apache.log4j.PatternLayout
log4j.appender.STDOUT.layout.ConversionPattern=%m%n
log4j.appender.logncrash-http=com.toast.java.logncrash.log4j.LogNCrashHttpAppender
log4j.appender.logncrash-http.collectorUrl=http://api-logncrash.cloud.toast.com
log4j.appender.logncrash-http.appKey=__appkey__
log4j.appender.logncrash-http.version=1.0.0
log4j.appender.logncrash-http.logSource=http-log4j
log4j.appender.logncrash-http.logType=log
log4j.appender.logncrash-http.Threshold=ALL
log4j.appender.logncrash-http.errorCodeType=default
log4j.appender.logncrash-http.enable=true
log4j.appender.logncrash-http.debug=false
```

6.Javaで次のように使用します。

```
	...
private static Logger logger = Logger.getLogger(LogNCrashLog4jSample.class);
...
// Custom Message
MDC.put("custommessage", "custom message");
logger.debug("Log4j SDK Debug Message");
try {
	String npe = null;
	npe.toString();
} catch(Exception e) {
	logger.error("Log4J SDK Exception", e);
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
- Threshold：送信するログレベルの指定、デフォルト値「ALL」。
- enable：Appenderの使用可否設定、デフォルト値「true」。
- debug：デバッグを使用するかどうかの設定、デフォルト値「false」。
- errorCodeType：エラーコードのタイプ設定、デフォルト「default」。  
	default：Exception情報を使用。  
	mdc：Log4j MDCのerrorCode項目値を設定して使用する。  

## 制約事項

- 現在、**log4j 2.0**バージョンでは動作しません。log4j 1.3はalpha8のみ作動しますが、log4j 1.2への移行を推奨します。推奨バージョンはlog4j 1.2.14/1.2.16/1.2.17です。
- エラーデータが一度に多く発生した場合、logncrash-async appenderのbufferSizeが小さいと、log4j自体で処理遅延が発生することがあるので、bufferSizeの調節が必要です。

## FAQ

### blockingをfalseで使用するには？

log4j.xmlで次のようにlogncrash-asyncのclass名を変更する。

```
<!-- define logncrash-async appender -->
<appender name="logncrash-async" class="com.toast.java.logncrash.log4j.LogNCrashAsyncAppender">
    <param name="Threshold" value="ALL" />
    <param name="blocking" value="false" />
    <param name="locationInfo" value="false" />
    <param name="bufferSize" value="2048" />
    <appender-ref ref="logncrash-http" />
</appender>
```

### batch program(project)でlogncrash clientを使用するには？

Quartzなどを使用して、デーモンとして動くbatch projectには適用されません。 batchプログラムの最後に数秒間待機するコードを追加します。

```
try {
    Thread.sleep(3000L);
} catch (InterruptedException ignore){}
```

logncrash-async appenderの場合、org.apache.log4j.AsyncAppenderを使用しています。  
AsyncAppender中にログを記録する別のデーモンスレッドが生成され、非同期でログを送信するようになっています。 Java batch programでmain threadがすぐに終了するため、AsyncAppenderデーモンスレッドが生成され、ログを送信する前にbatchアプリケーションが終了します。  
デーモンスレッドに関係なく生きている一般的なスレッドがない場合、JVMはすぐに終了します。  
他に以下のようなbatch用のlog4j.xmlを別途使用する方法があります。 loggerでappender logncrashをすぐに使用するようにlog4j.xmlを修正します。この場合、loggingが同期モードで動作するので、エラー発生時にエラー収集サーバーの呼び出しのためにdelayが発生します。web projectでは、この方法を使用しないようにします。  

```
<!-- // define loggers // -->
<logger name="com" additivity="false">
    <level value="INFO"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash"/>
</logger>
<!-- // define root // -->
<root>
    <level value="WARN"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash"/>
</root>
```

### Java stack traceをlog4j(Log & Crash Search含む)に記録するには？

log4jを利用して、stack traceを出力するには、log.error(e.getMessage()、e);フォームを使用します。 log.error(e);の場合は、stack traceが出力されません。  

```
String[] aa = null;
try {
    aa[0] = "111";
} catch (NullPointerException e) {
    log.error(e); //stacktrace出力されない。
    log.error(e.getMessage(), e); ///stacktrace出力
}
```

### log4j(Log & Crash Search含む)loggingによるパフォーマンスの低下を最小限に抑えるには？

log4j.xmlのlogger設定でnameとlevelを使用してfilteringを最大化します。  
以下のようにloggerの設定でcomやorgをDEBUG levelに設定すると、loggerから多くのLoggingEvent(log4j)が不必要に生成されます。 AppenderでThresholdがERRORに設定されているので、実際のログ送信はされませんが、一度loggerでLoggingEventが生成がされ、appenderに伝達されます。  

[パフォーマンスが低下する設定(開発用にのみ使用)]

```
<!-- // define loggers // -->
<logger name="com" additivity="false">
    <level value="DEBUG"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</logger>

<!-- // define loggers // -->
<logger name="org" additivity="false">
    <level value="DEBUG"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</logger>

<!-- // define root // -->
<root>
    <level value="WARN"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</root>
```

[パフォーマンスに考慮した設定(運営用に使用)]

```
<!-- // define loggers // -->
<logger name="com" additivity="false">
    <level value="ERROR"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</logger>

<!-- // define root // -->
<root>
    <level value="WARN"/>
    <appender-ref ref="STDOUT"/>
    <appender-ref ref="logncrash-async"/>
</root>
```

### WASで使用時、安全に終了をするには？

エラーログが送信中の状況で、WAS(Tomcatなど)が終了した場合、次のようなExceptionが発生し、WASが正常に終了しないことがあります。  

```
Exception in thread "pool-12-thread-1" java.lang.NullPointerException
at_external.org.apache.mina.common.AbstractPollingIoProcessor$Worker.run(AbstractPollingIoProcessor.java:740)
at_external.org.apache.mina.util.NamePreservingRunnable.run(NamePreservingRunnable.java:51)
at_java.util.concurrent.ThreadPoolExecutor$Worker.runTask(ThreadPoolExecutor.java:886)
at_java.util.concurrent.ThreadPoolExecutor$Worker.run(ThreadPoolExecutor.java:908)
at_java.lang.Thread.run(Thread.java:619)
```
ログの送信中にWASが終了した場合は、Exceptionが発生します。このような現象を防止するためには、WAS終了時にLogManager.shutdown()メソッドを呼び出して、logncrash appenderをcloseすると安全に終了できます。  
org.springframework.web.util.Log4jConfigListenerを使用している場合は、WAS終了時にLog4jConfigListenerがLogManager.shutdown()メソッドを呼び出すので、追加の設定をしなくても安全に終了できます。  
Log4jConfigListenerを使用しない場合のためにlogncrash-appenderはcom.toast.java.logncrash.log4j.Log4jShutdownListenerを提供しています。 web.xmlに次のような設定を追加すると、WAS終了時にエラーログの送信が発生しても、安全に終了します。  

```
<listener>
    <listener-class>
        com.toast.java.logncrash.log4j.Log4jShutdownListener
    </listener-class>
</listener>
```
