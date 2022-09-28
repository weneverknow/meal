import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/core/usecase/usecase.dart';
import 'package:meal/src/features/registration/domain/usecase/insert_member.dart';
import 'package:meal/src/features/registration/domain/usecase/select_member.dart';

import '../../domain/entities/member.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final InsertMember insertMember;
  final SelectMember selectMember;
  MemberBloc({required this.insertMember, required this.selectMember})
      : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {});
    on<LoadMember>(load);
    on<AddMember>(addMember);
  }

  load(LoadMember event, Emitter<MemberState> emit) async {
    final result = await selectMember(NoParam());
    result.fold((l) => emit(MemberInitial()), (r) => emit(MemberLoaded(r)));
  }

  addMember(AddMember event, Emitter<MemberState> emit) async {
    print("[MemberBloc] addMember");
    emit(MemberLoading());
    await Future.delayed(Duration(seconds: 1));

    await insertMember(event.name);

    final result = await selectMember(NoParam());
    result.fold((l) => emit(MemberInitial()), (r) => emit(MemberLoaded(r)));
  }
}
