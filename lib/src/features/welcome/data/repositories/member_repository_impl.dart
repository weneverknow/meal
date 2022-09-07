import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';
import 'package:meal/src/features/welcome/data/datasource/member_data_source.dart';

class MemberRepositoryImpl {
  final MemberDataSource dataSource;
  MemberRepositoryImpl(this.dataSource);

  Future<void> insert(String member) async {
    await dataSource.insert(member);
  }

  Future<Member?> select() async {
    return await dataSource.select();
  }
}
