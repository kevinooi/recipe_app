import 'package:recipe_app/blocs/blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ServingCubit test', () {
    late ServingCubit servingCubit;

    setUp(() {
      servingCubit = ServingCubit();
    });

    test("expect 1 for serving cubit initial state", () {
      expect(
        servingCubit.state,
        1,
      );
    });

    test('expect 2 for serving cubit state if increment', () {
      servingCubit.increment();
      expect(
        servingCubit.state,
        2,
      );
    });

    test('expect 1 for serving cubit if decrement', () {
      servingCubit.decrement();
      expect(
        servingCubit.state,
        1,
      );
    });

    test(
        'expect Color(0xFFBDBDBD) for serving cubit decrement color'
        'if state <=1', () {
      expect(
        servingCubit.decrementColor,
        const Color(0xFFBDBDBD),
      );
    });

    test(
        'expect Color(0xFFE56A60) for serving cubit decrement color'
        'if state > 1 or state < 1', () {
      servingCubit.increment();
      expect(
        servingCubit.decrementColor,
        const Color(0xFFE56A60),
      );
    });

    tearDown(() {
      servingCubit.close();
    });
  });
}
