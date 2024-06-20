//import 'package:flutter/foundation.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:todo/providers/category_provider.dart';
import 'package:todo/utils/extension.dart';
// ignore: depend_on_referenced_packages
import 'package:gap/gap.dart';
import 'package:todo/utils/task_categories.dart';
import 'package:todo/widgets/circle_container.dart';

class SelectCategory extends ConsumerWidget {
  const SelectCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(categoryProvider);
    final categories = TaskCategories.values.toList();
    return SizedBox(
      height: 60,
      child: Row(
        children: [
          Text(
            'Category',
            style: context.textTheme.titleLarge,
          ),
          const Gap(10),
          Expanded(
            child: ListView.separated(
              physics: const AlwaysScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, index) {
                // ignore: non_constant_identifier_names
                final Category = categories[index];
                return InkWell(
                  onTap: () {
                    ref.read(categoryProvider.notifier).state = Category;
                  },
                  borderRadius: BorderRadius.circular(30),
                  child: CircleContainer(
                    color: Category.color.withOpacity(0.3),
                    child: Icon(
                      Category.icon,
                      color: Category == selectedCategory
                          ? context.colorScheme.primary
                          : Category.color,
                    ),
                  ),
                );
              },
              separatorBuilder: (ctx, index) => const Gap(8),
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
