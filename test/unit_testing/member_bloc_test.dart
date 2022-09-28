import 'package:flutter_test/flutter_test.dart';
import 'package:meal/src/features/favourite_food/data/model/food_favourite.dart';
import 'package:meal/src/features/registration/data/datasource/member_data_source.dart';
import 'package:meal/src/features/registration/data/repositories/member_repository_impl.dart';
import 'package:meal/src/features/registration/domain/usecase/insert_member.dart';
import 'package:meal/src/features/registration/domain/usecase/select_member.dart';
import 'package:meal/src/features/registration/presentation/bloc/member_bloc.dart';
import 'package:drift/native.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMemberDataSource extends Mock implements MemberDataSource {}

class MockMemberRepositoryImpl extends Mock implements MemberRepositoryImpl {}

class MockMyDatabase extends Mock implements MyDatabase {}

class MockSelectMember extends Mock implements SelectMember {}

class MockInsertMember extends Mock implements InsertMember {}

void main() {
  group('Member BLoC Test', () {
    late MemberBloc memberBloc;
    late MemberRepositoryImpl repositoryImpl;
    late MemberDataSource dataSource;
    late MyDatabase database;
    late SelectMember selectMember;
    late InsertMember insertMember;

    setUp(() {
      database = MockMyDatabase(); //MyDatabase();
      dataSource = MockMemberDataSource(); //MemberDataSourceImpl(database);
      repositoryImpl =
          MockMemberRepositoryImpl(); //MemberRepositoryImpl(dataSource);
      selectMember = MockSelectMember();
      insertMember = MockInsertMember();
      memberBloc =
          MemberBloc(selectMember: selectMember, insertMember: insertMember);
    });

    tearDown(() async {
      await database.close();
    });
    test("initial state is MemberInitial", () {
      expect(memberBloc.state, isA<MemberInitial>());
    });
  });
}
