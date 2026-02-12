import '../dto/entities/package_version_entity.dart';

abstract interface class DeviceRuntimeRepository {
  Future<PackageVersionEntity> getAppVersion();

  Future<void> copyToClipboard(String text);

  Future<String?> getClipboardData();

  bool isAndroid();

  bool isIOS();

  Future<int?> getAndroidSdkInt();

  Future<String> getDeviceUuid();
}
