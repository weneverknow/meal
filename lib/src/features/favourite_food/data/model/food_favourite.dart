import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:meal/src/features/registration/data/model/members.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import '../../../registration/domain/entities/member.dart';
import '../../domain/entity/food_favourite.dart';

part 'food_favourite.g.dart';

@UseRowClass(FoodFavourite)
class FoodFavourites extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get foodId => integer()();
  TextColumn get name => text()();
  TextColumn get category => text()();
  TextColumn get tags => text().nullable()();
  TextColumn get image => text().nullable()();
}

@DriftDatabase(tables: [FoodFavourites, Members])
class MyDatabase extends _$MyDatabase {
  MyDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
