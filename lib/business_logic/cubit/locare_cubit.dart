import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'locare_state.dart';

class LocareCubit extends Cubit<LocareState> {
  LocareCubit() : super(LocareInitial());
}
