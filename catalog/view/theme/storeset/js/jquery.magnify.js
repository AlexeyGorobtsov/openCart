!function(a){a.fn.magnify=function(b){var d,e,f,g,c=a.extend({debug:!1,speed:100,onload:function(){}},b),h=0,i=0,j=function(b){f=a(b),d=f.parents("a"),k(f.attr("data-magnify-src")||c.src||d.attr("href")||"")},k=function(b,j){if(b){var l=new Image;a(l).on({load:function(){f.css("display","block"),f.parent(".magnify").length||f.wrap('<div class="magnify"></div>'),e=f.parent(".magnify"),f.prev(".magnify-lens").length?e.children(".magnify-lens").css("background-image","url("+b+")"):f.before('<div class="magnify-lens loading" style="background:url('+b+') no-repeat 0 0"></div>'),g=e.children(".magnify-lens"),g.removeClass("loading"),h=l.width,i=l.height,c.debug&&console.log("[MAGNIFY] Got zoom image dimensions OK (width x height): "+h+" x "+i),l=null,c.onload(),e.mousemove(function(a){var b=e.offset(),d=a.pageX-b.left;if(nY=a.pageY-b.top,d<e.width()&&nY<e.height()&&d>0&&nY>0?g.fadeIn(c.speed):g.fadeOut(c.speed),g.is(":visible")){var j=d-g.width()/2,k=nY-g.height()/2;if(h&&i)var l=Math.round(d/f.width()*h-g.width()/2)*-1,m=Math.round(nY/f.height()*i-g.height()/2)*-1,n=l+"px "+m+"px";g.css({top:Math.round(k)+"px",left:Math.round(j)+"px",backgroundPosition:n||""})}}),d.length&&(d.css("display","inline-block"),(j||d.attr("href")&&!f.attr("data-magnify-src")&&!c.src)&&d.click(function(a){a.preventDefault()}))},error:function(){l=null,j?c.debug&&console.log("[MAGNIFY] Parent anchor zoom source is invalid also. Disabling zoom..."):(c.debug&&console.log("[MAGNIFY] Invalid data-magnify-src. Looking in parent anchor instead -> "+d.attr("href")),k(d.attr("href"),!0))}}),l.src=b}};return this.each(function(){j(this)})}}(jQuery);