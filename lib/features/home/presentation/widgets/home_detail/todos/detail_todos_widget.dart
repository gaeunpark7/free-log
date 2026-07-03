import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/error/error_view.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/core/widgets/button/app_filled_button.dart';
import 'package:free_log/core/widgets/text_field/app_text_field.dart';
import 'package:free_log/features/home/presentation/providers/todos_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todos/edit_todo_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todos/todos_list_view.dart';
import 'package:free_log/l10n/app_localizations.dart';

class DetailTodosWidget extends ConsumerStatefulWidget {
  final String projectId;
  const DetailTodosWidget({super.key, required this.projectId});

  @override
  ConsumerState<DetailTodosWidget> createState() => _DetailTodosWidgetState();
}

class _DetailTodosWidgetState extends ConsumerState<DetailTodosWidget> {
  final _contentController = TextEditingController();
  final formkey = GlobalKey<FormState>();
  bool _isAdding = false;

  @override
  void dispose() {
    _contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabController = DefaultTabController.of(context);
    final asyncTodos = ref.watch(todoNotifierProvider(widget.projectId));
    ref.listen(todoNotifierProvider(widget.projectId), (prev, next) {
      next.whenOrNull(
        error: (e, _) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
        },
      );
    });

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  asyncTodos.when(
                    loading: () => Text(
                      AppLocalizations.of(context)!.todos,
                      style: AppTextStyles.subTitleBold(context),
                    ),
                    error: (_, _) => Text(
                      AppLocalizations.of(context)!.todos,
                      style: AppTextStyles.subTitleBold(context),
                    ),
                    data: (todos) {
                      final done = todos.where((e) => e.isDone).length;
                      final notDone = todos.where((e) => !e.isDone).length;
                      return TabBar(
                        labelPadding: const EdgeInsets.only(right: 15), //여백 줄임.
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        indicatorColor: AppColors.primary,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicatorWeight: 3,
                        dividerColor: Colors.transparent, // 전체 하단 라인 제거
                        unselectedLabelColor: Colors.grey,
                        labelStyle: AppTextStyles.subTitleBold(context),
                        unselectedLabelStyle: AppTextStyles.subTitle(context),
                        tabs: [
                          Tab(text: AppLocalizations.of(context)!.todoTab(notDone)),
                          Tab(text: AppLocalizations.of(context)!.doneTab(done)),
                        ],
                      );
                    },
                  ),

                  GestureDetector(
                    onTap: () => setState(() => _isAdding = !_isAdding),
                    child: Text(
                      AppLocalizations.of(context)!.addTodo,
                      style: AppTextStyles.body(context).copyWith(color: AppColors.primary),
                    ),
                  ),
                ],
              ),
              Divider(height: 1, thickness: 1, color: const Color.fromARGB(255, 221, 221, 221)),
              //추가
              if (_isAdding) ...[
                const SizedBox(height: 12),
                AppTextField(
                  controller: _contentController,
                  valieText: AppLocalizations.of(context)!.valieTodo,
                  hintText: AppLocalizations.of(context)!.todosHint,
                  icon: Icon(Icons.edit_note, size: 23),
                  maxLenth: 15,
                ),
                const SizedBox(height: 12),
                AppFilledButton(
                  onPressed: () async {
                    if (!formkey.currentState!.validate()) {
                      return;
                    }
                    await ref
                        .read(todoNotifierProvider(widget.projectId).notifier)
                        .addTodo(_contentController.text);
                    if (ref.read(todoNotifierProvider(widget.projectId)).hasError) return;
                    _contentController.clear();
                    setState(() {
                      _isAdding = false;
                    });
                  },
                  text: AppLocalizations.of(context)!.add,
                ),
              ],
              //TodoList
              asyncTodos.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, _) => ErrorView(message: e.toString()),
                data: (todos) {
                  final notDone = todos.where((e) => !e.isDone).toList();
                  final done = todos.where((e) => e.isDone).toList();
                  return AnimatedBuilder(
                    animation: tabController,
                    builder: (context, _) {
                      final currentTodos = tabController.index == 0 ? notDone : done;

                      return SizedBox(
                        height: _todoListHeight(currentTodos.length),
                        child: TabBarView(
                          children: [
                            //할 일 list
                            TodosListView(
                              items: notDone,
                              onTap: (item) {
                                //edit dialog
                                final controller = TextEditingController(text: item.content);
                                showDialog(
                                  context: context,
                                  builder: (_) => EditTodoDialog(
                                    controller: controller,
                                    projectId: widget.projectId,
                                    todoId: item.id!,
                                  ),
                                );
                              },
                              onChanged: (item, value) async {
                                if (item.id == null) return;
                                await ref
                                    .read(todoNotifierProvider(widget.projectId).notifier)
                                    .completedTodo(item.id!, value ?? false);
                              },
                            ),
                            //완료 list
                            TodosListView(
                              items: done,
                              onTap: (_) {},
                              onChanged: (item, value) async {
                                if (item.id == null) return;
                                await ref
                                    .read(todoNotifierProvider(widget.projectId).notifier)
                                    .completedTodo(item.id!, value ?? false);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

double _todoListHeight(int count) {
  const itemHeight = 32.0;
  const verticalPadding = 24.0; // ListView padding: top 12 + bottom 12
  const maxItems = 4;
  if (count == 0) return 0;
  final c = count.clamp(1, maxItems);
  return c * itemHeight + verticalPadding;
}
