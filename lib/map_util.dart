import 'package:flutter/material.dart';
import 'package:map_view/map_view.dart';

class MapUtil {
  static var api_key = "AIzaSyBOuG9Q-whmF3PApyDtUqeQ1GMKVZKvEhA";
  var staticMapProvider;
  CameraPosition cameraPosition;
  // 13.7450002,100.532889
  var location = new Location(13.7450002, 100.532889);
  var zoomLevel = 12.0;

  init() {
    staticMapProvider = new StaticMapProvider(MapUtil.api_key);
    cameraPosition = new CameraPosition(getMyLocation(), zoomLevel);
  }

  List<Marker> getMarker() {
    List<Marker> markers = <Marker>[
     new Marker("1", "Your match", 13.7516542,100.529397, color: Colors.orange),
      // new Marker("1", "The Lalit", 30.7265995, 76.8361955, color: Colors.amber),
      // new Marker("2", "Tech mahindra", 30.7290226, 76.8339204,
          // color: Colors.red),
      // new Marker("3", "Infosys", 30.7285108, 76.8388771, color: Colors.green),
    ];

    return markers;
  }

  Uri getStaticMap() {
    return staticMapProvider.getStaticUri(getMyLocation(), zoomLevel.toInt(),
        height: 400, width: 900);
  }

  Location getMyLocation() {
    return location;
  }

  CameraPosition getCamera() {
    return cameraPosition;
  }

  showMap(MapView mapView) {
    print("show map");
    mapView.show(
        new MapOptions(
            mapViewType: MapViewType.normal,
            initialCameraPosition: getCamera(),
            showUserLocation: true,
            title: "Track your match"),
        toolbarActions: [new ToolbarAction("Close", 1


        )]

    );


    mapView.zoomToFit(padding: 100);

    mapView.onMapReady.listen((_) {
      mapView.setMarkers(getMarker());
      print("Map ready");
    });

    mapView.onLocationUpdated.listen((location) => updateLocation(location));

    mapView.onTouchAnnotation.listen((marker) => print("marker tapped"));

    mapView.onMapTapped.listen((location) => updateLocation(location));
  }

  updateLocation(Location location) {
    this.location = location;
    print("location changed $location");
  }
  updateZoomLevel(double zoomLevel) {
    this.zoomLevel = zoomLevel;
  }
}
