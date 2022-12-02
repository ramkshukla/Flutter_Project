import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/module/model/todo_dto.dart';

import '../../_utils/custom_widget/custom_snackbar.dart';
import '../controller/todo_bloc.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc()..add(GetAllTodos()),
      child: TodoListUI(),
    );
  }
}

class TodoListUI extends StatelessWidget {
  TodoListUI({super.key});
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  Future<void> _create(BuildContext context) async {
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Create'),
                  onPressed: () async {
                    context.read<TodoBloc>().add(
                          AddTodo(
                            TodoDTO(
                              title: _titleController.text.trim(),
                              description: _descriptionController.text.trim(),
                              created_at: Timestamp.now(),
                            ),
                          ),
                        );

                    _titleController.text = '';
                    _descriptionController.text = '';
                    Navigator.of(context).pop();
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _update(BuildContext context, String title, String description,
      String? id) async {
    _titleController.text = title;
    _descriptionController.text = description;
    await showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (BuildContext ctx) {
          return Padding(
            padding: EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
                bottom: MediaQuery.of(ctx).viewInsets.bottom + 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(labelText: 'Title'),
                ),
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: 'Description',
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  child: const Text('Update'),
                  onPressed: () async {
                    final String title = _titleController.text;
                    final String description = _descriptionController.text;
                    if (description.isNotEmpty) {
                      context.read<TodoBloc>().add(UpdateTodo(TodoDTO(
                          title: title,
                          description: description,
                          id: id,
                          created_at: Timestamp.now())));

                      _titleController.text = '';
                      _descriptionController.text = '';
                      Navigator.of(context).pop();
                    }
                  },
                )
              ],
            ),
          );
        });
  }

  Future<void> _delete(BuildContext context, TodoDTO docs) async {
    context.read<TodoBloc>().add(DeleteTodo(docs));

    CustomSnackbar.showSnackBar(
        context: context,
        message: 'You have successfully deleted a product',
        backgroundColor: Colors.red);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TodoBloc, TodoState>(
      builder: (context, state) {
        List<TodoDTO> todo = state.todoList;
        return Scaffold(
            appBar: AppBar(
              title: const Center(child: Text('ToDo App')),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) {
                final docs = todo[index];
                return Card(
                  margin: const EdgeInsets.all(10),
                  child: ListTile(
                    title: Text(docs.title),
                    subtitle: Text(docs.description),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        children: [
                          IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () => _update(context, docs.title,
                                  docs.description, docs.id)),
                          IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () => _delete(context, docs)),
                        ],
                      ),
                    ),
                  ),
                );
              },
              itemCount: todo.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _create(context),
              child: const Icon(Icons.add),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat);
      },
    );
  }
}
