class Note {
  late String title;
  late String text;

  Note({required this.title, required this.text});

  Note.fromJson(Map<String, dynamic?> json)
      : this(
          title: json['title']! as String,
          text: json['text']! as String,
        );

  Note copyWith({
    String? title,
    String? text,
  }) {
    return Note(title: title ?? this.title, text: text ?? this.text);
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'text': text,
    };
  }
}
