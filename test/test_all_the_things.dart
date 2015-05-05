import 'package:test/test.dart';

import './class_gaps_test.dart' as class_gaps_test;
import './class_score_test.dart' as class_score_test;
import './library_score_test.dart' as library_score_test;
import './utils_test.dart' as utils_test;

void main() {
  group('class_gaps', class_gaps_test.main);
  group('class_score', class_score_test.main);
  group('library_score', library_score_test.main);
  group('utils', utils_test.main);
}
