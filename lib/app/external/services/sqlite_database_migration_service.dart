import '../../domain/providers/migration_connection.dart';
import '../../domain/services/migration.dart';
import '../../domain/services/migration_service.dart';
import '../migrations/create_leads_table.dart';
import '../migrations/create_migrations_table.dart';

class SqliteDatabaseMigrationService implements MigrationService {
  SqliteDatabaseMigrationService({required this.connection});

  final MigrationConnection connection;

  @override
  List<Migration> getMigrations() {
    return [
      CreateMigrationTable(connection: connection),
      CreateLeadsTable(connection: connection),
    ];
  }

  /// Not implemented due to time constraints
  @override
  Future<void> down() async {
    // for (final migration in getMigrations()) {
    //   if (await migration.hasMigrationBeenRun()) {
    //     continue;
    //   }
    //
    //   print('Running ${migration.runtimeType}');
    //   await migration.down();
    //   await migration.markMigrationAsRun();
    //   print('Finished ${migration.runtimeType}');
    // }
  }

  @override
  Future<void> up() async {
    print('Running migrations...');

    for (final migration in getMigrations()) {
      if (await migration.hasMigrationBeenRun()) {
        continue;
      }

      print('Running ${migration.runtimeType}');
      await migration.up();
      await migration.markMigrationAsRun();
      print('Finished ${migration.runtimeType}');
    }
  }
}
