
			
			
			
<#if content.parent??>

<#if config['side_menu_'+content.parent]?? >

<#list config['side_menu_'+content.parent] as x>


<#if x_index == 0>
<li class="main active"><a href="#${config['side_menu_'+content.parent][x_index]}"></a>${config['side_menu_'+content.parent][x_index]}</li>
<#else>
<li class="main"><a href="#${config['side_menu_'+content.parent][x_index]}"></a>${config['side_menu_'+content.parent][x_index]}</li>
</#if>
	
	<#if config['side_menu_child_'+config['side_menu_'+content.parent][x_index]]??>
	
		<#if config['side_menu_child_'+config['side_menu_'+content.parent][x_index]]?is_string>
		
		<li><a href="#${config['side_menu_child_'+config['side_menu_'+content.parent][x_index]]}">${config['side_menu_child_'+config['side_menu_'+content.parent][x_index]]}</a></li>
		
		<#else>
		<#list config['side_menu_child_'+config['side_menu_'+content.parent][x_index]] as z>
		
		<li><a href="#${z}">${z}</a></li>
		</#list>
		</#if>
	</#if>


</#list>


</#if>

</#if>


