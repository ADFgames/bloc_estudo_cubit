import 'package:bloc/bloc.dart';

part 'greeting_state.dart';

class GreetingCubit extends Cubit<GreetingState> {
  int howMnayTimes = 1;
  GreetingCubit() : super(GreetingInitial());

  Future<void> getNextGreetingState() async {
    howMnayTimes++;

    if (howMnayTimes == 2) {
      emit(GreetingSeconfTime());
    } else if (howMnayTimes == 3) {
      emit(GreetingThirdTime());
    } else {
      emit(GreetingTheAfterTime());
    }
  }

  Future<void> resetCounting() async {
    howMnayTimes = 1;
    emit(GreetingInitial());
  }
}
