function init() {
  console.log('loading demo');
  map = new google.maps.Map(document.getElementById("map"), { mapTypeId: google.maps.MapTypeId.ROADMAP, center: new google.maps.LatLng(19.09, 72.91), zoom: 11 });
  //mc = new MarkerClusterer(map);
  var f_lat = 19.05;
  var f_lng = 72.82;
  var t_lat = 19.0;
  var t_lng = 72.85;
  var f_center = new google.maps.LatLng(f_lat, f_lng);
  var t_center = new google.maps.LatLng(t_lat, t_lng);
  var i = 0;
  while (i < 100) {
    markRandomTrip(f_center, t_center);
    i++;
  };

}

function markRandomTrip(f_center, t_center) {
  var offset1 = (Math.random() * 0.2);
  var offset2 = (Math.random() * 0.05);
  setTimeout(function() {
    from_center_marker = getMarker(f_center.lat() + offset1, f_center.lng() + offset2, '/images/mm_20_green.png');
    from_center_marker.setMap(map);
    to_center_marker = getMarker(t_center.lat() + offset1, t_center.lng() + offset2, '/images/mm_20_red.png');
    to_center_marker.setMap(map);
  }, 2000);
}

