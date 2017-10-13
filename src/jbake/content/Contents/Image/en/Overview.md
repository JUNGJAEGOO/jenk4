title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Contents > Image > Overview

고객님의 서비스에서 사용하는 이미지를 저장, 편집 그리고 전송까지 한번에 제공하는 시스템입니다.

## 주요 기능
- 어플리케이션에서 사용 가능한 RESTful API를 제공합니다.
- 다중 폴더 생성, 다중 이미지 업로드, 다중 파일 다운로드, 다중 파일 삭제 기능을 제공합니다.
- 원본 이미지 파일 URL에 파라메타만 추가하시면 실시간으로 원하는 사이즈의 썸네일을 생성할 수 있습니다.

## 서비스 용어

|용어|	설명|
|---|---|
|AppKey|	Toast Cloud 사용자의 프로젝트와 상품이 1:1로 매칭이 되는 키이며, 프로젝트당 하나의 이미지용 AppKey가 발급됩니다.|
|SecretKey|	AppKey 와 함께 발급이 되며, HTTP Request Header 에 Authorization 이라는 키로 값을 전송해야 AppKey에 대한 인증이 됩니다. SecretKey는 외부 사용자에게는 노출되지 않게 웹 페이지와 모바일 App 소스에 포함하지 않고, 서버에서 처리하는 것이 좋습니다.<br/>Web Console에서 SecretKey를 재 생성하면, 이전에 사용했던 SecretKey는 사용할 수 없게 됩니다.|
|폴더|	폴더는 이미지를 저장하는 단위이며, 윈도우 폴더나 리눅스의 디렉토리와 유사합니다.|
|원본 이미지|	Web Console 또는 API를 통해 직접 업로드한 이미지 파일을 말합니다.|
|생성된 썸네일|	동적으로 이미지 URL에 파라미터를 추가하여 생성된 썸네일을 말합니다.|
|URL|	이미지를 전송할 때 사용하는 URL 입니다.|
