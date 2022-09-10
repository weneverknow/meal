import 'package:flutter_test/flutter_test.dart';
import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';
import 'package:meal/src/features/welcome/data/datasource/member_data_source.dart';
import 'package:meal/src/features/welcome/data/repositories/member_repository_impl.dart';
import 'package:meal/src/features/welcome/presentation/bloc/member_bloc.dart';
import 'package:drift/native.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMemberDataSource extends Mock implements MemberDataSource {}

class MockMemberRepositoryImpl extends Mock implements MemberRepositoryImpl {}

class MockMyDatabase extends Mock implements MyDatabase {}

void main() {
  group('Member BLoC Test', () {
    late MemberBloc memberBloc;
    late MemberRepositoryImpl repositoryImpl;
    late MemberDataSource dataSource;
    late MyDatabase database;

    setUp(() {
      database = MockMyDatabase(); //MyDatabase();
      dataSource = MockMemberDataSource(); //MemberDataSourceImpl(database);
      repositoryImpl =
          MockMemberRepositoryImpl(); //MemberRepositoryImpl(dataSource);
      memberBloc = MemberBloc(repositoryImpl: repositoryImpl);
    });

    tearDown(() async {
      await database.close();
    });
    test("initial state is MemberInitial", () {
      expect(memberBloc.state, isA<MemberInitial>());
    });
  });
}
