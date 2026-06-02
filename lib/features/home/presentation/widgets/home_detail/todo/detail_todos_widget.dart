import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:free_log/core/theme/app_colors.dart';
import 'package:free_log/core/theme/app_text_style.dart';
import 'package:free_log/core/utils/responsive_utils.dart';
import 'package:free_log/features/home/presentation/providers/todos_provider.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todo/edit_bottom_sheet.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todo/todos_add_container.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todo/todos_edit_dialog.dart';
import 'package:free_log/features/home/presentation/widgets/home_detail/todo/todos_list_view.dart';

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

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDefault),
      ),
      child: Padding(
        padding: Responsive.cardPadding(context),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                asyncTodos.when(
                  loading: () => Text('할 일'),
                  error: (_, _) => Text('할 일'),
                  data: (todos) {
                    final done = todos.where((e) => e.isDone).length;
                    final notDone = todos.where((e) => !e.isDone).length;
                    return TabBar(
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorColor: AppColors.primary,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 3,
                      // dividerColor: Colors.transparent, // 전체 하단 라인 제거
                      labelColor: AppColors.primary,
                      unselectedLabelColor: Colors.grey,
                      labelStyle: AppTextStyles.subTitle(context),
                      unselectedLabelStyle: AppTextStyles.subTitle(context),

                      tabs: [
                        Tab(text: '할 일($notDone)'),
                        Tab(text: '완료($done)'),
                      ],
                    );
                  },
                ),

                GestureDetector(
                  onTap: () => setState(() => _isAdding = !_isAdding),
                  child: Text('+ 추가', style: AppTextStyles.caption(context).copyWith(color: AppColors.primary)),
                ),
              ],
            ),
            //추가
            if (_isAdding) ...[
              TodosAddContainer(
                controller: _contentController,
                formkey: formkey,
                onPressed: () {
                  if (!formkey.currentState!.validate()) {
                    return;
                  }
                  ref.read(todoNotifierProvider(widget.projectId).notifier).addTodo(_contentController.text);
                  _contentController.clear();
                  setState(() {
                    _isAdding = false;
                  });
                },
              ),
            ],
            //TodoList
            asyncTodos.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Text('에러:$e'),
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
                              //edit bottomSheet
                              showModalBottomSheet(
                                context: context,
                                builder: (sheetContext) => SafeArea(
                                  child: EditBottomSheet(
                                    editOnTap: () {
                                      Navigator.pop(sheetContext);
                                      final controller = TextEditingController(text: item.content);
                                      showDialog(
                                        context: context,
                                        builder: (_) => TodosEditDialog(
                                          controller: controller,
                                          onPressed: () async {
                                            if (item.id == null) return;
                                            await ref.read(todoNotifierProvider(widget.projectId).notifier).updateTodo(item.id!, controller.text);
                                          },
                                        ),
                                      );
                                    },
                                    deleteOnTap: () {
                                      Navigator.pop(sheetContext);
                                      if (item.id == null) return;
                                      ref.read(todoNotifierProvider(widget.projectId).notifier).deleteTodo(item.id!);
                                    },
                                  ),
                                ),
                              );
                            },
                            onChanged: (item, value) {
                              if (item.id == null) return;
                              ref.read(todoNotifierProvider(widget.projectId).notifier).completedTodo(item.id!, value ?? false);
                            },
                          ),
                          //완료 list
                          TodosListView(
                            items: done,
                            onTap: (_) {},
                            onChanged: (item, value) {
                              if (item.id == null) return;
                              ref.read(todoNotifierProvider(widget.projectId).notifier).completedTodo(item.id!, value ?? false);
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
    );
  }
}

double _todoListHeight(int count) {
  const itemHeight = 44.0;
  const maxHeight = 132.0;
  return ((count == 0 ? 1 : count) * itemHeight).clamp(itemHeight, maxHeight).toDouble();
}
