
import 'package:floor/floor.dart';
import 'package:todolist/domain/utils/Constant.dart';

@entity
class Task{
  @PrimaryKey(autoGenerate: true)
  int id;

  String description;

  String time;

  bool status;

  Task(this.id,this.description, this.time, this.status);
}