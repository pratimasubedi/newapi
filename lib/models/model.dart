// To parse this JSON data, do
//
//     final samplePost = samplePostFromJson(jsonString);

import 'dart:convert';

List<SamplePost> samplePostFromJson(String str) =>
    List<SamplePost>.from(json.decode(str).map((x) => SamplePost.fromJson(x)));

String samplePostToJson(List<SamplePost> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SamplePost {
  String title;
  Language language;
  Tags tags;
  String body;
  String image;
  String supportingDocuments;

  SamplePost({
    required this.title,
    required this.language,
    required this.tags,
    required this.body,
    required this.image,
    required this.supportingDocuments,
  });

  factory SamplePost.fromJson(Map<String, dynamic> json) => SamplePost(
        title: json["Title"],
        language: languageValues.map[json["Language"]]!,
        tags: tagsValues.map[json["Tags"]]!,
        body: json["Body"],
        image: json["Image"],
        supportingDocuments: json["Supporting Documents"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Language": languageValues.reverse[language],
        "Tags": tagsValues.reverse[tags],
        "Body": body,
        "Image": image,
        "Supporting Documents": supportingDocuments,
      };
}

enum Language { NEPALI }

final languageValues = EnumValues({"Nepali": Language.NEPALI});

enum Tags { EMPTY, TAGS, PURPLE }

final tagsValues = EnumValues({
  "सूचना तथा समाचार": Tags.EMPTY,
  "योजना तथा परियोजना": Tags.PURPLE,
  "बजेट तथा कार्यक्रम": Tags.TAGS
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
