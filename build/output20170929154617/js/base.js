(function() {
	appendListToSubLinkNav();
	
	$(".dropdown-submenu > a").click(function(){
		  $(location).attr('href', $(this).next().children()[0].children[0].href);
		  return false;
	});
    
    if($(document).width() < 1320) {
    	$(".container > div")[0].className = "col-md-3";
		$(".container > div")[1].className = "col-md-9 content-container";
    }

	$('#list-up').click(function() {
	혻 $("#sub-link-list").slideToggle();
	});
	
	/* Toggle the `clicky` class on the body when clicking links to let us
	   retrigger CSS animations. See ../css/base.css for more details. */
	$('a').click(function(e) {
	    $('body').toggleClass('clicky');
	});

	/* Prevent disabled links from causing a page reload */
	$("li.disabled a, .nav a[href='#']").click(function() {
	    event.preventDefault();
	});

	enquire.register("screen and (min-width: 1320px)", {
		match: function() {
			$(".container > div")[0].className = "col-md-2";
			$(".container > div")[1].className = "col-md-8 content-container";
		},

		unmatch: function() {
			$(".container > div")[0].className = "col-md-3";
			$(".container > div")[1].className = "col-md-9 content-container";
		}
	});

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
})();

/* Search */

function getSearchTerm() {
    var sPageURL = window.location.search.substring(1);
    var sURLVariables = sPageURL.split('&');
    for (var i = 0; i < sURLVariables.length; i++)
    {
        var sParameterName = sURLVariables[i].split('=');
        if (sParameterName[0] == 'q') {
            return sParameterName[1];
        }
    }
}

function navScrollLimiter(nav) {
  if ($(window).height() < nav.height() + $("#footer").height() + 100) {
    if ($(document).height() < $(window).scrollTop() + $(window).height() + $("#footer").height()) {
      nav.css("top", "inherit");
      nav.stop().animate({
    	bottom: ($(window).scrollTop() + $(window).height() + $("#footer").height() - $(document).height()) + "px"
      }, 500, function(){});
    } else {
      nav.stop().animate({
        top: "100px"
      }, 500, function(){
    	  nav.css("bottom", "inherit");
      });
    }
  }
}


$(window).scroll(function() {
	navScrollLimiter($("#side_nav_left"));
	navScrollLimiter($("#side_nav_right"));
});

$(document).ready(function() {
    var search_term = getSearchTerm(),
        $search_modal = $('#mkdocs_search_modal');

    if(search_term) {
        $search_modal.modal();
    }

    $search_modal.on('shown.bs.modal', function () {
        $search_modal.find('#mkdocs-search-query').focus();
    });
    
    hljs.initHighlightingOnLoad();
});

$(window).load(function() {
  $('body').scrollspy({
      target: '.toc-list',
  });
});