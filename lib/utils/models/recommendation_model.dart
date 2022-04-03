import 'package:cursed_work/utils/enums.dart';

class RecommendationModel {
  RecommendationModel({
    required this.id,
    this.level = RecommendationLevel.info,
    required this.title,
    required this.mainText,
    required this.date,
    this.media,
  });

  final RecommendationLevel level;
  final String id;
  final String title;
  final String mainText;
  final String date;
  final List<String>? media;
}
