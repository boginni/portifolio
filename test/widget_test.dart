abstract interface class UseCase<P, R> {
  R call(P params);
}

class VerifyStringIsNumberUsecase implements UseCase<String, bool> {
  @override
  bool call(String params) {
    return num.tryParse(params) != null;
  }
}

class DoubleStringValueUsecase implements UseCase<String, String> {
  @override
  String call(String params) {
    final valueNum = num.tryParse(params);

    if (valueNum == null) {
      return '';
    }

    return (valueNum * 2.0).toString();
  }
}

class TestController {
  final VerifyStringIsNumberUsecase verifyStringIsNumber;
  final DoubleStringValueUsecase doubleStringValueUsecase;

  const TestController({
    required this.verifyStringIsNumber,
    required this.doubleStringValueUsecase,
  });

  String execute(String input) {
    final isNumber = verifyStringIsNumber.call(input);

    if (isNumber) {
      return doubleStringValueUsecase.call(input);
    }

    return "";
  }
}

String getString(String s) {
  final isNumberUseCase = VerifyStringIsNumberUsecase();
  final doubleValueUseCase = DoubleStringValueUsecase();

  final controller = TestController(
    verifyStringIsNumber: isNumberUseCase,
    doubleStringValueUsecase: doubleValueUseCase,
  );

  return controller.execute(s);
}

void test(){
  final usecase = VerifyStringIsNumberUsecase();
  print(usecase.call("123"));

}


void main() {
  final value = getString("1111");

  print(value);
}
