import 'package:meal/src/core/failure/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:meal/src/core/usecase/usecase.dart';

import '../entities/member.dart';
import '../repositories/welcome_repository.dart';

class SelectMember implements UseCase<Member, NoParam> {
  final WelcomeRepository repository;
  SelectMember(this.repository);

  @override
  Future<Either<Failure, Member>> call(NoParam params) async {
    return await repository.select();
  }
}
