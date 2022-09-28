part of 'member_bloc.dart';

abstract class MemberState extends Equatable {}

class MemberLoading extends MemberState {
  @override
  List<Object?> get props => [];
}

class MemberInitial extends MemberState {
  @override
  List<Object?> get props => [];
}

class MemberLoaded extends MemberState {
  final Member member;
  MemberLoaded(this.member);
  @override
  List<Object?> get props => [member];
}
