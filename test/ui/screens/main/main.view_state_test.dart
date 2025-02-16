import 'package:enpal_tech_chall/ui/screens/main/main.view_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MainState', () {
    test('initial state has index 0', () {
      final MainState state = MainState.initial();
      expect(state.index, equals(0));
    });

    test('constructor sets index', () {
      final MainState state = MainState(1);
      expect(state.index, equals(1));
    });

    test('copyWith updates index', () {
      final MainState state = MainState(0);
      final MainState newState = state.copyWith(index: 2);
      expect(newState.index, equals(2));
    });

    test('props contains index', () {
      final MainState state = MainState(1);
      expect(state.props, equals(<int>[1]));
    });

    test('states with same index are equal', () {
      final MainState state1 = MainState(1);
      final MainState state2 = MainState(1);
      expect(state1, equals(state2));
    });

    test('states with different indices are not equal', () {
      final MainState state1 = MainState(1);
      final MainState state2 = MainState(2);
      expect(state1, isNot(equals(state2)));
    });
  });
}
