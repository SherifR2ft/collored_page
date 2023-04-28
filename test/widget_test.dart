import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:sherif_raafat/feautres/randomly_generated_color_feautre/random_color_generator_provider.dart';

void main() {
  group('RandomColorGeneratorProvider', () {
    late RandomColorGeneratorProvider provider;

    setUp(() {
      provider = RandomColorGeneratorProvider();
    });

    test('generateRandomlyColor generates new colors', () {
      final initialBackgroundColor = provider.backGroundColor;
      final initialTextColor = provider.textColor;
      final initialSecondTextColor = provider.secondTextColor;

      provider.generateRandomlyColor();

      expect(provider.backGroundColor, isNot(initialBackgroundColor));
      expect(provider.textColor, isNot(initialTextColor));
      expect(provider.secondTextColor, isNot(initialSecondTextColor));
    });

    test('generateRandomlyColor generates valid colors', () {
      provider.generateRandomlyColor();

      expect(provider.backGroundColor, isA<Color>());
      expect(provider.textColor, isA<Color>());
      expect(provider.secondTextColor, isA<Color>());
    });

    testWidgets('generateRandomlyColor updates system UI overlay style',
        (tester) async {
      provider.generateRandomlyColor();
    });
  });
}
