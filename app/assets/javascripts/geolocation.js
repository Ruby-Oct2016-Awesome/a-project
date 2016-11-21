
      function calculateRoute(from, to) {
        // Center initialized to Naples, Italy
        var myOptions = {
          zoom: 10,
          center: new google.maps.LatLng(40.84, 14.25),
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        // Draw the map
        var mapObject = new google.maps.Map(document.getElementById("map"), myOptions);

        var directionsService = new google.maps.DirectionsService();
        var directionsRequest = {
          origin: from,
          destination: to,
          travelMode: google.maps.DirectionsTravelMode.DRIVING,
          unitSystem: google.maps.UnitSystem.METRIC
        };
        directionsService.route(
          directionsRequest,
          function(response, status)
          {
            if (status == google.maps.DirectionsStatus.OK)
            {
              new google.maps.DirectionsRenderer({
                map: mapObject,
                directions: response
              });
            }
            else
              $("#error").append("Unable to retrieve your route<br />");
          }
        );
      }

      $(document).ready(function() {
        // If the browser supports the Geolocation API
        if (typeof navigator.geolocation == "undefined") {
          $("#error").text("Your browser doesn't support the Geolocation API");
          return;
        }

        $("#from-link, #to-link").click(function(event) {
          event.preventDefault();
          var addressId = this.id.substring(0, this.id.indexOf("-"));

          navigator.geolocation.getCurrentPosition(function(position) {
            var geocoder = new google.maps.Geocoder();
            geocoder.geocode({
              "location": new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
            },
            function(results, status) {
              if (status == google.maps.GeocoderStatus.OK)
                $("#" + addressId).val(results[0].formatted_address);
              else
                $("#error").append("Unable to retrieve your address<br />");
            });
          },
          function(positionError){
            $("#error").append("Error: " + positionError.message + "<br />");
          },
          {
            enableHighAccuracy: true,
            timeout: 10 * 1000 // 10 seconds
          });
        });

        $("#calculate-route").submit(function(event) {
          event.preventDefault();
          calculateRoute($("#from").val(), $("#to").val());
        });
      });

var coords = {lat: "", lon: ""};
function showPosition(position)
{
   coords.lat = position.coords.latitude;
   coords.lon = position.coords.longitude;
   var location = coords.lat + ", " + coords.lon
};


var origin = "10.777730, 106.677176"
var destination = "Stockholm, Sweden";
var service = new google.maps.DistanceMatrixService();

service.getDistanceMatrix(
   {
       origins: [origin],
       destinations: [destination],
       travelMode: google.maps.TravelMode.WALKING,
       avoidHighways: false,
       avoidTolls: false
   }, 
   callback
);

function callback(response, status) {
   var orig = document.getElementById("orig"),
       dest = document.getElementById("dest"),
       dist = document.getElementById("dist");

   if(status=="OK") {
       dest.value = response.destinationAddresses[0];
       orig.value = response.originAddresses[0];
       dist.value = response.rows[0].elements[0].distance.text + " AirCredit";
   } else {
       alert("Error: " + status);
   }
}