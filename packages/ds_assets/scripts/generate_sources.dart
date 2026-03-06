//ignore_for_file: avoid_print
import 'dart:io';

void main() {
  const assetDir = './assets';
  const packageName = 'ds_assets';
  const outputDir = 'lib';
  const srcDir = '$outputDir/src';

  final dir = Directory(assetDir);
  if (!dir.existsSync()) {
    print('❌ Error: Directory "$assetDir" not found.');
    return;
  }

  // 1. Setup Directory Structure
  Directory(srcDir).createSync(recursive: true);

  // 2. Generate const.dart
  File('$outputDir/const.dart').writeAsStringSync(
    "const packageName = '$packageName';\n",
  );

  final subDirs = dir.listSync().whereType<Directory>();
  final generatedFiles = <String>[];

  for (final subDir in subDirs) {
    final folderName = subDir.uri.pathSegments.reversed.elementAt(1);
    final className = 'DsAssets${_capitalize(folderName)}';
    final dartFileName = 'ds_assets_$folderName.dart';

    final buffer = StringBuffer();
    buffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
    buffer.writeln("import '../const.dart';\n");
    buffer.writeln('class $className {');
    buffer.writeln('  const $className._();\n');
    buffer.writeln("  static const _prefix = 'packages/\$packageName';\n");

    final seenNames = <String>{};
    final files = subDir
        .listSync(recursive: true)
        .whereType<File>()
        .where((f) => !f.path.endsWith('.DS_Store'))
        .toList();

    // Sort files alphabetically for consistent generation
    files.sort((a, b) => a.path.compareTo(b.path));

    for (final file in files) {
      final extension = file.path.split('.').last.toLowerCase();
      final originalName = file.uri.pathSegments.last.split('.').first;

      // --- PHYSICAL RENAME LOGIC ---
      final snakeName = _toSnakeCase(originalName);
      final newFileName = '$snakeName.$extension';
      final currentPath = file.path.replaceAll(r'\', '/');
      final newPath = '${file.parent.path}/$newFileName'.replaceAll(r'\', '/');

      File finalFile = file;
      if (currentPath != newPath) {
        finalFile = file.renameSync(newPath);
        print('🔄 Renamed File: ${file.uri.pathSegments.last} → $newFileName');
      }

      // --- DART VARIABLE LOGIC ---
      // Append the extension to the name before camel-casing
      final nameWithExtension = '${snakeName}_$extension';
      final variableName = _toCamelCase(nameWithExtension, seenNames);
      seenNames.add(variableName);

      final assetPath =
          finalFile.path.replaceAll(r'\', '/').split('assets/').last;
      buffer.writeln(
        "  static const String $variableName = '\$_prefix/assets/$assetPath';",
      );
    }

    buffer.writeln('}');

    File('$srcDir/$dartFileName').writeAsStringSync(buffer.toString());
    generatedFiles.add(dartFileName);
    print('📄 Generated Dart Class: $srcDir/$dartFileName');
  }

  // 3. Generate ds_assets.dart (The Barrel File)
  final barrelBuffer = StringBuffer();
  barrelBuffer.writeln('// GENERATED CODE - DO NOT MODIFY BY HAND');
  for (final file in generatedFiles) {
    barrelBuffer.writeln("export 'src/$file';");
  }

  File('$outputDir/ds_assets.dart').writeAsStringSync(barrelBuffer.toString());
  print('\n✅ Asset sync and generation complete.');
}

/// Formats string to a safe snake_case for physical files
String _toSnakeCase(String input) {
  return input
      .replaceAll(RegExp('[^a-zA-Z0-9]'), '_')
      .replaceAllMapped(
        RegExp('([a-z0-9])([A-Z])'),
        (Match m) => '${m[1]}_${m[2]}',
      )
      .toLowerCase()
      .replaceAll(RegExp('_+'), '_')
      .replaceAll(RegExp(r'^_+|_+$'), '');
}

/// Formats string to valid camelCase and ensures it's a safe Dart identifier
String _toCamelCase(String input, Set<String> existingNames) {
  final sanitized = input.replaceAll(RegExp('[^a-zA-Z0-9_]'), '');
  final parts = sanitized.split('_').where((e) => e.isNotEmpty).toList();

  if (parts.isEmpty) return 'unnamedAsset';

  var camel = parts.first.toLowerCase() +
      parts.skip(1).map((s) => _capitalize(s.toLowerCase())).join('');

  if (RegExp(r'^\d').hasMatch(camel)) {
    camel = 'asset$camel';
  }

  var name = camel;
  var counter = 1;
  while (existingNames.contains(name)) {
    name = '$camel$counter';
    counter++;
  }
  return name;
}

String _capitalize(String s) =>
    s.isEmpty ? '' : s[0].toUpperCase() + s.substring(1);
