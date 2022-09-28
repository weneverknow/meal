import 'package:equatable/equatable.dart';

class Member extends Equatable {
  final int? id;
  final String? name;
  const Member({this.id, this.name});

  @override
  // TODO: implement props
  List<Object?> get props => [id, name];
}
