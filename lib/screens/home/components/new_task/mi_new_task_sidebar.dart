import 'package:flutter/material.dart';
import 'package:my_day/screens/home/components/new_task/components/mi_form_label.dart';
import 'package:my_day/shared/constants.dart';

import '../../../../shared/util/circular_gradient_icon.dart';
import '../../../../shared/util/color_dot.dart';
import 'components/icons_row.dart';

class MiNewTaskSidebar extends StatefulWidget {
  const MiNewTaskSidebar({
    Key? key,
  }) : super(key: key);

  @override
  State<MiNewTaskSidebar> createState() => _MiNewTaskSidebarState();
}

class _MiNewTaskSidebarState extends State<MiNewTaskSidebar> {
  final _newTaskFormKey = GlobalKey<FormState>();
  List<String> icons = [
    "general",
    "cart",
    "basketball",
    "location",
    "drink",
    "gym"
  ];
  int selectedIndex = 0;

  // form values
  String _icon = "";
  String _title = "";
  String _description = "";
  DateTime _schedule = DateTime.now();

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
                      MiFormLabel(text: "Icon"),
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
