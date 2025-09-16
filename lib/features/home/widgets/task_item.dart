import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/costants/color_task.dart';
import 'package:taskati/core/functions/navigator.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';
import 'package:taskati/features/add_task/pages/add_task.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.model,
    required this.onDelete,
    required this.onComplete,
  });

  final TaskModel model;
  final Function onDelete;
  final Function onComplete;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      direction: model.isCompleted == true ? DismissDirection.none : DismissDirection.horizontal,
      confirmDismiss: (direction) async {
        if (model.isCompleted == true) {
          return false;
        }
        return true;
      },
      onDismissed: (direction) {
        if (direction == DismissDirection.startToEnd) {
          onComplete();
        } else {
          onDelete();
        }
      },
      background: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.greenColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          children: [
            Icon(
              Icons.check,
              color: AppColors.wightColor,
            ),
            Text(
              'Complete',
              style: TextStyles.titleStyle(color: AppColors.wightColor),
            )
          ],
        ),
      ),
      secondaryBackground: Container(
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: AppColors.redColor, borderRadius: BorderRadius.circular(15)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(
              Icons.delete,
              color: AppColors.wightColor,
            ),
            Text(
              'Delete Task',
              style: TextStyles.titleStyle(color: AppColors.wightColor),
            )
          ],
        ),
      ),
      child: GestureDetector(
        onTap: () {
          if (model.isCompleted == false) {
            pushTo(
                context,
                AddTaskScreen(
                  model: model,
                ));
          }
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 140,
          decoration: BoxDecoration(color: colors[model.color ?? 0], borderRadius: BorderRadius.circular(15)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title ?? '',
                        style: TextStyles.titleStyle(color: AppColors.wightColor),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(5),
                      Row(
                        children: [
                          Icon(Icons.watch_later_outlined, color: AppColors.wightColor),
                          Gap(3),
                          Text('${model.startTime} - ${model.endTime}', style: TextStyles.subTitleStyle(color: AppColors.wightColor)),
                        ],
                      ),
                      Gap(5),
                      Text(
                        (model.description?.isNotEmpty == true) ? model.description ?? '' : '- -',
                        style: TextStyles.titleStyle(color: AppColors.wightColor),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Container(height: 100, width: 2, decoration: BoxDecoration(color: AppColors.wightColor)),
                Gap(5),
                RotatedBox(
                  quarterTurns: 3,
                  child: Text(model.isCompleted == true ? 'COMPLETED' : 'TODO', style: TextStyles.titleStyle(color: AppColors.wightColor, fontSize: 16)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
