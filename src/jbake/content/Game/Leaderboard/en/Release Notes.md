title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGameLeaderboardRelease
~~~~~~
## Game > Leaderboard > Release Notes
### 2017.08.24

#### 기능 개선/변경
* [Document] API 호출 정책 관련 문구 삽입
* [Console] 팩터 등록 시 사용하는 용어 및 설명 변경

#### 버그 수정
* [Console] 지난 주기 유저가 삭제되지 않는 문제 수정
* [Server]  초기화 시점에 데이터가 들어왔을 때 정합성 문제 수정
* [API] Score 에 너무 큰 수 /작은 수가 입력 되었을 경우 Infinity 로 출력되는 이슈 수정
* [API] UserID 에 "" 가 들어오지 못하도록 수정

### 2017.06.22

#### 버그 수정
* [Console] IE 에서 랭킹 등록 시 이름을 한글로 등록 하는 경우 내용이 잘리는 이슈 수정
* [Console] 랭킹 내 유저 조회 시 유저 범위 조회가 UI 와 맞지 않는 이슈 수정

### 2017.04.20

#### 기능 개선/변경
* [Console] 랭킹 설정 탭에 팩터 검색 기능 추가. 팩터 이름, 팩터 주기에 따라 검색 가능
* [Console] 랭킹 데이터 탭에 검색 창 간결하게 변경. 검색 시 팩터 주기를 기준으로 등록된 팩터 분류.

#### 버그 수정
* [API] 서버로 요청이 오면, 비정상적인 요청인 경우에도, HTTP Status Code 를 200으로 리턴.

### 2017.02.23

#### 기능 개선/변경
* [Console] 팩터 추가 시 주기가 'Total' 인 경우 팩터 리셋 시간 노출되지 않도록 변경
* [Console] 유저 ID별 랭킹 조회 시 과거 주기도 검색될 수 있도록 기능 추가

#### 버그 수정
* [Console] 다수의 랭킹 데이터 삭제 요청시 웹 페이지 동작이 멈추는 버그 수정
	
### 2017.01.19
#### LeaderBoard v2 업그레이드 안내

* 내부 구조 변경
    * 데이터 확장성
        * 유연하게 데이터를 확장 할 수 있는 구조로 변경
    * 성능
        * 기존 구조 대비 성능 향상

* RESTful API 인터페이스 개선
    * 일관성 있고 명확한 RESTful API 인터페이스로 개선

<a href="http://cloud.toast.com/support/notice/detail/1453435858K00349" target="_blank">[공지] TOAST Cloud LeaderBoard v2 안내</a><br>
