title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Notification > Alimtalk > Developer's Guide

## Alimtalk

#### [API 도메인]

<table>
<thead>
<tr>
<th>도메인</th>
</tr>
</thead>
<tbody>
<tr>
<td>https://api-alimtalk.cloud.toast.com</td>
</tr>
</tbody>
</table>

## 메시지 발송

#### 요청

[URL]

```
POST  /alimtalk/v1.0/appkeys/{appkey}/messages
Content-Type: application/json;charset=UTF-8
```

[Path parameter]

|값|	타입|	설명|
|---|---|---|
|appkey|	String|	고유의 appkey|

[Header]
```
{
  "X-Secret-Key": String
}
```
|값|	타입|	필수|	설명|
|---|---|---|---|
|X-Secret-Key|	String| O | [CONSOLE]에서 생성할 수 있다. [[참고](./Getting Started/#xsecretkey)] |

[Request body]

```
{
    "templateCode": String,
    "recipientList": [{
        "recipientNo": String,
        "templateParameter": {
            String: String
        }
    }]
}
```

|값|	타입|	필수|	설명|
|---|---|---|---|
|templateCode|	String|	O | 등록한 발송 템플릿 코드 |
|recipientList|	List|	O|	수신자 리스트 |
|- recipientNo|	String|	O|	수신번호 |
|- templateParameter|	Object|	X|	템플릿 파라미터 |
|-- key|	String|	X |	치환 키(#{key})|
|-- value| String |	X |	치환 키에 매핑되는 Value값|


#### 응답

```
{
  "header": {
    "resultCode": Integer,
    "resultMessage": String,
    "isSuccessful": boolean
  },
  "message": {
    "requestId": String
  }
}
```

|값|	타입|	설명|
|---|---|---|
|header|	Object|	헤더 영역|
|- resultCode|	Integer|	결과 코드|
|- resultMessage|	String| 결과 메시지|
|- isSuccessful|	Boolean| 성공 여부|
|message|	Object|	본문 영역|
|- requestId | String |	요청 아이디 |

## ATA V.1.0.9 전송결과코드
- ATA Version : ATA V1.0.9 이상

<table class="table table-striped table-hover">
<thead>
	<tr>
		<th>코드값</th>
		<th>의미</th>
	</tr>
</thead>
<tbody>
	<tr>
		<td>1000</td>
		<td>성공</td>
	</tr>
  <tr>
		<td>1001</td>
		<td>Server Busy (RS 내부 저장 Queue Full)</td>
	</tr>
  <tr>
		<td>1002</td>
		<td>수신번호 형식 오류</td>
	</tr>
  <tr>
		<td>1003</td>
		<td>회신번호 형식 오류</td>
	</tr>
  <tr>
		<td>1009</td>
		<td>CLIENT_MSG_KEY 없음</td>
	</tr>
  <tr>
		<td>1010</td>
		<td>CONTENT 없음</td>
	</tr>
  <tr>
		<td>1012</td>
		<td>RECIPIENT_INFO 없음</td>
	</tr>
  <tr>
		<td>1013</td>
		<td>SUBJECT 없음</td>
	</tr>
  <tr>
		<td>1018</td>
		<td>전송 권한 없음</td>
	</tr>
  <tr>
		<td>1019</td>
		<td>TTL 초과</td>
	</tr>
  <tr>
		<td>1020</td>
		<td>charset conversion error</td>
	</tr>
  <tr>
		<td>1099</td>
		<td>인증 실패</td>
	</tr>
	<tr>
		<td>2000</td>
		<td>전송 시간 초과</td>
	</tr>
	<tr>
		<td>2001</td>
		<td>메시지 전송 불가 (예기치 않은 오류 발생)</td>
	</tr>
	<tr>
		<td>3009</td>
		<td>메시지 형식 오류</td>
	</tr>
	<tr>
		<td>3014</td>
		<td>알 수 없는 메시지 상태</td>
	</tr>
	<tr>
		<td>3015</td>
		<td>msg_type 오류(1008 또는 1009 가 아닌경우)</td>
	</tr>
	<tr>
		<td>3023</td>
		<td>메시지 문법 오류(JSON형식오류)</td>
	</tr>
	<tr>
		<td>3024</td>
		<td>발신 프로필 키가 유효하지 않음</td>
	</tr>
	<tr>
		<td>3025</td>
		<td>메시지 전송 실패 (테스트 시, 친구관계가 아닌 경우)</td>
	</tr>
	<tr>
		<td>3026</td>
		<td>메시지와 템플릿의 일치성 확인시 오류 발생</td>
	</tr>
	<tr>
		<td>3027</td>
		<td>카카오톡을 사용하지 않는 사용자 (전화번호 오류 / 050 안심번호)</td>
	</tr>
	<tr>
		<td>3029</td>
		<td>메시지가 존재하지 않음</td>
	</tr>
	<tr>
		<td>3030</td>
		<td>메시지 일련번호가 중복됨</td>
	</tr>
	<tr>
		<td>3031</td>
		<td>메시지가 비어 있음</td>
	</tr>
	<tr>
		<td>3032</td>
		<td>메시지 길이 제한 오류 (공백 포함 1000 자)</td>
	</tr>
	<tr>
		<td>3033</td>
		<td>템플릿을 찾을 수 없음</td>
	</tr>
	<tr>
		<td>3034</td>
		<td>메시지가 템플릿과 일치하지 않음</td>
	</tr>
	<tr>
		<td>3040</td>
		<td>허브 파트너 키가 유효하지 않음</td>
	</tr>
	<tr>
		<td>3041</td>
		<td>Request Body에서 Name을 찾을수 없음</td>
	</tr>
	<tr>
		<td>3042</td>
		<td>발신 프로필을 찾을 수 없음</td>
	</tr>
	<tr>
		<td>3043</td>
		<td>삭제된 발신 프로필</td>
	</tr>
	<tr>
		<td>3044</td>
		<td>차단 상태의 발신 프로필</td>
	</tr>
	<tr>
		<td>3045</td>
		<td>차단 상태의 옐로아이디</td>
	</tr>
	<tr>
		<td>3046</td>
		<td>닫힘 상태의 옐로아이디</td>
	</tr>
	<tr>
		<td>3047</td>
		<td>삭제된 옐로아이디</td>
	</tr>
	<tr>
		<td>3048</td>
		<td>계약정보를 찾을수 없음</td>
	</tr>
	<tr>
		<td>3049</td>
		<td>내부 시스템 오류로 메시지 전송 실패</td>
	</tr>
	<tr>
		<td>3050</td>
		<td>카카오톡을 사용하지 않는 사용자<br>
        72시간 이내에 카카오톡 사용 이력이 없는 사용자 알림톡 차단을 선택한 사용자<br>
        친구톡의 경우 친구가 아닌경우<br></td>
	</tr>
	<tr>
		<td>3051</td>
		<td>메시지가 발송되지 않은 상태</td>
	</tr>
	<tr>
		<td>3054</td>
		<td>메시지 발송 가능한 시간이 아님</td>
	</tr>
  <tr>
		<td>3055</td>
		<td>메시지 그룹 정보를 찾을 수 없음</td>
	</tr>
  <tr>
		<td>3056</td>
		<td>메시지 전송 결과를 찾을 수 없음</td>
	</tr>
  <tr>
		<td>3060</td>
		<td>사용자에게 발송하였으나 수신여부 불투명(Polling)</td>
	</tr>
  <tr>
		<td>9998</td>
		<td>시스템에 문제가 발생하여 담당자가 확인중(현재 서비스 제공중이 아님)</td>
	</tr>
  <tr>
		<td>9999</td>
		<td>시스템에 문제가 발생하여 담당자가 확인중(시스템에 알 수 없는 오류 발생)</td>
	</tr>
	<tr>
		<td>E900</td>
		<td>전송키가 없는 경우</td>
	</tr>
	<tr>
		<td>E901</td>
		<td>수신번호가 없는 경우</td>
	</tr>
	<tr>
		<td>E903</td>
		<td>제목 없는 경우</td>
	</tr>
	<tr>
		<td>E904</td>
		<td>메시지가 없는 경우</td>
	</tr>
	<tr>
		<td>E905</td>
		<td>회신번호가 없는 경우</td>
	</tr>
	<tr>
		<td>E906</td>
		<td>메시지키가 없는 경우</td>
	</tr>
	<tr>
		<td>E915</td>
		<td>중복메시지</td>
	</tr>
	<tr>
		<td>E916</td>
		<td>인증서버 차단번호</td>
	</tr>
	<tr>
		<td>E917</td>
		<td>고객DB 차단번호</td>
	</tr>
	<tr>
		<td>E918</td>
		<td>USER CALLBACK FAIL</td>
	</tr>
	<tr>
		<td>E919</td>
		<td>발송 제한 시간인 경우, 메시지 재발송 처리가 금지 된 경우</td>
	</tr>
	<tr>
		<td>E920</td>
		<td>서비스 타입이 알림톡인 경우, 메시지 테이블에 파일그룹키가 있는 경우</td>
	</tr>
	<tr>
		<td>E999</td>
		<td>기타오류</td>
	</tr>
</tbody>
</table>
