import 'package:dartz/dartz.dart';
import 'package:meal/src/core/failure/failure.dart';
import '../entities/member.dart';

abstract class WelcomeRepository {
  Future<Either<Failure, void>> insert(String name);
  Future<Either<Failure, Member>> select();
}
