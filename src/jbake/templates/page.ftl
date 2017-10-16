<#include "header.ftl">
<#include "menu.ftl">
        <div class="container" style="margin-top: 100px;">
            <div class="col-md-2">
            	<div class="side_nav_left_wrapper">
	           	<div id="side_nav_left" class="side-nav">
	            		<div id="remotenav" class="bs-sidebar hidden-print affix well toc-list" role="complementary"> 
					<ul class="nav bs-sidenav">
						
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
