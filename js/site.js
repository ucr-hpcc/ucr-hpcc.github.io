/* -------------------------- Custom site JS -------------------------------*/

$(function(){
  // hover dropdown open animation
  $('.nav-item')
    .hover(function(){
      $(this).children('.dropdown-menu').stop().slideDown(250);
    })
    .on('mouseleave', function(){
      $(this).children('.dropdown-menu').stop().slideUp(250);
    });

  // toc and sidebar
  var mainSize = 8;
  $('#sidebarSwitch').click(function(){
    if ($(this).is(':checked')){
      mainSize -= 2;
      $('.td-main .td-sidebar').show();
    } else {
      mainSize += 2;
      $('.td-main .td-sidebar').hide();
    }
    $('body main').attr('class', `col-12 col-md-9 col-xl-${mainSize} pl-md-5`);
  });

  $('#tocSwitch').click(function(){
    if ($(this).is(':checked')){
      mainSize -= 2;
      $('.td-main .td-toc').attr('style','display:block !important');
    } else {
      mainSize += 2;
      $('.td-main .td-toc').attr('style','display:none !important');
    }
    $('body main').attr('class', `col-12 col-md-9 col-xl-${mainSize} pl-md-5`);
  });


});

// insert pagesource button
$(function(){
  if ($('.td-page-meta').get(0)) {
    var sourceLink = $('.td-page-meta a.source-link');
    if ($(".reading-time").get(0)) $(".reading-time").after(sourceLink.clone());
    else $(".td-content h1:first-of-type").after(sourceLink.clone());
    }
});

// highlight toc
$(() => {

	const observer = new IntersectionObserver(entries => {
		entries.forEach(entry => {
			const id = entry.target.getAttribute('id');
			if (entry.intersectionRatio > 0) {
				$(`nav li a[href="#${id}"]`).parent().addClass('active').trigger('toc-active');
			} else {
				$(`nav li a[href="#${id}"]`).parent().removeClass('active');
			}
		});
	});

	// Track all sections that have an `id` applied
	document.querySelectorAll('.td-content *[id]').forEach((section) => {
		observer.observe(section);
	});

  var pageMetaHeight = $('.td-page-meta').height() + 40;
  $('#TableOfContents ul li').on('toc-active', function(){
    if (this.offsetTop < window.innerHeight/2) return $(".td-toc").scrollTop(0);
    $(".td-toc").scrollTop(this.offsetTop - window.innerHeight/2 - 20);
  });
});

// soft hiding content
function hideContent(visDate){
  var visTime = Date.parse(visDate);
  // get world clock time
  var currentTime;
  $.ajax({
        url: "https://worldtimeapi.org/api/timezone/Etc/UTC",
        type: 'GET',
        dataType: 'json',
        async: false
    })
    .done(function(res) {
          currentTime = Date.parse(res.datetime)
    })
    .fail(function() {
          currentTime = new Date();
    });

  if(visTime > currentTime) {
    $('.td-toc').remove();
    $('[role="main"]').css("display", "none")
    $(()=>{$('[role="main"]').remove()});
    $('.td-main .row.flex-xl-nowrap').append(
      `
      <div class="col-12 col-md-9 col-xl-10 pl-md-5" style="margin-top: 50vh">
        <h1 class="center-text"> Content not visible before ${visDate}</h1>
      </div>
      `
    );
  }

}

// add target blank
$(()=>{
  $('.td-content a:contains("{t_blank}")').each(function(){
    $(this)
      .text($(this).text().replace("{t_blank}", ""))
      .attr("target", "_blank");
  });
});
