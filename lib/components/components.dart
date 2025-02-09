import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String Taskname;
  final bool? Taskcompleted;
  Function(bool?)? onChanged;
  void Function(BuildContext)? deletedFunction;
  Todotile(
      {super.key,
      required this.Taskcompleted,
      required this.Taskname,
      required this.onChanged,
      required this.deletedFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 25, right: 25, left: 25, bottom: 0),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(),
          children: [
            SlidableAction(
              onPressed: deletedFunction,
              borderRadius: BorderRadius.circular(12),
              foregroundColor: Colors.white,
              backgroundColor: Colors.purple.shade400,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        key: ValueKey(0),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
              color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
          child: Row(
            children: [
              Checkbox(
                value: Taskcompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(
                Taskname,
                style: TextStyle(
                    decoration: (Taskcompleted ?? false)
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              )
            ],
          ),
        ),
      ),
    );
  }
}
