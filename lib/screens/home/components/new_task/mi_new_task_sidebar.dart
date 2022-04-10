import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:my_day/models/task.dart';
import 'package:my_day/screens/home/components/new_task/components/mi_form_label.dart';
import 'package:my_day/screens/home/components/new_task/components/mi_form_text_area.dart';
import 'package:my_day/services/task_service.dart';
import 'package:my_day/shared/constants.dart';
import 'package:my_day/shared/util/mi_button_primary.dart';

import '../../../../providers/task_notifier.dart';
import 'components/icons_row.dart';

class MiNewTaskSidebar extends StatefulWidget {
  const MiNewTaskSidebar({
    Key? key,
  }) : super(key: key);

  @override
  State<MiNewTaskSidebar> createState() => _MiNewTaskSidebarState();
}

class _MiNewTaskSidebarState extends State<MiNewTaskSidebar> {
  // for icons input field
  List<String> icons = [
    "general",
    "cart",
    "basketball",
    "location",
    "drink",
    "gym"
  ];
  int selectedIndex = 0;

  // controllers
  TextEditingController _dateController = TextEditingController();
  TextEditingController _timeController = TextEditingController();

  // form state values
  final _newTaskFormKey = GlobalKey<FormState>();
  String _icon = "general";
  String _title = "";
  String _description = "";
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  // select date function
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2022, 12, 31),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
    );
    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _dateController.text = DateFormat('d - MMMM - y').format(_selectedDate);
      });
    }
  }

  // select time function
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null) {
      setState(() {
        _selectedTime = picked;
        _timeController.text = DateFormat('h:mm a')
            .format(
                DateTime(2022, 1, 1, _selectedTime.hour, _selectedTime.minute))
            .toString();
      });
    }
  }

  @override
  void initState() {
    _dateController.text = DateFormat('d - MMMM - y').format(DateTime.now());
    _timeController.text = DateFormat('h:mm a').format(DateTime.now());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Material(
      type: MaterialType.transparency,
      child: Container(
        height: size.height,
        width: size.width * 0.8,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(miDefaultSize * 1.3),
            bottomLeft: Radius.circular(miDefaultSize * 1.3),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Color(0x33181743),
              offset: Offset(0, 4),
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
            ),
          ],
        ),
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: miDefaultSize * 1.5,
            vertical: miDefaultSize * 0.01,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "NEW TASK",
                  style: TextStyle(
                    fontFamily: "Baloo",
                    color: miTextColor,
                    fontSize: miDefaultSize * 2.4,
                  ),
                ),
                SizedBox(height: miDefaultSize),
                Form(
                  key: _newTaskFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: miDefaultSize),
                        child: MiFormLabel(text: "Icon"),
                      ),
                      SizedBox(
                        height: miDefaultSize * 5.5,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: const BouncingScrollPhysics(),
                          itemCount: icons.length,
                          itemBuilder: (BuildContext context, int index) =>
                              IconsRow(
                            index: index,
                            selectedIndex: selectedIndex,
                            icons: icons,
                            tap: () {
                              setState(() {
                                selectedIndex = index;
                                _icon = icons[index];
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(height: miDefaultSize * 1.3),
                      MiFormLabel(text: "Name"),
                      TextFormField(
                        validator: (val) =>
                            val!.isEmpty ? "Please enter task name" : null,
                        onChanged: (val) => setState(() => _title = val),
                        style: TextStyle(
                          fontSize: miDefaultSize * 1.5,
                          color: miTextColor,
                        ),
                        decoration: InputDecoration(
                          hintText: "Enter task name",
                          errorStyle: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ),
                      SizedBox(height: miDefaultSize * 2),
                      Padding(
                        padding: const EdgeInsets.only(bottom: miDefaultSize),
                        child: MiFormLabel(text: "Description"),
                      ),
                      MiFormTextArea(
                        changed: (val) => setState(() => _description = val),
                      ),
                      SizedBox(height: miDefaultSize * 2),
                      MiFormLabel(text: "Date"),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: miDefaultSize * 1.5,
                            color: miTextColor,
                          ),
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _dateController,
                        ),
                      ),
                      SizedBox(height: miDefaultSize * 2),
                      MiFormLabel(text: "Time"),
                      GestureDetector(
                        onTap: () => _selectTime(context),
                        child: TextFormField(
                          style: TextStyle(
                            fontSize: miDefaultSize * 1.5,
                            color: miTextColor,
                          ),
                          enabled: false,
                          keyboardType: TextInputType.text,
                          controller: _timeController,
                        ),
                      ),
                      SizedBox(height: miDefaultSize * 3),
                      Consumer(
                        builder: (context, outerRef, child) {
                          final asyncTaskProvider =
                              outerRef.watch(futureTaskNotifierProvider);

                          return asyncTaskProvider.when(
                            data: (data) {
                              return ProviderScope(
                                overrides: [
                                  taskNotifierProvider.overrideWithValue(data)
                                ],
                                child: Consumer(
                                  builder: (context, ref, child) {
                                    final tasks =
                                        ref.watch(taskNotifierProvider)
                                            as List<Task>;
                                    final tasksProvider = ref
                                        .watch(taskNotifierProvider.notifier);

                                    return MiButtonPrimary(
                                      verticalSymmetricPadding:
                                          miDefaultSize * 0.5,
                                      text: "Add",
                                      press: () async {
                                        // validate new task form
                                        if (_newTaskFormKey.currentState!
                                            .validate()) {
                                          // merging selected date and time to form schedule
                                          final DateTime _schedule = DateTime(
                                            _selectedDate.year,
                                            _selectedDate.month,
                                            _selectedDate.day,
                                            _selectedTime.hour,
                                            _selectedTime.minute,
                                          );

                                          TaskService _taskService =
                                              TaskService();

                                          final Map<String, dynamic> newTask = {
                                            "id": await _taskService
                                                .getBiggestIdFromTasksInDatabase(),
                                            "title": _title,
                                            "description": _description,
                                            "icon": _icon,
                                            "schedule": _schedule
                                                .millisecondsSinceEpoch,
                                          };

                                          dynamic result = await _taskService
                                              .saveNewTask(newTask);

                                          if (result != null) {
                                            tasksProvider.addTask(Task(
                                              id: newTask["id"],
                                              title: newTask["title"],
                                              description:
                                                  newTask["description"],
                                              icon: newTask["icon"],
                                              schedule: DateTime
                                                  .fromMillisecondsSinceEpoch(
                                                      newTask["schedule"]),
                                            ));
                                            Navigator.pop(context);
                                          } else {
                                            print("failed to save");
                                          }
                                        }
                                      },
                                    );
                                  },
                                ),
                              );
                            },
                            error: (_, stack) =>
                                Center(child: Text(_.toString())),
                            loading: () => const Center(
                                child: CircularProgressIndicator.adaptive()),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
