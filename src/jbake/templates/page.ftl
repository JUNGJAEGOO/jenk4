<#include "header.ftl">
	<#include "menu.ftl">
 
        <div class="container" style="margin-top: 100px;">
            <div class="col-md-2">
            	<div class="side_nav_left_wrapper">
		           	<div id="side_nav_left" class="side-nav">
	            		<div id="remotenav" class="bs-sidebar hidden-print affix well toc-list" role="complementary">
    <ul class="nav bs-sidenav">
    
        <li class="main active"><a href="#toast-cloud-overview">TOAST Cloud Overview</a></li>
        
    
        <li class="main "><a href="#_1">서비스 구성</a></li>
        
            <li><a href="#infrastructure-service">Infrastructure Service</a></li>
        
            <li><a href="#contents-service">Contents Service</a></li>
        
            <li><a href="#analytics-service">Analytics Service</a></li>
        
            <li><a href="#game-service">Game Service</a></li>
        
            <li><a href="#notification-service">Notification Service</a></li>
        
            <li><a href="#security-service">Security Service</a></li>
        
            <li><a href="#common-service">Common Service</a></li>
        
    
    </ul>
</div>
					</div>
				</div>
   	    	</div>
		<div class="col-md-8 content-container" role="main"> 
           
          ${content.body}

           	</div>
 			<div class="col-md-2">
 				<div id="side_nav_right" class="side-nav">
 					<div id="sub-link-nav" role="complementary">
    <b id="sub-link-category-name" class="main"></b>
    <ul class="nav">
    
    </ul>
</div>
 				</div>
 			</div>       
        </div>

<#include "footer.ftl">
