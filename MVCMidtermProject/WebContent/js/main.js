
// Initialize and add the map
	function initMap() {
	  var sd = {lat: 39.609012, lng: -104.902477};
	  var map = new google.maps.Map(
	      document.getElementById('map'), {zoom: 13, center: sd});
	  var marker = new google.maps.Marker({position: sd, map: map});
	}
	
	
	$(document).ready(function(){
	  // Add smooth scrolling to all links
	  $("a").on('click', function(event) {

	    // Make sure this.hash has a value before overriding default behavior
	    if (this.hash !== "") {
	      // Prevent default anchor click behavior
	      event.preventDefault();

	      // Store hash
	      var hash = this.hash;

	      // Using jQuery's animate() method to add smooth page scroll
	      // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
	      $('html, body').animate({
	        scrollTop: $(hash).offset().top
	      }, 800, function(){
	   
	        // Add hash (#) to URL when done scrolling (default click behavior)
	        window.location.hash = hash;
	      });
	    } // End if
	  });
	});
	
	$(document).ready(function() {
		   var $rows = $('#table .searchRows');
		   $('#search').keyup(function() {
		     var val = $.trim($(this).val()).replace(/ +/g, ' ').toLowerCase().split(' ');

		     $rows.hide().filter(function() {
		       var text = $(this).text().replace(/\s+/g, ' ').toLowerCase();
		       var matchesSearch = true;
		       $(val).each(function(index, value) {
		         matchesSearch = (!matchesSearch) ? false : ~text.indexOf(value);
		       });
		       return matchesSearch;
		     }).show();
		   });
	});
	
	$(document).ready(function() {
		// Gets the video src from the data-src on each button
		var $videoSrc;  
		$('.video-btn').click(function() {
		    $videoSrc = $(this).data( "src" );
		});
		console.log($videoSrc);
		// when the modal is opened autoplay it  
		$('#myModal').on('shown.bs.modal', function (e) {
		// set the video src to autoplay and not to show related video. Youtube related video is like a box of chocolates... you never know what you're gonna get
		$("#video").attr('src',$videoSrc + "?rel=0&amp;showinfo=0&amp;modestbranding=1&amp;autoplay=1" ); 
		})
		// stop playing the youtube video when I close the modal
		$('#myModal').on('hide.bs.modal', function (e) {
		    // a poor man's stop video
		    $("#video").attr('src',$videoSrc); 
		}) 
		// document ready  
		});
