class ToDo {
  int id;
  String title;
  String desc;
  String date;
  bool isDone;

  ToDo(
      {required this.id,
      required this.title,
      required this.desc,
      required this.date,
      required this.isDone});

  static final List<ToDo> _toDoList = [];

  static List<ToDo> get list {
    return _toDoList;
  }
}
