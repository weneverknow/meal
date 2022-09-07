import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meal/src/features/add_food_favourite/data/model/food_favourite.dart';
import 'package:meal/src/features/welcome/data/repositories/member_repository_impl.dart';

part 'member_event.dart';
part 'member_state.dart';

class MemberBloc extends Bloc<MemberEvent, MemberState> {
  final MemberRepositoryImpl repositoryImpl;
  MemberBloc({
    required this.repositoryImpl,
  }) : super(MemberInitial()) {
    on<MemberEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<LoadMember>(load);
    on<AddMember>(addMember);
  }

  load(LoadMember event, Emitter<MemberState> emit) async {
    Member? member = await repositoryImpl.select();

    print("[MemberBloc] load $member");
    if (member != null) {
      emit(MemberLoaded(member));
    }
  }

  addMember(AddMember event, Emitter<MemberState> emit) async {
    print("[MemberBloc] addMember");
    emit(MemberLoading());
    await Future.delayed(Duration(seconds: 2));
    await repositoryImpl.insert(event.name);
    final member = await repositoryImpl.select();
    if (member != null) {
      emit(MemberLoaded(member));
    }
  }
}
