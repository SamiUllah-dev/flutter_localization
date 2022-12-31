class Language {
  final String id;
  final String name;
  final FlagEmoji flag;
  final String code;

  Language({
    required this.id,
    required this.name,
    required this.flag,
    required this.code,
  });
}

typedef FlagEmoji = String;
