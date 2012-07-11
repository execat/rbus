function loadBusStops(viewport) {
  y2 = viewport.getNorthEast().lat();
  x2 = viewport.getNorthEast().lng();
  y1 = viewport.getSouthWest().lat();
  x1 = viewport.getSouthWest().lng();
  $.get('/bus_stops.json?x1=' + x1 + '&y1=' + y1 + '&x2=' + x2 + '&y2=' + y2, function(data) {
    $.each(data, function() {
      marker = new google.maps.Marker({
        map: map,
	position: new google.maps.LatLng(parseFloat(this.lat), parseFloat(this.lng)),
	icon: '/images/mm_20_green.png'
      });
      addInfoWindow(marker, this.name);
    });

  });
}


function addInfoWindow(marker, message) {
  var info = message;
  var infoWindow = new google.maps.InfoWindow({
    content: message
  });

  google.maps.event.addListener(marker, 'click', function () {
    infoWindow.close();
    infoWindow.open(map, marker);
  });
}
