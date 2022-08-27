class AudioModel {
  AudioModel({
    this.name,
    this.bg,
    this.audio,
  });

  String? name;
  String? bg;
  String? audio;

  factory AudioModel.fromJson(Map<String, dynamic> json) => AudioModel(
        name: json["name"],
        bg: json["bg"],
        audio: json["audio"],
      );
}
