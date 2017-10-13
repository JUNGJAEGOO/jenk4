title=About
date=2013-09-24
type=page
status=published
big=
summary=
~~~~~~
## Security > AppGuard > Getting Started

AppGuard有 Android版本和iOS版本(Beta)。

Android版本关联SDK(选项)后所构建的apk文件，通过Web Console或CLI来进行App保护 工作(必选项)。<br>
iOS版本的话，通过关联SDK(必选项)来进行应用，没有额外的保护工作。

AppGuard的使用应用阶段如[图 1]。

![[图 1] AppGuard 应用方法](http://static.toastoven.net/prod_appguard/figure1.png)

<center>[图 1] AppGuard 应用方法</center>

## 服务活性化

要想用AppGuard来保护App的话，首先要激活服务。激活方法如[图 2]，在Console上选择[Security] > [AppGuard]后，点击 [Product using]按钮。

![[图 2] AppGuard 활성화](http://static.toastoven.net/prod_appguard/figure2.png)
<center>[图 2] AppGuard活性化</center>

详细的费用内容请参照AppGuard费用政策(<http://cloud.toast.com/pricing/security>)。

## 保护App

### SDK 下载及关联

若是激活AppGuard的话，就会看见[App Setting/Protection]菜单。若是选择 [App Setting/Protection]菜单的话，就可下载SDK。

下载SDK后，按照附加的说明书中进行关联。

### 保护App菜单选择

选择 [App Setting/Protection]后，点击[Protect App]按钮的话，就会出现 [图 3]的页面。(iOS的话，没有保护阶段，只能关联SDK。)

![[图 3] 为了设置保护App而需要输入的项目](http://static.toastoven.net/prod_appguard/figure4.png)
<center>[图 3] 为了设置保护App而需要输入的项目</center>

* 选择[Certificate]。Android为 KeyStore文件。
* 输入[Master Password]，点击[Validation]按钮，可检查证书文件的有效性。
        * 此检查操作是为了在App保护工作前选择KeyStore的有效性和适当的Alias。
        * 有效性检查失败时，需确认证书文件是否正常和管理员密码。
* 选择[Alias]名。
* 输入[Alias Password]。
* 选择要保护的App。
* 选择保护等级。<br>    * Level1 : 有关App的非正常行为及模式基础的基本安全检测功能<br>    * Level2 : Level1 + 代码加密、App防伪等增强的安全功能<br>    * Level3 : Level2 + 强化的安全功能(在特定服务中，可能会需要检测安全性，只有收到额外的应用指南才建议使用。)<br>    * Level ex : 关联SDK作为必须需要的版本，提供Level1和2之间的安全性(只有和其它安全解决方案相冲突时，才建议使用。)
* 点击[OK]按钮，保护App。<br>    \- 若保护App结束的话，选择\[图片4\]的[App Setting / Protection]标签，即可下载被保护的App。现在，将被保护的发布文件上传至各App Store进行发布即可。 
   
![[图 4] 设置/保护App页面](http://static.toastoven.net/prod_appguard/figure5.png)
<center>[图 4] 设置/保护App页面</center>

* App保护工作手段 Console, CLI(Command Line Interface)

## 控制面板

1.  App保护工作已完结的App在App Store发布后，若被Abusing用户探知的话，可在[图 5]的 [Dashboard]标签上确认现状。
2.  [Dashboard]可搜索AppGuard探知的Abusing用户的统计图表和清单。
3.  可用 [User ID]、 [Device ID]、 [Detection Log Count]、 [Detection Log Pattern]、[Search Period]进行搜索。<br> * [User ID]和[Device ID]用逗号来区分，可添加多个条件。
4.  检测统计图表可确认“按检测模式分布”和按时间“检测模式量”。
5.  检测目录会显示[User ID]和[Device ID]、[Detection Log Pattern Information]、[Detection Log Count]、[App version]、[Detection Time]。
6.  搜索结果，点击[Download Report(CSV)]，即可进行下载。

![[图 6] Abusing 用户探知控制面板页面](http://static.toastoven.net/prod_appguard/figure6.png)
<center>[图 6] Abusing 用户探知控制面板页面</center>
