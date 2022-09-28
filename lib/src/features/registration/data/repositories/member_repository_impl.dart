import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/features/registration/data/datasource/member_data_source.dart';
import 'package:meal/src/features/registration/domain/repositories/welcome_repository.dart';

import '../../domain/entities/member.dart';

class MemberRepositoryImpl implements WelcomeRepository {
  final MemberDataSource dataSource;
  MemberRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, void>> insert(String name) async {
    try {
      return Right(await dataSource.insert(name));
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Member>> select() async {
    try {
      return Right(await dataSource.select());
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }
}
