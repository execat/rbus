// given a start_bounds and an end_bounds
// requests JSON information for all the trips that start in start_bounds and end in end_bounds
// viewport is a google.maps.Bounds() object

var overLays = new Array();
var trips = new Array();

function loadTrips(map1, map2) {
  $.each(overLays, function() {
	   this.setMap(null);
	 });
  start_bounds = map1.getBounds();
  end_bounds = map2.getBounds();
  flat2 = start_bounds.getNorthEast().lat();
  flng2 = start_bounds.getNorthEast().lng();
  flat1 = start_bounds.getSouthWest().lat();
  flng1 = start_bounds.getSouthWest().lng();

  tlat2 = end_bounds.getNorthEast().lat();
  tlng2 = end_bounds.getNorthEast().lng();
  tlat1 = end_bounds.getSouthWest().lat();
  tlng1 = end_bounds.getSouthWest().lng();


  $.get('/intended_trips.json?from[lat1]=' + flat1 + '&from[lng1]=' + flng1 +
                            '&from[lat2]=' + flat2 + '&from[lng2]=' + flng2 +
			    '&to[lat1]='  + tlat1 + '&to[lng1]=' + tlng1 +
	'&to[lat2]=' + tlat2 + '&to[lng2]=' + tlng2, function(data) {markTrips(data, map1, map2)});
}


function markTrips(data, map1, map2) {
  trips = new Array();
  $.each(data, function() {
    f = getTripMarker(this.intended_trip.from_stop, "start");
    f.setMap(map1);
    t = getTripMarker(this.intended_trip.to_stop, "end");
    t.setMap(map2);
    overLays.push(f);
    overLays.push(t);
    trips.push(this.intended_trip);
  });
  $.each($('.tripcount'), function(){$(this).text(trips.length);});
}

function getTripMarker(data, which) {
  icon = (which == "start") ? '/images/mm_20_green.png' : '/images/mm_20_red.png';
  marker = getMarker(parseFloat(data.lat), parseFloat(data.lng), icon, false);
  infoWindow = addInfoWindow(marker, "<div id='" + data.id + "' class='bs'><div>" + data.name + "</div></div>");
  return marker
}

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
  });
}


function setBusStopMarker(data) {
  marker = getMarker(parseFloat(data.lat), parseFloat(data.lng), '/images/mm_20_green.png', false, map);
  marker.setMap(map);
  infoWindow = addInfoWindow(marker, "<div id='" + data.id + "' class='bs'><div>" + data.name + "</div></div>");
  google.maps.event.addListener(infoWindow,'domready', function() {
    addFromToLinks($('#' + data.id), data.id, data.name);
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

