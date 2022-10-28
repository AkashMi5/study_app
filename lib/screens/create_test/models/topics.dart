class Topic {
  String? topicName;
  bool topicCheckboxValue;
  List<Concept>? concepts;

  Topic({this.topicName, this.topicCheckboxValue = false, this.concepts});

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
        topicName: json['topicName'],
        topicCheckboxValue: false,
        concepts: List<Concept>.from(
            json['concepts'].map((x) => Concept.fromJson(x))),
      );

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['topicName'] = topicName;
    data['concepts'] = concepts;
    return data;
  }
}

class Concept {
  Concept({this.conceptName, this.conceptCheckboxValue = false});

  String? conceptName;
  bool conceptCheckboxValue;

  factory Concept.fromJson(String name) =>
      Concept(conceptName: name, conceptCheckboxValue: false);
}
