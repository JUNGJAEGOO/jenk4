title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Game > Real Time Multiplayer > Getting Started 

## 서비스 활성화

Console에서 [Game] > [Real-time Multiplayer]를 선택한 후, [상품이용]버튼을 클릭하여 서비스를 활성화 시킵니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_31.jpg)

## Appkey와 URL 확인

상품을 활성화 후, 다음과 같이 [URL & Appkey]를 클릭해서 발급된 URL과 Appkey를 확인합니다. URL과 Appkey는 SDK에 입력하여 사용하게 됩니다. 서비스 이용을 종료하면 URL과 Appkey는 복구되지 않으니 주의하기 바랍니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_32.jpg)

## SDK 다운로드

SDK를 내려받아 프로젝트에 추가해야 합니다. SDK는 [DOCUMENTS] > [Download]에서 내려받을 수 있습니다. 다음과 같이 SDK와 함께 샘플 프로젝트, 샘플 프로그램이 같이 제공됩니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_33.jpg)

## SDK 추가

내려받은 SDK를 유니티 프로젝트에 추가합니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_34.jpg)

## NetworkManager 추가

임의의 GameObject를 생성해서 다음과 같이 인스펙터에서 NetworkManager Component를 추가합니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_35.jpg)

## URL과 Appkey 입력

앞에서 확인한 URL과 Appkey를 NetworkManager의 인스팩터에 입력합니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_36.jpg)

## 설정

현재 씬을 연결이 끊어졌을 때 호출될 씬으로 지정하고 네트워크 연결 상태일 때 사용될 씬을 생성해서 [File] > [Build Settings]에 등록합니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_37.jpg)

![](http://static.toastoven.net/prod_realtimemultiplayer/img_38.jpg)

Network Manager의 인스펙터에서 다음과 같이 등록합니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_39.jpg)

## 연결 및 종료

TOAST Cloud에서 제공하는 리얼 타임 멀티플레이어 서비스를 사용하기 위해서는 앞에서 추가한 NetworkManager 컴포넌트의 Connect 함수를 호출해야 하지만, 다음과 같이 Network Manager HUD 컴포넌트를 사용해서 네트워크 연결을 확인해볼 수 있습니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_40.jpg)

![](http://static.toastoven.net/prod_realtimemultiplayer/img_41.jpg)

유니티 에디터에서 [Edit] > [Play]를 클릭하면 게임 화면에서 다음과 같이 확인할 수 있습니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_42.jpg)

UserID에 플레이어를 구분할 수 있는 고유 아이디를 입력하고 Connect 버튼을 클릭하면 Online Scene항목에 지정한 씬이 호출되고 게임 화면이 다음과 같이 변경됩니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_43.jpg)

Disconnect 버튼을 클릭하면 Offline Scene에 지정한 씬으로 변경됩니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_44.jpg)

## 동시 접속 확인

Console에서 리얼 타임 멀티플레이어의 동시 접속 사용자는 다음과 같이 확인할 수 있습니다.

![](http://static.toastoven.net/prod_realtimemultiplayer/img_45.jpg)

## 동영상

동영상을 보면서 따라 해 보세요.

<iframe width="420" height="315" src="https://www.youtube.com/embed/oGhKo01pJoI" frameborder="0" allowfullscreen></iframe>
