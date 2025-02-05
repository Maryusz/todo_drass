class BaseTodo {
  final int id;

  BaseTodo({
    required this.id,
  });
}

class Todo extends BaseTodo {
  final String title;
  final String description;
  final DateTime startDate;
  final DateTime endDate;

  Todo({
    required this.title,
    required this.description,
    required this.startDate,
    required this.endDate,
    required super.id,
  });

  Todo copyWith({
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return Todo(
      title: title ?? this.title,
      description: description ?? this.description,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      id: super.id,
    );
  }
}

class TodoWithImage extends Todo {
  final String imageUrl;

  TodoWithImage({
    required this.imageUrl,
    required super.title,
    required super.description,
    required super.startDate,
    required super.endDate,
    required super.id,
  });

  @override
  TodoWithImage copyWith({
    String? imageUrl,
    String? title,
    String? description,
    DateTime? startDate,
    DateTime? endDate,
  }) {
    return TodoWithImage(
      imageUrl: imageUrl ?? this.imageUrl,
      title: title ?? super.title,
      description: description ?? super.description,
      startDate: startDate ?? super.startDate,
      endDate: endDate ?? super.endDate,
      id: super.id,
    );
  }
}
