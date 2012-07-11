// requests JSON information for all the bus stops in the given viewport from the server
// viewport is a google.maps.Bounds() object
function loadBusStops(viewport) {
  y2 = viewport.getNorthEast().lat();
  x2 = viewport.getNorthEast().lng();
  y1 = viewport.getSouthWest().lat();
  x1 = viewport.getSouthWest().lng();
  $.get('/bus_stops.json?x1=' + x1 + '&y1=' + y1 + '&x2=' + x2 + '&y2=' + y2, function(data) {
    $.each(data, function() {
      marker = getMarker(parseFloat(this.lat), parseFloat(this.lng), '/images/mm_20_green.png', this.name);
      marker.setMap(map);
    });

  });
}


function getMarker(lat, lng, icon, infoWindowText) {
  m = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    icon: icon
  });
  if (infoWindowText) {
    addInfoWindow(m, infoWindowText);
  }
  return m;
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
