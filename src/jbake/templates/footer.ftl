<footer id="footer" class="col-md-12">
</footer>

    <!-- Le javascript -->
    <!-- Placed at the end of the document so the pages load faster -->

    <script src="../../../js/readthedocs-data.js"></script>
    <script src="../../../js/jquery-1.10.2.min.js"></script>
    <script src="../../../js/modernizr-custom.js"></script>
    <script type='text/javascript'>
         if (!Modernizr.matchmedia){
             $.getScript("js/media.match.min.js");
         }
    </script>
    <script src="../../../js/highlight.pack.js"></script>
    <script src="../../../js/enquire.min.js"></script>
    <script>var base_url = '../../..';</script>
    <script src="../../../js/base.js"></script>
    <script src="../../../js/bootstrap-3.0.3.min.js"></script>
    <script src="../../../js/common-1.0.min.js"></script>
    <script src="../../../js/custom.js"></script>
    

    <!-- <script src="<#if (content.rootpath)??>${content.rootpath}<#else></#if>js/prettify.js"></script>  -->

        <script language='javascript'>
        var _ag   = 0 ;         // 로그인사용자 나이
        var _id   = '';    		// 로그인사용자 아이디
        var _mr   = '';        	// 로그인사용자 결혼여부 ('single' , 'married' )
        var _gd   = '';         // 로그인사용자 성별 ('man' , 'woman')
        var _skey = '' ;        // 내부검색어

        var _jn = '' ;          //  가입탈퇴 ( 'join','withdraw' ) 
        var _jid = '' ;			// 가입시입력한 ID

        var _ud1 = '' ;			// 사용자 정의변수 1 ( 1 ~ 10 정수값)
        var _ud2 = '' ;			// 사용자 정의변수 2 ( 1 ~ 10 정수값)
        var _ud3 = '' ;			// 사용자 정의변수 3 ( 1 ~ 10 정수값)
        </script>
		
		<script language='javascript'>
		$("h2,h3").attr("id", function (arr) {
			return arr;
		});
		</script>
	
	 <script language='javascript'>
		function appendListToSubLinkNav() {

        var $parent_menu = $('ul.dropdown-menu > li.active').parent().parent();
		
        if(!$parent_menu.length) {
            $('#side_nav_right').remove();
        }
        else {
            var depth_stack = [];
            while($parent_menu.is('li')) {
                var temp = $parent_menu;
                depth_stack.push(temp);
                $parent_menu = $parent_menu.parent().parent();
            }
            var title_menu = (depth_stack.length > 1)? depth_stack[depth_stack.length-2] : depth_stack[0];
		    $('#sub-link-category-name').text(title_menu.children("a")[0].innerText);
			var subMenuList = $('li .active').parent().get(0).childNodes;
			for (var i = 0; i < subMenuList.length; i++) {
				$("#sub-link-list").append(subMenuList[i].cloneNode(true));
				$("#sub-link-nav > ul").append(subMenuList[i].cloneNode(true));
			}
		}
	}
	</script>
	
     <!-- <script language='javascript'>
            var _AceGID=(function(){var Inf=['gtp18.acecounter.com','8080','AH2A40934468137','AW','0','NaPm,Ncisy','ALL','0']; var _CI=(!_AceGID)?[]:_AceGID.val;var _N=0;var _T=new Image(0,0);if(_CI.join('.').indexOf(Inf[3])<0){ _T.src =( location.protocol=="https:"?"https://"+Inf[0]:"http://"+Inf[0]+":"+Inf[1]) +'/?cookie'; _CI.push(Inf);  _N=_CI.length; } return {o: _N,val:_CI}; })();
            var _AceCounter=(function(){var G=_AceGID;if(G.o!=0){var _A=G.val[G.o-1];var _G=( _A[0]).substr(0,_A[0].indexOf('.'));var _C=(_A[7]!='0')?(_A[2]):_A[3];	var _U=( _A[5]).replace(/\,/g,'_');var _S=((['<scr','ipt','type="text/javascr','ipt"></scr','ipt>']).join('')).replace('tt','t src="'+location.protocol+ '//cr.acecounter.com/Web/AceCounter_'+_C+'.js?gc='+_A[2]+'&py='+_A[4]+'&gd='+_G+'&gp='+_A[1]+'&up='+_U+'&rd='+(new Date().getTime())+'" t');document.writeln(_S); return _S;} })();
        </script>
	<noscript><img src='http://gtp18.acecounter.com:8080/?uid=AH2A40934468137&je=n&' border='0' width='0' alt=''></noscript> -->

  </body>
</html>
