import 'package:flutter_test/flutter_test.dart';
import 'package:medhub_adsdigital_msibselection/features/pages/common/bloc/count_down_cubit.dart';

void main() {
  group('CountDownCubit', () {

    group('CountDownCubit', () {
      late CountDownCubit countDownCubit;

      setUp(() {
        countDownCubit = CountDownCubit();
      });

      tearDown(() {
        countDownCubit.close();
      });

      test('initial state is 60', () {
        expect(countDownCubit.state, 60);
      });

      test('startCountDown emits countdown values', () async {
        const duration = Duration(seconds: 1);
        int startValue = 5;

        final List<int> emittedStates = [];
        final subscription = countDownCubit.stream.listen(emittedStates.add);

        countDownCubit.startCountDown(second: startValue);

        await Future.delayed(duration * startValue, () {
          subscription.cancel();

          expect(emittedStates, [5, 4, 3, 2, 1]);
          expect(countDownCubit.state, 1);
        });
      });

      test('countdown stops when it reaches 1', () async {
        countDownCubit.startCountDown(second: 2);

        await Future.delayed(const Duration(seconds: 2));

        expect(countDownCubit.state, 1);
      });
    });
  });
}
