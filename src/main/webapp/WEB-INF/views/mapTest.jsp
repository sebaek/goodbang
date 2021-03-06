<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<title>Good Bang</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<!-- Optional theme -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap-theme.min.css">

<!-- JQuery -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

<style type="text/css">
html, body, #root-container {
	height: 100%;
	width: 100%;
	margin: 0;
	padding: 0;
	background-color: silver;
}

#map-container {
	height: 80%;
	position: relative;
	margin: 0;
	padding: 0;
	-webkit-perspective: 800px;
	   -moz-perspective: 800px;
	     -o-perspective: 800px;
	        perspective: 800px;
}

#flip-container {
	height: 100%;
	width: 100%;
	position: absolute;
	margin: 0;
	padding: 0;
	-webkit-transition: -webkit-transform 1s;
	   -moz-transition: -moz-transform 1s;
	     -o-transition: -o-transform 1s;
	        transition: transform 1s;
	-webkit-transform-style: preserve-3d;
	   -moz-transform-style: preserve-3d;
	     -o-transform-style: preserve-3d;
	        transform-style: preserve-3d;
	-webkit-transform-origin: right center;
	   -moz-transform-origin: right center;
	     -o-transform-origin: right center;
	        transform-origin: right center;
}

#flip-container.fliped {
      -webkit-transform: translateX( -100% ) rotateY( -180deg );
         -moz-transform: translateX( -100% ) rotateY( -180deg );
           -o-transform: translateX( -100% ) rotateY( -180deg );
              transform: translateX( -100% ) rotateY( -180deg );
}

#flip-container + div {
      height: 100%;
      width: 100%;
      position: absolute;
      margin: 0;
	  padding: 0;
      -webkit-backface-visibility: hidden;
         -moz-backface-visibility: hidden;
           -o-backface-visibility: hidden;
              backface-visibility: hidden;
}
#front-container {

}

#back-container {
      background: blue;
      -webkit-transform: rotateY( 180deg );
         -moz-transform: rotateY( 180deg );
           -o-transform: rotateY( 180deg );
              transform: rotateY( 180deg );
}

#list-container {
	height: 20%;
	background-color: lime;
}

#map-canvas {
	height: 100%;
}

.container-fluid {
	padding: 0;
}

.row {
	margin: 0;
}
</style>
<script type="text/javascript"
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC7EhkrRElzup1DjiaNZlHakWyPw7X5LuM">
	
</script>
<script type="text/javascript">
	var map;
	var myLatlng = new google.maps.LatLng(37.484910, 126.897239);

	var neighborhoods = [ new google.maps.LatLng(37.486030, 126.893921),
			new google.maps.LatLng(37.484349, 126.895444),
			new google.maps.LatLng(37.485196, 126.898244),
			new google.maps.LatLng(37.486702, 126.898952),
			new google.maps.LatLng(37.485802, 126.898952),
			new google.maps.LatLng(37.486902, 126.898952),

	];

	var markers = [];

	function initialize() {
		var mapOptions = {
			center : myLatlng,
			zoom : 16
		};
		map = new google.maps.Map(document.getElementById('map-canvas'),
				mapOptions);
		var marker = new google.maps.Marker({
			position : myLatlng,
			map : map,
			animation : google.maps.Animation.DROP,
		});
		drop();
	}

	function drop() {
		clearMarkers();
		for (var i = 0; i < neighborhoods.length; i++) {
			window.setTimeout(function() {
				addMarker(neighborhoods[--i]);
			}, i * 200);
		}
		iterator = 0;
	}

	function addMarker(position) {
		markers.push(new google.maps.Marker({
			position : position,
			map : map,
			animation : google.maps.Animation.DROP
		}));
	}

	function clearMarkers() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	google.maps.event.addDomListener(window, 'load', initialize);
</script>
</head>
<body>
	<div id="root-container">

		<div id="map-container">
			<div id="flip-container">
				<div id="front-container">
					<div id="map-canvas"></div>
				</div>
				<div id="back-container">
					<div id="input-form-container"></div>
				</div>
			</div>
		</div>
		<div id="list-container">
			<div id="inner-list-container"></div>
		</div>
	</div>
</body>
</html>
