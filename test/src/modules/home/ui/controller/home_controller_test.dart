import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:studio_sol_ssbook/src/modules/home/ui/controller/home_controller.dart';
import 'package:studio_sol_ssbook/src/modules/home/ui/states/home_states.dart';

import '../../../../../mocks/mock.dart';

void main() {
  late HomeController controller;
  late IUserRepositoryMock userRepository;

  setUpAll(() {
    userRepository = IUserRepositoryMock();
    controller = HomeController(userRepository);
  });

  group('HomeController - getUser', () {
    test('Should get and change value HomeLoadedState', () async {
      when(() => userRepository.getUser())
          .thenAnswer((_) async => userModelMock);

      await controller.getUser();

      expect(controller.value, isA<HomeLoadedState>());
    });

    test('Should get and change value HomeErrorState', () async {
      when(() => userRepository.getUser()).thenThrow(ExceptionMock());

      await controller.getUser();

      expect(controller.value, isA<HomeErrorState>());
    });
  });
}
