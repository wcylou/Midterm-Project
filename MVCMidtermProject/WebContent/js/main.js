
// Initialize and add the map
	function initMap() {
	  var sd = {lat: 39.609012, lng: -104.902477};
	  var map = new google.maps.Map(
	      document.getElementById('map'), {zoom: 13, center: sd});
	  var marker = new google.maps.Marker({position: sd, map: map});
	}
	
    var statSection = $("#stats"),
    stats = $(".stat-count");

statSection.waypoint({

	handler: function(direction) {

   	if (direction === "down") {       		

			   stats.each(function () {
				   var $this = $(this);

				   $({ Counter: 0 }).animate({ Counter: $this.text() }, {
				   	duration: 4000,
				   	easing: 'swing',
				   	step: function (curValue) {
				      	$this.text(Math.ceil(curValue));
				    	}
				  	});
				});

    	} 

    	// trigger once only
    	this.destroy();      	

		},
			
		offset: "90%"
	
	});	