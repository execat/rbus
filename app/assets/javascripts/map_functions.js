// requests JSON information for all the bus stops in the given viewport from the server
// viewport is a google.maps.Bounds() object
function loadBusStops(viewport, callback) {
  y2 = viewport.getNorthEast().lat();
  x2 = viewport.getNorthEast().lng();
  y1 = viewport.getSouthWest().lat();
  x1 = viewport.getSouthWest().lng();
  $.get('/bus_stops.json?x1=' + x1 + '&y1=' + y1 + '&x2=' + x2 + '&y2=' + y2, markBusStops);
}

function markBusStops(data)
{
  $.each(data, function() {
    setBusStopMarker(this);
    console.log(this);
  });
}


function setBusStopMarker(data) {
  marker = getMarker(parseFloat(data.lat), parseFloat(data.lng), '/images/mm_20_green.png', false);
  infoWindow = addInfoWindow(marker, "<div id='" + data.id + "' class='bs'><div>" + data.name + "</div></div>");
  google.maps.event.addListener(infoWindow,'domready', function() {
    addFromToLinks($('#' + data.id), data.id, data.name);
  });
}

function getMarker(lat, lng, icon, infoWindowText) {
  m = new google.maps.Marker({
    position: new google.maps.LatLng(lat, lng),
    icon: icon,
    map: map
  });
  if (infoWindowText) {
    addInfoWindow(m, infoWindowText);
  }
  return m;
}

function fromHere(id, name) {
  $('#from').attr('value', name);
  $('#intended_trip_from_stop_id').attr('value',id);
}

function toHere(id, name) {
  $('#to').attr('value', name);
  $('#intended_trip_to_stop_id').attr('value',id);
}


function addFromToLinks(element, id, name) {
  fromLink = $('<a href="#">from here</a>');
  fromLink.click(function() {
		   fromHere(id,name);
		   infoWindowClose();
		 });
  fromLink.addClass('green');
  element.append(fromLink);
  element.append("&nbsp;").show();
  toLink = $('<a href="#">to here</a>');
  toLink.click(function() {
		   toHere(id,name);
		   infoWindowClose();
		 });
  toLink.addClass('red');
  element.append(toLink);


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
  return infoWindow;
}
