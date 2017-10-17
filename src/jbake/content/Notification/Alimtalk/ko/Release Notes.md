title=About
date=2013-09-24
type=page
status=published
big=TCNotification
summary=AlimtalkRelease
nation=ko
~~~~~~
## Notification > Alimtalk > Release Notes
### 2017.08.24
#### 기능 추가
* [Console] 알림톡 발송 통계 화면 제공
    - 날짜별/시간대별/요일별 통계 화면이 제공됩니다.
    - 발송한 일자와 템플릿으로 조회할 수 있습니다.

#### 기능 개선/변경
* [Console] 자유버튼 템플릿 등록 시 URL 검증 변경
    - 자유버튼에 URL 등록 시, http:// or https:// 가 필수로 포함 -> #{url}과 같이 템플릿 치환자도 등록할 수 있게 변경하였습니다.
    - 템플릿 치환자 #{url} 형식의 템플릿 치환자가 아닐 경우 http:// or https:// 검증은 유지됩니다.
* [API] Content-type 에러 응답 메세지 수정
    - 요청 header에 Content-type: application/json이 아닐 경우 실패 응답 메세지 수정되었습니다.

### 2017.07.20
#### 기능 추가
* [Console] 알림톡 발송 결과 조회 추가
    - 발신 일시, 수신번호, 템플릿 등의 조건으로 발신한 메세지의 전송 결과를 조회할 수 있습니다.

### 2017.06.22
#### 기능 개선/변경
* [Console] 발신프로필 관리 페이지 추가
* [Console] 테스트 발송 페이지 추가
* [Console] 템플릿 등록 조회 페이지 추가

#### 기능 추가
* [Console] 발송 실패 설정 추가
    - 알림톡 발송 실패 시, LMS로 대체 발송하는 기능
* [Console] 템플릿 자유 버튼 타입에 링크 치환 기능
    - 템플릿 자유 버튼 타입일 경우, 버튼 링크를 치환자로 등록 가능. ex) buttonURL: #{url}


### 2017.05.25
#### 기능 개선/변경
* [Console] 메인페이지 마크업 개선

### 2017.04.20
#### 신규 상품 출시
* Alimtalk은 휴대폰 번호를 기반으로 친구 추가 없이 카카오톡 사용자에게 배송, 예약 시간 등의 정보성 메시지를 발송할 수 있는 상품입니다.
* 손쉬운 연동을 위한 RESTful API를 제공합니다.
