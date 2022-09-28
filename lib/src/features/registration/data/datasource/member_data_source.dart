import '../../../../core/config/my_db.dart';
import '../../../favourite_food/data/model/food_favourite.dart';
import '../../domain/entities/member.dart';

abstract class MemberDataSource {
  Future<void> insert(String member);
  Future<Member> select();
}

class MemberDataSourceImpl implements MemberDataSource {
  final MyDatabase database = MyDb.mydb!;
  //MemberDataSourceImpl(this.database);
  @override
  Future<void> insert(String member) async {
    final save = await database
        .into(database.members)
        .insert(MembersCompanion.insert(name: member));
    print("[MemberDataSourceImpl] insert $save");
  }

  @override
  Future<Member> select() async {
    var member =
        await database.select(database.members).getSingle(); //as m.Member;
    print("[MemberDataSourceImpl] select member $member");

    return member;
  }
}
