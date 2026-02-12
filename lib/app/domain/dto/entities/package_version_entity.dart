class PackageVersionEntity implements Comparable<PackageVersionEntity> {
  const PackageVersionEntity({
    required this.major,
    required this.minor,
    required this.patch,
  });

  factory PackageVersionEntity.fromString(String version) {
    final match = RegExp(r'^(\d+)\.(\d+)\.(\d+)').firstMatch(version);
    if (match == null) {
      throw FormatException(
        'Invalid version format, expected "major.minor.patch": $version',
      );
    }
    return PackageVersionEntity(
      major: int.parse(match.group(1)!),
      minor: int.parse(match.group(2)!),
      patch: int.parse(match.group(3)!),
    );
  }

  final int major;
  final int minor;
  final int patch;

  @override
  int compareTo(PackageVersionEntity other) {
    if (major != other.major) return major.compareTo(other.major);
    if (minor != other.minor) return minor.compareTo(other.minor);
    return patch.compareTo(other.patch);
  }

  bool operator >(PackageVersionEntity other) => compareTo(other) > 0;

  bool operator <(PackageVersionEntity other) => compareTo(other) < 0;

  bool operator >=(PackageVersionEntity other) => compareTo(other) >= 0;

  bool operator <=(PackageVersionEntity other) => compareTo(other) <= 0;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is PackageVersionEntity &&
            major == other.major &&
            minor == other.minor &&
            patch == other.patch;
  }

  @override
  int get hashCode => Object.hash(major, minor, patch);

  @override
  String toString() => '$major.$minor.$patch';
}
