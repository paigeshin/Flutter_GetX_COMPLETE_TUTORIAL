import 'package:get/get.dart';

class Messages extends Translations {
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'Hello': 'hello',
        },
        'ko_KR': {
          'Hello': '안녕하세요',
        },
        'fr_FR': {
          'Hello': 'Bonjour',
        }
      };
}
