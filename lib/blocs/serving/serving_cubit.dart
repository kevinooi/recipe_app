import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

import '../../config/custom_color.dart';

class ServingCubit extends Cubit<int> {
  ServingCubit() : super(1);

  /// Add 1 to the current state.
  void increment() => emit(state + 1);

  /// Subtract 1 from the current state.
  void decrement() {
    if (state > 1) return emit(state - 1);
  }

  Color get decrementColor =>
      state <= 1 ? CustomColors.tertiaryText : CustomColors.secondaryRed;
}
