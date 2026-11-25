import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_pacisi/oyun_pacisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(pacisiConfig.title.length, 33);
    expect(pacisiConfig.tagline.length, 33);
    for (final s in pacisiConfig.tutorial) {
      expect(s.text.length, 33);
    }
  });

  test('bölümler üretilir; dört koltuk, ortaklı', () {
    expect(pacisiRules.localPlayers, 4);
    final planner = LevelPlanner(gameId: pacisiId, optionalMechanics: const []);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      final gl = pacisiRules.build(planner.spec(lv));
      expect(gl.validation.ok, isTrue, reason: 'bölüm $lv');
      expect(gl.puzzle.rules.sameSide(0, 2), isTrue);
    }
  });
}
