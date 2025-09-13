import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:taskati/core/costants/color_task.dart';
import 'package:taskati/core/models/task_model.dart';
import 'package:taskati/core/text/text_style.dart';
import 'package:taskati/core/utils/color.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
    required this.model,
  });

  final TaskModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
            Container(height: 70, width: 1, decoration: BoxDecoration(color: AppColors.wightColor)),
            Gap(5),
            RotatedBox(
              quarterTurns: 3,
              child: Text(model.isCompleted == true ? 'COMPLETED' : 'TODO', style: TextStyles.titleStyle(color: AppColors.wightColor, fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
