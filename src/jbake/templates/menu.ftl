
<body>
<!-- Fixed navbar -->
    <header id="header">
    </header>
    <div id="navbar" class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div>
        <div class="navbar-header" style="padding-top : 30px;">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <!-- <a class="navbar-brand" href="#"</a> | <a href="http://cloud.toast.com">TOASTCloud</a> --->
        </div>
        <div class="navbar-collapse collapse">

          <ul class="nav navbar-nav">
<!----------------------- toast cloud main------------------------------------------------>
            <li class="dropdown active">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">TOAST Cloud<b class="caret"></b></a>
              <ul class="dropdown-menu">
              <li class="active"><a href="Overview.html">Overview</a></li>
              <li><a href="Getting Started.html">Getting Started</a></li>
              <li><a href="Realeas Notes.html">Realeas Notes</a></li>
              </ul>
            </li>
<!--------------------------------------------------- infrastrucutre ----------------->
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>#">Infrastructure</a></li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.feed_file}">Contents</a></li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.feed_file}">Analytics</a></li>
            <li><a href="<#if (content.rootpath)??>${content.rootpath}<#else></#if>${config.feed_file}">Game</a></li>
<!-------------------------------------- notification --------------------------------------------------->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Notification<b class="caret"></b></a>
              <ul class="dropdown-menu">
                     <li class="nav-header">PUSH</li>
                     <li><a href="NotificationOverview.html">Overview</a></li>
                     <li><a href="#">Getting Started</a></li>
                     <li><a href="#">Developer's Guide</a><li>
                     <li><a href="#">sssAPI v2.0</a></li>
                     <li><a href="#">sssAPI v1.3</a></li>
                     
                     <li><a href="#">Client SDK Developer's Guide</a></li>
                     <li><a href="#">sssSDK v1.4</a></li>
                     <li><a href="#">sssSDK v1.32</a></li>
                     <li><a href="#">Releas Notes</a></li>
                     

                     <li class ="divider"></li>
                     <li class="nav-header">SMS</li>
                     <li><a href="#">Overview</a></li>
                     <li><a href="#">Getting Started</a></li>
                     <li><a href="#">Developer's Guide</a></li>
                     <li><a href="#">   API v2.0</a></li>
                     <li><a href="#">   API v1.3</a></li>
                     <li><a href="#">Releas Notes</a></li>

                     <li class ="divider"></li>
                     <li class="nav-header">Email</li>
                     <li><a href="#">Overview</a></li>
                     <li><a href="#">Getting Started</a></li>
                     <li><a href="#">Developer's Guide</a></li>
                     <li><a href="#">Releas Notes</a></li>
                     
                     <li class ="divider"></li>
                     <li class="nav-header">Alimtalk</li>
                     <li><a href="#">Overview</a></li>
                     <li><a href="#">Getting Started</a></li>
                     <li><a href="#">Developer's Guide</a></li>
                     <li><a href="#">Releas Notes</a></li>
               

              </ul>
            </li>
<!--------------------------  security -------------------->
            <li class="dropdown">
              <a href="#" class="dropdown-toggle" data-toggle="dropdown">Security <b class="caret"></b></a>
              <ul class="dropdown-menu">
                  <li class="dropdown-submenu">
                  <a tabindex"-1" href="">AppGuard</a>
                     <li><a href="">Overview</a></li>
                     <li><a href="">Getting Started</a></li>
                     <li><a href="">Release Notes</a></li>
                  </li>
                  <li class="dropdown-submenu">
                  <a tabindex"-1" href="">Seucurity Check</a>
                     <li><a href="">Overview</a></li>
                     <li><a href="">Getting Started</a></li>
                     <li><a href="">Release Notes</a></li> 
                  </li>
                  <li class="dropdown-submenu">
                  <a tabindex"-1" href="">Seucurity Monitoring</a>
                     <li><a href="">Overview</a></li>
                     <li><a href="">Getting Started</a></li>
                     <li><a href="">Release Notes</a></li> 
                  </li>
                  <li class="dropdown-submenu">
                  <a tabindex"-1" href="">CAPCHA</a>
                     <li><a href="">Overview</a></li>
                     <li><a href="">Release Notes</a></li> 
                  </li>
                  <li class="dropdown-submenu">
                  <a tabindex"-1" href="">OTP</a>
                     <li><a href="">Overview</a></li>
                     <li><a href="">Release Notes</a></li> 
                  </li>
              </ul>
            </li>
<!---------------------------- Common -------------------------->
            <li><a href="Common.html">Common</a></li>
            <li><a href="Management.html">Management</a></li>
            <li><a href="Upcoming products.html">Upcoming products</a></li> 
            <li><a href="Open Source.html">Open Source</a></li>
          </ul>
        </div><!--/.nav-collapse -->
      </div>
    </div>
          



  
        <div class="container" style="margin-top: 100px ;">
          <div class="col-md-2">
             <div class="side_nav_left_wrapper">
                <div id="side_nav_left" class="side-nav">
                   <div id="remotenav" class="bs-sidebar hidden-print affix well toc-list" role="complementary">
         <ul class="nav bs-sidenav">
          
            <li class="main active"><a href="#toast-cloud-release-notes">TOAST Cloud &gt; Release Notes</a></li>
               
             <li class="main "><a href="#_1">서비스 구성</a><li>

               <li><a href="#20170824">2017.08.24</a><li>
               <li><a href="#20170622">2017.06.22</a><li>  
	       <li><a href="#20170525">2017.05.25</a><li>
               <li><a href="#20170420">2017.04.20</a><li>
               <li><a href="#20170323">2017.03.23</a><li> 
               <li><a href="#20170223">2017.02.23</a><li>  
               <li><a href="#20170119">2017.01.19</a><li>
               <li><a href="#20161222">2016.12.22</a><li>
               <li><a href="#20161208">2016.12.08</a><li>
            
           </ul>
          </div>
          
              </div>
            </div>
           </div>

   




