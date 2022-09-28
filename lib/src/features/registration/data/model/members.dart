import 'package:drift/drift.dart';
import '../../domain/entities/member.dart';

@UseRowClass(Member)
class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
