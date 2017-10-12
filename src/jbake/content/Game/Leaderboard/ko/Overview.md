title=About
date=2013-09-24
type=page
status=published
big=TCGame
summary=TCGameLeaderboardOverview
~~~~~~
## Game > Leaderboard > Overview

게임에서 친구들과의 순위 경쟁은 빠질 수 없는 게임의 재미요소 입니다.
Leaderboard 플랫폼은 간단한 연동만으로 랭킹 서비스를 구현 할 수 있도록 지원 합니다.

## 주요 기능

다음과 같은 기능을 제공합니다.

#### 랭킹 점수 등록

- 한 명 추가
- 여러 명 추가

#### 랭킹 조회

- 단일 ID로 조회
- 여러 ID로 조회
- 범위 조회

#### 랭킹 삭제

- 단일 사용자의 랭킹 전부 삭제
- 어뷰즈(abuse) 사용자 삭제 (단일 삭제)
- 랭킹 전체 초기화

## 서비스 용어

Leaderboard 에서는 다음 용어를 사용합니다.

[표 1 Leaderboard 용어]

|용어|	설명|
|---|---|
|Leaderboard AppKey|	프로젝트당 하나의 Leaderboard AppKey를 발급함.|
|팩터(Factor)|	랭킹 목적을 구분하는 단위. 팩터에는 주기, 업데이트 기준, 정렬기준 설정.|
|일간랭킹|	하루마다 정해진 시간에 초기화하는 랭킹 주기.|
|주간랭킹|	일주일마다 정해진 요일, 정해진 시간에 초기화하는 랭킹 주기.|
|월간랭킹|	달마다 정해진 날, 정해진 시간에 초기화하는 랭킹 주기.|
|전체랭킹|	초기화하지 않는 랭킹 주기.|

## 서비스 구조

### 물리적구조

Leaderboard 플랫폼의 물리적 구성은 아래 그림 1과 같습니다.

![[그림 1 Leaderboard 물리적 구조]](http://static.toastoven.net/prod_leaderboardv2/overview_1.jpg)
<center>[그림 1 Leaderboard 물리적 구조]</center>

- Game Client/Server는 api-leaderboard.cloud.toast.com으로 데이터를 주고 받습니다.
- Load Balancer는 여러 대로 구성한 Leaderboard 서버로 요청을 분배시킵니다.
- 각 Leaderboard AP 서버는 Memory Server 와 Cassandra 로부터 데이터를 읽고 저장합니다.

### 논리적 구조

Leaderboard 플랫폼의 논리적 구조는 아래 그림 2와 같습니다.

![[그림 2 Leaderboard 논리적 구조]](http://static.toastoven.net/prod_leaderboardv2/overview_2.jpg)
<center>[그림 2 Leaderboard 논리적 구조]</center>

- 한 개의 프로젝트 당 하나의 Leaderboard AppKey가 존재합니다.
- Leaderboard AppKey내에 여러 개의 팩터(Factor)를 등록할 수 있습니다.
- 한 개의 팩터(Factor)에 한 개의 주기를 설정할 수 있습니다.

### 정렬방식

정렬 방식은 팩터/주기 단위로 설정할 수 있습니다. 

오름차순 정렬은 작은 점수부터 큰 점수로 정렬합니다.

![[그림 3 오름차순 정렬]](http://static.toastoven.net/prod_leaderboardv2/overview_3.jpg)
<center>[그림 3 오름차순 정렬]</center>

내림차순 정렬은 큰 점수부터 작은 점수로 정렬합니다.

![[그림 4 내림차순 정렬]](http://static.toastoven.net/prod_leaderboardv2/overview_4.jpg)
<center>[그림 4 내림차순 정렬]</center>

### 업데이트 방식

업데이트 방식은 팩터 단위로 최고/최근/누적 점수로 설정할 수 있습니다. 

최고 점수 업데이트는 이전 점수보다 높은 점수인 경우 업데이트합니다.

![[그림 5 최고 점수 업데이트]](http://static.toastoven.net/prod_leaderboardv2/overview_5.jpg)
<center>[그림 5 최고 점수 업데이트]</center>

최근 점수 업데이트는 가장 마지막 점수를 업데이트합니다.

![[그림 6 최근 점수 업데이트]](http://static.toastoven.net/prod_leaderboardv2/overview_6.jpg)
<center>[그림 6 최근 점수 업데이트]</center>

누적 점수 업데이트는 기존 점수의 누적 합입니다.

![[그림 7 누적 점수 업데이트]](http://static.toastoven.net/prod_leaderboardv2/overview_7.jpg)
<center>[그림 7 누적 점수 업데이트]</center>

### 동점자 순위 결정 방식

동점자 순위 결정 방식은 팩터 단위로 최초/최근 랭킹 획득자 우선순위로 설정할 수 있습니다.

동점자가 여러명일 경우 가장 먼저 등록된 사용자가 더 높은 순위를 가집니다.

![[그림 8 최초 랭킹 획득자 우선 순위]](http://static.toastoven.net/prod_leaderboardv2/overview_8.jpg)
<center>[그림 8 최초 랭킹 획득자 우선 업데이트]</center>

동점자가 여러명일 경우 가장 나중에 등록된 사용자가 더 높은 순위를 가집니다.

![[그림 9 최근 랭킹 획득자 우선 순위]](http://static.toastoven.net/prod_leaderboardv2/overview_9.jpg)
<center>[그림 9 최근 랭킹 획득자 우선 업데이트]</center>
