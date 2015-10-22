(function($) {
	"use strict";
/****************************************************************************************************
GLOBAL SCRIPTS
****************************************************************************************************/
	// PRELOADER
	$(window).load(function(){
		$('#preloader').delay(700).fadeOut(200);
		$('#wrapper_main').delay(700).fadeIn(200);
	});



/****************************************************************************************************
MAIN PAGE
****************************************************************************************************/
	if ($("body").attr("class") == "page_index") {

		// MAIN SLIDER
		$('#slider_main').flexslider({
			animation: "fade",
			pauseOnAction: false,
			pauseOnHover: true,
			controlNav: false,
			directionNav: true,
			prevText: "",
			nextText: ""
		});
		$("#slider_main .flex-direction-nav").wrap("<div class='slider_main_nav'></div>").addClass("container");



		$(window).load(function() {
			// SERVICES LOGOS
			jQuery('.services_logo a').BlackAndWhite({
				hoverEffect : true,
				webworkerPath : false,
				responsive:true,
				invertHoverEffect: false,
				intensity:1,
				speed: {
					fadeIn: 300,
					fadeOut: 300
				}
			});



			// PARALLAX BACKGROUND
			if (device.desktop() && $(window).width() >= 991) {
				$('.parallax_box').parallax("50%", -0.4);
			};

			var platform = navigator.platform.toLowerCase();
			if (platform.indexOf('win') == 0 || platform.indexOf('linux') == 0) {
				if ($.browser.webkit) {

					/* jquery.simplr.smoothscroll - https://github.com/simov/simplr-smoothscroll */
					;(function(e){"use strict";e.srSmoothscroll=function(t){var n=e.extend({step:85,speed:600,ease:"linear"},t||{});var r=e(window),i=e(document),s=0,o=n.step,u=n.speed,a=r.height(),f=navigator.userAgent.indexOf("AppleWebKit")!==-1?e("body"):e("html"),l=false;e("body").mousewheel(function(e,t){l=true;if(t<0)s=s+a>=i.height()?s:s+=o;else s=s<=0?0:s-=o;f.stop().animate({scrollTop:s},u,n.ease,function(){l=false});return false});r.on("resize",function(e){a=r.height()}).on("scroll",function(e){if(!l)s=r.scrollTop()})}})(jQuery);

					/* jquery.mousewheel - https://github.com/jquery/jquery-mousewheel */
					!function(a){"function"==typeof define&&define.amd?define(["jquery"],a):"object"==typeof exports?module.exports=a:a(jQuery)}(function(a){function b(b){var g=b||window.event,h=i.call(arguments,1),j=0,l=0,m=0,n=0,o=0,p=0;if(b=a.event.fix(g),b.type="mousewheel","detail"in g&&(m=-1*g.detail),"wheelDelta"in g&&(m=g.wheelDelta),"wheelDeltaY"in g&&(m=g.wheelDeltaY),"wheelDeltaX"in g&&(l=-1*g.wheelDeltaX),"axis"in g&&g.axis===g.HORIZONTAL_AXIS&&(l=-1*m,m=0),j=0===m?l:m,"deltaY"in g&&(m=-1*g.deltaY,j=m),"deltaX"in g&&(l=g.deltaX,0===m&&(j=-1*l)),0!==m||0!==l){if(1===g.deltaMode){var q=a.data(this,"mousewheel-line-height");j*=q,m*=q,l*=q}else if(2===g.deltaMode){var r=a.data(this,"mousewheel-page-height");j*=r,m*=r,l*=r}if(n=Math.max(Math.abs(m),Math.abs(l)),(!f||f>n)&&(f=n,d(g,n)&&(f/=40)),d(g,n)&&(j/=40,l/=40,m/=40),j=Math[j>=1?"floor":"ceil"](j/f),l=Math[l>=1?"floor":"ceil"](l/f),m=Math[m>=1?"floor":"ceil"](m/f),k.settings.normalizeOffset&&this.getBoundingClientRect){var s=this.getBoundingClientRect();o=b.clientX-s.left,p=b.clientY-s.top}return b.deltaX=l,b.deltaY=m,b.deltaFactor=f,b.offsetX=o,b.offsetY=p,b.deltaMode=0,h.unshift(b,j,l,m),e&&clearTimeout(e),e=setTimeout(c,200),(a.event.dispatch||a.event.handle).apply(this,h)}}function c(){f=null}function d(a,b){return k.settings.adjustOldDeltas&&"mousewheel"===a.type&&b%120===0}var e,f,g=["wheel","mousewheel","DOMMouseScroll","MozMousePixelScroll"],h="onwheel"in document||document.documentMode>=9?["wheel"]:["mousewheel","DomMouseScroll","MozMousePixelScroll"],i=Array.prototype.slice;if(a.event.fixHooks)for(var j=g.length;j;)a.event.fixHooks[g[--j]]=a.event.mouseHooks;var k=a.event.special.mousewheel={version:"3.1.12",setup:function(){if(this.addEventListener)for(var c=h.length;c;)this.addEventListener(h[--c],b,!1);else this.onmousewheel=b;a.data(this,"mousewheel-line-height",k.getLineHeight(this)),a.data(this,"mousewheel-page-height",k.getPageHeight(this))},teardown:function(){if(this.removeEventListener)for(var c=h.length;c;)this.removeEventListener(h[--c],b,!1);else this.onmousewheel=null;a.removeData(this,"mousewheel-line-height"),a.removeData(this,"mousewheel-page-height")},getLineHeight:function(b){var c=a(b),d=c["offsetParent"in a.fn?"offsetParent":"parent"]();return d.length||(d=a("body")),parseInt(d.css("fontSize"),10)||parseInt(c.css("fontSize"),10)||16},getPageHeight:function(b){return a(b).height()},settings:{adjustOldDeltas:!0,normalizeOffset:!0}};a.fn.extend({mousewheel:function(a){return a?this.bind("mousewheel",a):this.trigger("mousewheel")},unmousewheel:function(a){return this.unbind("mousewheel",a)}})});

					$.srSmoothscroll({
						step: 55,
						speed: 100,
						ease: 'swing'
					});
				}
			};
		});


		// SCROLL ANIMATIONS
		$("h2").addClass("wow fadeInDown");

		$(".services_item:eq(0)").addClass("wow fadeInLeft").attr('data-wow-delay', '.2s');
		$(".services_item:eq(1)").addClass("wow fadeInDown").attr('data-wow-delay', '');
		$(".services_item:eq(2)").addClass("wow fadeInRight").attr('data-wow-delay', '.3s');
		$(".services_item:eq(3)").addClass("wow fadeInLeft").attr('data-wow-delay', '.4s');
		$(".services_item:eq(4)").addClass("wow fadeInUp").attr('data-wow-delay', '.1ss');
		$(".services_item:eq(5)").addClass("wow fadeInRight").attr('data-wow-delay', '.5s');

		$(".services_logo:eq(0)").addClass("wow fadeInUp").attr('data-wow-delay', '.2s');
		$(".services_logo:eq(1)").addClass("wow fadeInUp").attr('data-wow-delay', '.4s');
		$(".services_logo:eq(2)").addClass("wow fadeInUp").attr('data-wow-delay', '.6s');
		$(".services_logo:eq(3)").addClass("wow fadeInUp").attr('data-wow-delay', '.8s');

		

		$(".item_content").each(function(i) {
			$(".item_content:eq("+i+")").addClass("wow flipInX item-"+i).attr('data-wow-delay', '.'+i+'s');
		});

		$(".social_links li:eq(0)").addClass("wow fadeIn");
		$(".social_links li:eq(1)").addClass("wow fadeIn").attr('data-wow-delay', '.1s');
		$(".social_links li:eq(2)").addClass("wow fadeIn").attr('data-wow-delay', '.2s');
		$(".social_links li:eq(3)").addClass("wow fadeIn").attr('data-wow-delay', '.3s');
		$(".social_links li:eq(4)").addClass("wow fadeIn").attr('data-wow-delay', '.4s');
		$(".back_top").addClass("wow fadeIn").attr('data-wow-delay', '.5s');

		$(window).load(function(){
			if (device.desktop() && $(window).width() >= 1200) {
				new WOW().init();
			};
		});

	};



/****************************************************************************************************
MAIN MENU
****************************************************************************************************/
	// STICK TO TOP
	menuStick();
	$(document).on('scroll', function() {
		menuStick();
	});

	function menuStick() {
		if ($(window).scrollTop() > $("#header").height()){
			$("#header").addClass("stuck").removeClass("normal");
		}
		else {
			$("#header").removeClass("stuck").addClass("normal");
		};
	};

	$(window).load(function(){
		if (!(device.mobile())) {
			menu_main();

			$(window).resize(function() {
				$('.icon_menu, #menu_main li').unbind("click");
				menu_main();
			});
		}
		else {
			menu_mobile();
		};
	});

	function menu_main() {
		if ($(window).width() <= 991){
			menu_mobile();
		}
		else {
			$('.icon_menu, #menu_main li').off();
			$('#menu_main').stop().removeAttr('style');
		};
	};

	function menu_mobile() {
		$('#menu_main').hide();
		$('.icon_menu, #menu_main li').on('click', function(){
			$('#menu_main').slideToggle(300);
			$('.icon_menu').toggleClass('active');
		});
	};



	// MOBILE BACK TO TOP
	backTopMobile()

	$(window).scroll(backTopMobile).resize(backTopMobile);

	function backTopMobile() {
		if ($(window).width() >= 991){
			$(".back_top_mobile").hide();
		}
		else {
			if ($(window).scrollTop() < $("#header").height()){
				$(".back_top_mobile").fadeOut();
			}
			else {
				$(".back_top_mobile").fadeIn();
			};
		};
	};

	$(".back_top_mobile").click(function() {
		$("html, body").animate({ scrollTop: 0 }, 500, "swing");
		return false;
		$(".back_top_mobile").fadeOut();
	});



	// MENU ITEM CHANGE
	var itemClick = false;
	var itemsArray = [];

	$("#menu_main a").each(function(index){
		itemsArray[index]=$(this).attr("href");
	});

	itemChange();

	$(document).on('scroll', function(){
		itemChange();
	});

	function itemChange(){
		if(!itemClick){
			$("#menu_main .active").removeClass("active");
			for(var i=0, lenghthArray = itemsArray.length; i<lenghthArray; i++){
				if (
					($(window).scrollTop() - $(itemsArray[i]).offset().top) < $(itemsArray[i]).outerHeight() && 
					$(window).scrollTop() >= $(itemsArray[i]).offset().top
				) {
					$("a[href="+itemsArray[i]+"]").parent("li").addClass("active");
				};
			};
		};
	};



	$('#menu_main a').on('click', function(event){
		itemClick = true;
		$('#menu_main').find('li').removeClass('active');
		$(this).parent().addClass("active");
		$(window).scrollTo($(this).attr("href"), 800, function(){
			itemClick = false;
			itemChange();
		});
		event.preventDefault();
	});



	// BACK TO TOP BUTTONS
	$(document).on('ready', function(){
		var scrollTopTime = $(document).height()/4;
		$(".back_top").click(function() {
			$("html, body").animate({ scrollTop: 0 }, scrollTopTime, "swing");
			return false;
		});
	});



})(jQuery);