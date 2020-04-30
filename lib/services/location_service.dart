import 'package:location/location.dart';
import '../models/user_location.dart';
import 'dart:async';

class LocationService {
  UserLocation _currentLocation;
  Location location = Location();

  StreamController<UserLocation> _locationController =
      StreamController<UserLocation>.broadcast();
  LocationService() {
    location.requestPermission().then((granted) {
      if (granted == PermissionStatus.granted) {
        location.onLocationChanged.listen((locationData) {
          if (locationData != null) {
            _locationController.add(UserLocation(
              locationData.latitude,
              locationData.longitude,
            ));
          }
        });
      }
    });
  }

  Stream<UserLocation> get locationStream => _locationController.stream;

  Future<UserLocation> getLocation() async {
    try {
      var userLocation = await location.getLocation();
      _currentLocation =
          UserLocation(userLocation.latitude, userLocation.longitude);
    } catch (e) {
      print('Could not get the location: $e');
    }

    return _currentLocation;
  }
}
