enum GeolocationPermissionStatus {
  granted,
  whileInUse,
  denied,
  deniedForever,
  serviceDisabled,
  unknown;

  bool get isGranted {
    return this == GeolocationPermissionStatus.granted ||
        this == GeolocationPermissionStatus.whileInUse;
  }

  bool get isDenied => !isGranted;
}
