title=About
date=2013-09-24
type=page
status=published
big=TCUpcoming
summary=RTCSGetting
~~~~~~
## Upcoming Products > RTCS > Getting Started
## 서비스 신청 방법
* 서비스 활성 버튼을 클릭하면 위와 같은 화면이 나옵니다.
* 서비스 활성화 한뒤 Setting 화면에서 프로젝트를 설정을 할 수 있습니다..
![enable](http://static.toastoven.net/prod_rtcs/main.png)

## 서비스 설정
![setting](http://static.toastoven.net/prod_rtcs/setting.png)
### 서비스 설정에 필요한 자료
- SSL 사용 여부 : https, wss 를 사용해야할 때 체크
- WebAuth URL : 서비스에서 연결 인증을 하기 위한 URL http, https
- Hook URL : 아래 이벤트에 대한 hook을 받고 싶을 때 체크
- 전달 받을 hook event
  - 연결 완료 : 클라이언트가 접속을 하면 전달됨
  - 연결 종료 : 연결이 종료 되면 전달됨
  - 채널 가입 : 채널에 가입을 하면 전달 됨
  - 채널 탈퇴 : 채널에 탈퇴를 하면 전달 됨
