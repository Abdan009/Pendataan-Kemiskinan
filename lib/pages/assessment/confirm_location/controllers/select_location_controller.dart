import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../shared/shared.dart';

//Argumen: initialLocation
class SelectLocationController extends GetxController {
  var initialLocation = LatLng(-6.175441, 106.827008).obs;

  late GoogleMapController controllerMap;

  var currentLocation = Rxn<CameraPosition>();
  var customMarkers = List<Marker>.empty().obs;
  late BitmapDescriptor pinLocation;
  var fullAddressName = "".obs;
  var streetAddressName = "".obs;
  var isAddressLoading = false.obs;
  String postalCode = "";
  var searchText = "Cari Alamat".obs;

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      if (Get.arguments['initialLocation'] != null) {
        currentLocation.value =
            cameraPositionCustom(Get.arguments['initialLocation']);
      } else {
        currentLocation.value =
            cameraPositionCustom(LatLng(-6.175441, 106.827008));
      }
    } else {
      currentLocation.value =
          cameraPositionCustom(LatLng(-6.175441, 106.827008));
    }
    // setCustomMapPin();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    controllerMap.dispose();
  }

  Marker buildMarker(LatLng position) {
    return Marker(
      markerId: const MarkerId(
        "sourcePin",
      ),
      position: position,
      icon: pinLocation,
    );
  }

  CameraPosition cameraPositionCustom(LatLng target) {
    return CameraPosition(target: target, zoom: 18);
  }

  setCustomMapPin() async {
    await determinePosition();
    await searchAddress();
    await controllerMap
        .moveCamera(CameraUpdate.newCameraPosition(currentLocation.value!));

    return true;
  }

  Future<void> searchAddress() async {
    isAddressLoading.value = true;
    List<Placemark> result = await placemarkFromCoordinates(
        currentLocation.value!.target.latitude,
        currentLocation.value!.target.longitude);
    if (result.isNotEmpty) {
      String street;
      String subLocality;
      String locality;
      String administrativeArea;
      String country;

      Placemark placemark = result.first;
      // placemark.
      street = (placemark.street != null) ? placemark.street! + ", " : "";
      subLocality =
          (placemark.subLocality != null) ? placemark.subLocality! + ", " : "";
      locality =
          (placemark.subLocality != null) ? placemark.locality! + ", " : "";
      postalCode =
          (placemark.postalCode != null) ? placemark.postalCode! + ", " : "";
      country = (placemark.country != null) ? placemark.country! : "";
      administrativeArea = (placemark.administrativeArea != null)
          ? "${placemark.administrativeArea!}, "
          : "";
      streetAddressName.value = street;
      fullAddressName.value = street +
          subLocality +
          locality +
          administrativeArea +
          postalCode +
          country;
      isAddressLoading.value = false;
    } else {
      streetAddressName.value = "Tidak ditemukan";
      fullAddressName.value = "Alamat tidak ditemukan";
      isAddressLoading.value = false;
    }
    isAddressLoading.value = false;
  }

  Future<void> getMyLocation() async {
    showLoading();
    var result = await Geolocator.getCurrentPosition();
    LatLng target = LatLng(result.latitude, result.longitude);
    await changeLocation(target);
    searchText.value = "Cari alamat";
    EasyLoading.dismiss();
  }

  Future<void> changeLocation(LatLng target) async {
    controllerMap.moveCamera(
      CameraUpdate.newCameraPosition(
        cameraPositionCustom(target),
      ),
    );
    currentLocation.value = cameraPositionCustom(target);

    // customMarkers.first = customMarkers.first.copyWith(positionParam: target);
    searchAddress();
    update();
  }

  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position myCoordinateResult = await Geolocator.getCurrentPosition();

    LatLng resultLocation =
        LatLng(myCoordinateResult.latitude, myCoordinateResult.longitude);

    currentLocation.value = cameraPositionCustom(resultLocation);

    return myCoordinateResult;
  }

  void save() async {}
}
