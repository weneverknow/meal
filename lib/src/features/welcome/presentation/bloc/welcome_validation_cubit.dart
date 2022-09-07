import 'package:bloc/bloc.dart';

class WelcomeValidationCubit extends Cubit<bool> {
  WelcomeValidationCubit() : super(false);

  void validate(String val) => emit(val.isNotEmpty);
}
