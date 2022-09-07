import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';

abstract class MemberDataSource {
  Future<void> insert(String member);
  Future<Member?> select();
}

class MemberDataSourceImpl implements MemberDataSource {
  final MyDatabase database;
  MemberDataSourceImpl(this.database);
  @override
  Future<void> insert(String member) async {
    final save = await database
        .into(database.members)
        .insert(MembersCompanion.insert(name: member));
    print("[MemberDataSourceImpl] insert $save");
  }

  @override
  Future<Member?> select() async {
    Member? member = await database.select(database.members).getSingleOrNull();
    print("[MemberDataSourceImpl] select member $member");
    return member;
  }
}
