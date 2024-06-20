import 'package:flutter/material.dart';
import 'package:todo/data/data.dart';
import 'package:todo/utils/extension.dart';
import 'package:todo/widgets/widgets.dart';
import 'package:gap/gap.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});
  final Task task;

  @override
  Widget build(BuildContext context) {
    final style = context.textTheme;

    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          CircleContainer(
            color: task.category.color.withOpacity(0.3),
            child: Icon(task.category.icon),
          ),
          const Gap(16),
          Text(
            task.title,
            style: style.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(task.time, style: style.titleMedium),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: Row(
              children: [
                Text('Task to be Completed on ${task.date}'),
                Icon(
                  Icons.check_box,
                  color: task.category.color,
                )
              ],
            ),
          ),
          const Gap(16),
          Divider(
            thickness: 1.5,
            color: task.category.color,
          ),
          const Gap(16),
          Text(task.note.isEmpty
              ? 'There is no additional note for this task'
              : task.note),
          const Gap(16),
          Visibility(
            visible: task.isCompleted,
            child: const Row(
              children: [
                Text('Task Completed'),
                Icon(
                  Icons.check_box,
                  color: Colors.green,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
