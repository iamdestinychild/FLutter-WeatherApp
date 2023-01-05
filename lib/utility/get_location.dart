import 'dart:async';

import 'package:geolocator/geolocator.dart';





class GetGeoLocation {

  Future<Position> getPosition() async {
    await Geolocator.requestPermission();

    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
  }
  
}
