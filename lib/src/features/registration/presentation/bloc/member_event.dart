part of 'member_bloc.dart';

abstract class MemberEvent extends Equatable {
  
}

class LoadMember extends MemberEvent {
  @override
  List<Object?> get props => [];
}

class AddMember extends MemberEvent {
  final String name;
  AddMember(this.name);
  @override
  List<Object?> get props => [name];
}
