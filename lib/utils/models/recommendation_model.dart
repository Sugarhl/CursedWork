class RecommendationModel {
  RecommendationModel({
    required this.id,
    required this.title,
    required this.mainText,
  });

  final String id;
  final String title;
  final String mainText;
}

class ChannelModel {
  ChannelModel({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;
}
