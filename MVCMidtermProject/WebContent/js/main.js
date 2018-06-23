
// Initialize and add the map
	function initMap() {
	  var sd = {lat: 39.609012, lng: -104.902477};
	  var map = new google.maps.Map(
	      document.getElementById('map'), {zoom: 13, center: sd});
	  var marker = new google.maps.Marker({position: sd, map: map});
	}
