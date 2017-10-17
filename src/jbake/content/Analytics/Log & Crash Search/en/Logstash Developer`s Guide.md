title=About
date=2013-09-24
type=page
status=published
big=TCAnalytics
summary=L&CLongstashDV's
~~~~~~
## Analytics > Log&Crash Search > Logstash Developer's Guide

Logstash를 이용하여 다양한 Input과 Output을 처리하는 방법을 설명합니다.

## 다운로드

- Logstash를 다운로드 합니다.
- $ wget http://download.elastic.co/logstash/logstash/logstash-1.5.6.tar.gz
- 압축을 풀어줍니다.
- $ tar zxvf logstash-1.5.6.tar.gz

## 설치 및 실행

Configuring Logstash를 참고해 주세요.

- Logstash 설정 파일을 생성합니다.
- bin/logstash -f <설정 파일> 로 실행합니다.

## Logstash 설정

Logstash를 사용하여 Log 수집하기와 전송하기를 설명합니다.

### Log&Crash Collector Log 수집하기

Logstash를 이용하여 Log&Crash Collector Log를 수집하는 방법을 설명합니다.

#### - input, file에 path를 정의합니다. path에는 반드시 절대 경로가 사용되어야 합니다.

```
input {
...
  file {
	path => [ "/root/apps/nelo2/collector/logs/*" ]
  }
}
```

#### - filter, multiline을 사용하여 여러 줄로 출력되는 Log를 합치도록 처리합니다.

```
filter {
...
  ## Collector's Multi-line Log
  multiline {
	pattern => "=+Show Running Statistic=+"
	what => "previous"
  }
  multiline {
	pattern => "OwfsSink:.*\(total=.*increase=.*speed=.*\)"
	what => "previous"
  }
  multiline {
	pattern => "KafkaSink:.*\(total=.*increase=.*speed=.*\)"
	what => "previous"
  }
...
```

### Log&Crash Collector로 전송하기

Logstash를 사용하여 Log&Crash Collector로 Log를 전송하는 방법을 설명합니다.

#### - filter, mutate를 사용하여 Logstash Log를 Log&Crash HTTP REST API 형식으로 변환합니다.

```
filter {
...
  ## Convert Logstash event to Log&Crash HTTP REST event
  mutate {
	remove_field => [ "@version", "@timestamp", "path", "tags" ]
	rename => {
	  "message" => "body"
	  "host" => "host"
	}
	add_field => {
	  ## TODO:: modify below fields. see> nelo2-http-rest-api-manual-kr.md
	  "projectName" => "nelo2-webapp"
	  "projectVersion" => "0.0.1"
	  "logVersion" => "v2"
	  "logType" => "logstash"
	  "logSource" => "collector"
	  "logLevel" => "INFO"
	}
  }
}
- remove_field를 사용하여 필요없는 field를 제거합니다. 전송되는 로그 크기를 줄이기 위해 사용할 수 있습니다.
- rename을 사용하여 Log&Crash HTTP REST API에 맞춰 field 이름을 변경합니다.
- add_field를 사용하여 Log&Crash HTTP REST API에 필요한 field를 추가합니다.
    - "projectName" : 필수, 프로젝트 이름/앱키
    - "projectVersion" : 필수, 프로젝트 버전
    - "logVersion" : 필수, 로그 포맷 버전
    - "logType" : 옵션, 로그 타입
    - "logSource" : 옵션, 로그 소스
    - "logLevel" : 옵션, 로그 레벨
```

#### - output, http를 사용하여 Log&Crash Collector로 전송합니다.

```
output {
...
  http {
	url => "http://api-logncrash.cloud.toast.com/v2/log"
	http_method => "post"
	format => "json"
	verify_ssl => false
  }
}
- url에 전송할 Log&Crash Collector 주소로 수정해야 합니다.
- Toast Cloud Log&Crash Collector 주소 : http://api-logncrash.cloud.toast.com/v2/log
- URI는 반드시 /v2/log 이어야 합니다.
```

### Apache Access/Error Log 수집하기

Logstash를 이용하여 Apache Access/Error Log를 수집하는 방법을 설명합니다

#### - input, file에 path를 정의합니다. type을 정의해서 access/error를 구분합니다.

```
input {
...
  file {
	path => [ "/root/logs/apache/access.log.*" ]
	type => "apache-access"
  }
  file {
	path => [ "/root/logs/apache/error.log.*" ]
	type => "apache-error"
  }
 ...
}
-위 path는 CAB DEV Web 서버에서 사용된 값입니다. Log 위치가 맞지 않으면 수정해야 합니다.
```

#### - filter, grok를 사용하여 log를 분석합니다.

```
filter {
	  if [type] == "apache-access" {
	grok {
	  match => { "message" => "%{COMBINEDAPACHELOG}" }
	}
  }
  if [type] == "apache-error" {
	grok {
	  match => { "message" => "%{APACHEERRORLOG}" }
	  #patterns_dir => [ "/root/kwonshin/logstash-1.5.6/my-pat.grok" ]
	  patterns_dir => [ "./my-pat.grok" ]
	}
  }
}
- type이 "apache-access" 이면 grok에서 기본으로 제공되는 "%{COMBINEDAPACHELG}"를 사용합니다.
- type이 "apache-error" 이면 "./my-pat.grok"에 정의되어 있는 "%{APACHEERRORLOG}"를 사용합니다.
- my-pat.grok
```

```
 HTTPERRORDATE %{DAY} %{MONTH} %{MONTHDAY} %{TIME} %{YEAR}
#APACHEERRORLOG \[%{HTTPERRORDATE:timestamp}\] \[%{WORD:severity}\] \[client %{IPORHOST:clientip}\] %{GREEDYDATA:message_remainder}
APACHEERRORLOG \[%{HTTPERRORDATE:timestamp}\] \[%{WORD:severity}\] %{GREEDYDATA:message_remainder}

- A bit of logstash cooking 에서 사용된 grok pattern을 수정했습니다.
```

### 다른 Log 수집하기

다른 로그를 수집하기 위해서 다음 URL을 참고하세요.

- [A bit of logstash cooking](https://home.regit.org/2014/01/a-bit-of-logstash-cooking/)

### 환경 변수
logstash는 다음 환경 변수를 지원합니다. logstash가 사용하는 메모리 양은 LS_HEAP_SIZE 환경 변수를 통해 설정할 수 있습니다.

 - LS_HEAP_SIZE="xxx" size for the -Xmx${LS_HEAP_SIZE} maximum Java heap size option, default is "500m"
 - LS_JAVA_OPTS="xxx" to append extra options to the defaults JAVA_OPTS provided by logstash
 - JAVA_OPTS="xxx" to completely override the defauls set of JAVA_OPTS provided by logstash

> 참고  
> Logstash 홈페이지  
> Logstash Reference  
> A bit of logstash cooking  
