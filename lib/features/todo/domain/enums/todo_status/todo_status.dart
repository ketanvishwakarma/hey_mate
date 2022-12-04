enum TodoStatus {
  todo,
  inProgress,
  done,
}

extension TodoStatusX on TodoStatus {
  String get name {
    switch (this) {
      case TodoStatus.todo:
        return 'Todo';
      case TodoStatus.inProgress:
        return 'In Progress';
      case TodoStatus.done:
        return 'Done';
    }
  }

  TodoStatus get next {
    switch (this) {
      case TodoStatus.todo:
        return TodoStatus.inProgress;
      case TodoStatus.inProgress:
      case TodoStatus.done:
        return TodoStatus.done;
    }
  }

  bool get isTodo => this == TodoStatus.todo;
  bool get isInProgress => this == TodoStatus.inProgress;
  bool get isDone => this == TodoStatus.done;
}

extension TodoStatusFromString on String {
  TodoStatus fromString(String status) {
    switch (status) {
      case 'Todo':
        return TodoStatus.todo;
      case 'In Progress':
        return TodoStatus.inProgress;
      case 'Done':
        return TodoStatus.done;
      default:
        return TodoStatus.todo;
    }
  }
}
