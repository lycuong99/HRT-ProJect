import 'package:hire_remote_team/models/skill.dart';

class FilterObj {
  double minRating;
  double minPrice;
  double maxPrice;
  List<Skill> skills;

  FilterObj() {
    minRating = 4;
    minPrice = 100;
    maxPrice = 1000;
  }
}

enum Sort { NONE, BY_MIN_PRICE, BY_MAX_PRICE, BY_MOST_PROJECT, BY_RATING }
