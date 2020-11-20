import 'package:hire_remote_team/models/skill.dart';

class FilterObj {
  double minRating;
  double minPrice;
  double maxPrice;
  int minSizeTeam;
  int maxSizeTeam;
  List<Skill> skills;

  FilterObj() {
    minRating = 3;
    minPrice = 0;
    maxPrice = 1000000;
    minSizeTeam = 0;
    maxSizeTeam = 10000;
    skills = [];
  }

  @override
  String toString() {
    return 'FilterObj{minRating: $minRating, minPrice: $minPrice, maxPrice: $maxPrice, minSizeTeam: $minSizeTeam, maxSizeTeam: $maxSizeTeam, skills: $skills}';
  }
}

enum Sort {
  NONE,
  BY_MIN_PRICE,
  BY_MAX_PRICE,
  BY_MOST_PROJECT,
  BY_RATING,
}
