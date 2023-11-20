
import 'package:number_to_words_english/number_to_words_english.dart';

class NumberFormaters {
  static String convertNumberToWords(String number) {
    int parsedNumber = int.parse(number);
   return NumberToWordsEnglish.convert(parsedNumber);

  }
}
