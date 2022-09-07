import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

//part 'member.g.dart';

@DataClassName('Member')
class Members extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
