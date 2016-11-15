window.onload = function() {
	if (navigator.geolocation) {
		console.log("Hello")
		// Get user's location
		navigator.geolocation.getCurrentPosition(function(position){
			var lat = position.coords.latitude;
			var lon = position.coords.longitude;
			showMap(lat, lon);
		});
	} else {
		document.write('Your browser does not support GeoLocation');


	}
}

// Create a LatLng object with the GPS coordinates.
function showMap(lat, lon) {
	var myLatLng = new google.maps.LatLng(lat, lon);
	var mapOptions = {
		zoom: 8,
		center: myLatLng,
		mapTypeId: google.maps.MapTypeId.ROADMAP
	};
	map = new google.maps.Map(document.getElementById('map'), mapOptions);
	var marker = new google.maps.Marker({
		position: myLatLng,
		map: map,
		title: 'My Location! FUCKKKK'
	});
}
