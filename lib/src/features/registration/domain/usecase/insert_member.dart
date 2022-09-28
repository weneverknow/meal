import 'package:meal/src/core/failure/failure.dart';

import 'package:dartz/dartz.dart';

import '../../../../core/usecase/usecase.dart';
import '../repositories/welcome_repository.dart';

class InsertMember implements UseCase<void, String> {
  final WelcomeRepository repository;
  InsertMember(this.repository);

  @override
  Future<Either<Failure, void>> call(String name) async {
    return await repository.insert(name);
  }
}
