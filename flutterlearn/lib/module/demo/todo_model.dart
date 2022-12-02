class Todo {
  final String title;
  final String description;

  const Todo(this.title, this.description);
}

List list = List.generate(
  20,
  (i) => Todo(
    'Todo $i',
    'A description of what needs to be done for Todo $i',
  ),
);
