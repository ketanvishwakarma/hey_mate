enum TodoStatus {
  todo,
  inProgress,
  done,
}

extension TodoStatusX on TodoStatus {
  bool get isTodo => this == TodoStatus.todo;
  bool get isInProgress => this == TodoStatus.inProgress;
  bool get isDone => this == TodoStatus.done;
}

extension TodoStatusFromString on String {
  TodoStatus get fromString {
    if (this == TodoStatus.todo.name) {
      return TodoStatus.todo;
    } else if (this == TodoStatus.inProgress.name) {
      return TodoStatus.inProgress;
    } else {
      return TodoStatus.done;
    }
  }
}
