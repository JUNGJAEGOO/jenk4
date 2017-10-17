title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGameLeaderboardGetting
~~~~~~
## Game > Leaderboard > Getting Started

- Leaderboard 사용을 위해선 상품 이용 후 랭킹을 등록해야 합니다.
- 상품 이용 후에는 게임의 랭킹정보 등록, 삭제 및 플레이어의 랭킹 정보 조회, 삭제를 할 수 있습니다.

## 사용 설정

### 1. Leaderboard 서비스 활성화

Console에서 [Game] > [Leaderboard]를 선택 후 [상품이용] 버튼 클릭 시 서비스가 활성화되고 관리화면으로 전환됩니다.

![[그림 1 Leaderboard 서비스 활성화]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod_1.JPG)
<center>[그림 1 Leaderboard 서비스 활성화]</center>

### 2. API URL/AppKey

서비스 활성화 후 접속 시 API URL 및 Appkey 값을 확인할 수 있습니다.

![[그림 2 Leaderboard URL & AppKey 확인]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod_2.JPG)
<center>[그림 2 Leaderboard URL & AppKey 확인]</center>

## 각 탭 별 설명

### [랭킹 설정]

#### 1. 팩터 추가

1\) 서비스 활성화 후 팩터 정보를 추가해야 합니다. [Game] > [Leaderboard] > [랭킹 설정] > [+추가] 버튼을 클릭해 팩터를 등록합니다.

> [참고]
> 팩터(Factor)는 [주기, 업데이트 기준, 정렬기준]의 묶은 단위입니다.
> 최고점수 랭킹을 일간, 주간, 월간으로 사용하고 싶다면 팩터를 3가지를 만들어야 합니다.

![[그림 3 팩터 등록을 위하여 [+추가] 클릭]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod2_3.JPG)
<center>[그림 3 팩터 등록을 위하여 [+추가] 클릭]</center>

2\) [+추가] 버튼을 클릭하면 그림 3과 같은 <팩터 추가> 팝업이 열립니다.

![[그림 4 팩터 추가]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod2_4.JPG)
<center>[그림 4 팩터 추가]</center>

각 항목별 설명

#### 팩터 이름

- 랭킹을 구분할 이름이며 차후 팩터 검색에 사용될 수 있습니다.

#### 팩터 주기

- 랭킹의 초기화 기간을 의미하며 일간, 주간, 월간, 전체가 있습니다. 주기 또한 팩터 검색에 사용될 수 있으며 각 주기를 기준으로 유저들을 분류합니다.

#### 랭킹 업데이트 기준

- Best Score : 최고 점수 등록. 사용자의 베스트 점수를 기록합니다.
- Latest Score : 최신 점수 등록. 사용자의 가장 최근 점수를 기록합니다.
- Accumulation Score : 누적 점수 등록. 사용자의 점수를 누적 합산해 등록합니다.

#### 정렬 기준

- Desc : 점수를 오름차순으로 정렬합니다.
- Asc : 점수를 내림차순으로 정렬합니다.

#### 동점자 처리

- Priority First Ranking Get : 최초 랭킹 획득 우선. 동점인 경우 먼저 등록된 유저가 높은 등수로 기록됩니다.
- Priority Latest Ranking Get : 최근 랭킹 획득 우선. 동점인 경우 나중에 등록된 유저가 높은 등수로 기록됩니다.

#### 팩터 리셋 시간

- 팩터 별 초기화 시간을 의미합니다. 주기가 전체인 경우 초기화 되지 않아 큰 의미는 없습니다.

#### 팩터 주간 리셋 요일, 팩터 월간 리셋 일자

- 주간, 월간의 경우 초기화 될 요일, 일자를 선택해야합니다.

#### 한계 유저 수

- 해당 팩터에 등록될 수 있는 최대 유저 수를 뜻합니다. 최대 1000만 명까지 입력할 수 있습니다.

#### 기타정보

- 팩터의 extra 데이터로 필요 시 입력합니다.

> 팩터ID는 팩터 추가 시 자동으로 지정됩니다.

#### 2. 팩터 검색

1\) 검색 조건이 팩터 이름일 시 이름에 검색어가 포함된 팩터를 검색합니다.
![[그림 5-1 검색 기준 팩터 이름]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod_11.JPG)

2\) 검색 조건이 팩터 주기일 시 선택 목록에 있는 주기로 검색합니다.
![[그림 5-1 검색 기준 팩터 주기]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod_12.JPG)

#### 3. 팩터 삭제

1\) 삭제할 팩터들을 선택합니다.
![[그림 6 랭킹 설정에서 삭제할 팩터 선택]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod2_5.JPG)
<center>[그림 6 삭제할 팩터 선택]</center>

2\) 삭제 버튼을 클릭시 삭제 팝업이 나타납니다. 팩터는 삭제 시 복구할 수 없으니 신중히 삭제해야 합니다.
![[그림 7 삭제 팝업]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod_6.JPG)
<center>[그림 7 삭제 팝업]</center>

### [랭킹 데이터]

#### 1. 유저 랭킹 조회

1\) 팩터 등록 후 유저 랭킹 조회 탭으로 가면 검색 기준 > 팩터 ID에 등록한 팩터들이 목록화 됩니다. 팩터 주기를 선택하면 각 주기에 맞는 팩터들이 선별됩니다.
![[그림 8 랭킹 데이터 검색]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod_7.JPG)
<center>[그림 8 랭킹 데이터 검색]</center>

2\) 검색 기준을 선택해 유저 정보를 검색합니다.
![[그림 9 유저 정보 검색]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod2_8.JPG)
<center>[그림 9 유저 정보 검색]</center>

각 항목별 설명

#### 주기 설정
- 지난 주기 : 이전 주기의 랭킹 정보를 기준으로 검색합니다.
- 현재 주기 : 현재 주기의 랭킹 정보를 기준으로 검색합니다.

#### 랭킹 설정
- 조회할 유저의 랭킹 범위를 정합니다. 상위 50명, 상위 100명, 특정범위 지정 기능을 제공합니다.

#### 사용자 ID
- 해당 팩터 내에 검색하고자 하는 사용자 ID를 입력합니다. 사용자가 없는 경우 조회되지 않습니다.

#### 2. 유저 랭킹 삭제

1\) 조회 후 삭제할 유저를 선택합니다.
![[그림 10 삭제할 유저 데이터 선택]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod2_9.JPG)
<center>[그림 10 삭제할 유저 데이터 선택]</center>

2\) Scores & Ranks 삭제 버튼을 누르면 삭제 여부를 묻는 팝업이 뜹니다. 삭제 후 취소가 불가능하니 신중히 삭제해야 합니다.
![[그림 11 유저 랭킹 삭제 팝업]](http://static.toastoven.net/prod_leaderboardv2/user_console_mod_10.JPG)
<center>[그림 11 유저 랭킹 삭제 팝업]</center>

※ 개발과 관련된 api 정보는 [Developer's Guide](/Game/Leaderboard/ko/Developer%60s%20Guide/) 를 참조해주세요.
