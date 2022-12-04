import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/common_widgets/gap.dart';
import 'package:todo/config/dependency_injection/dependency_injection.dart';
import 'package:todo/constants/app_constants.dart';
import 'package:todo/constants/size_constants.dart';
import 'package:todo/features/todo/application/todo_list_bloc/todo_list_bloc.dart';
import 'package:todo/features/todo/domain/entities/todo/todo.dart';
import 'package:todo/features/todo/presentation/add/add_todo_screen.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt.get<TodoListBloc>()..add(const TodoListWatchRequested()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          actions: [
            IconButton(
              icon: const Icon(Icons.list),
              onPressed: () {
                // TODO: Call bloc event to change the view
              },
            ),
          ],
        ),
        body: const CustomScrollView(
          slivers: [
            BuildTodoList(),
            SliverToBoxAdapter(
              child: SizedBox(height: 80),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<dynamic>(
                builder: (context) => const AddTodoScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}

// TODO: Make generlized widgets
class BuildTodoList extends StatelessWidget {
  const BuildTodoList({super.key});

  final grid = true;

  @override
  Widget build(BuildContext context) {
    if (grid) {
      return BlocBuilder<TodoListBloc, TodoListState>(
        builder: (context, state) {
          return SliverPadding(
            padding: const EdgeInsets.all(SizeConstants.bodyPadding),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                mainAxisExtent: 230,
                crossAxisSpacing: SizeConstants.bodyPadding,
                mainAxisSpacing: SizeConstants.bodyPadding,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: state.todoList.length,
                (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(SizeConstants.bodyPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        'Todo $index thi io sgiosfjio',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 1,
                                      ),
                                    ),
                                    const Gap(),
                                    const Icon(
                                      Icons.circle_outlined,
                                    ),
                                  ],
                                ),
                                if (index != 0)
                                  Text(
                                    'This is description of the todo, Which can be very longription of the todo, Which can be very longription of the todo, Which can be very longription of the todo, Which can be very longription of the todo, Which can be very long too.',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(
                                          fontWeight: FontWeight.normal,
                                        ),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 4,
                                  ),
                              ],
                            ),
                          ),
                          Flexible(
                            flex: 2,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  maxTimeDuration.inSeconds.toDurationString,
                                  style: Theme.of(context).textTheme.subtitle1,
                                ),
                                const Gap(),
                                ElevatedButton(
                                  onPressed: () => {},
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: const [
                                      Text(
                                        'Start',
                                      ),
                                      Icon(
                                        Icons.play_arrow,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      );
    } else {
      return SliverPadding(
        padding: const EdgeInsets.all(SizeConstants.bodyPadding),
        sliver: SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 1,
            childAspectRatio: 2.2,
            mainAxisSpacing: SizeConstants.bodyPadding,
          ),
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(SizeConstants.bodyPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Todo $index thi io sgiosfjio',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                  ),
                                ),
                                const Gap(),
                                const Icon(Icons.circle_outlined),
                              ],
                            ),
                            if (index != 0)
                              Text(
                                'This is description of the todo, Which can be very longription of the todo, Which can be very longription of the todo, Which can be very longription of the todo, Which can be very longription of the todo, Which can be very long too.',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText1!
                                    .copyWith(
                                      fontWeight: FontWeight.normal,
                                    ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              maxTimeDuration.inSeconds.toDurationString,
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            const SizedBox(
                              height: 20,
                              child: VerticalDivider(
                                thickness: 2,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () => {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text(
                                    'Start',
                                  ),
                                  Icon(
                                    Icons.play_arrow,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            childCount: 30,
          ),
        ),
      );
    }
  }
}
