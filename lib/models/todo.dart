class Todo {
  final int colorCode, gradientStartColor, gradientStopColor;
  final double beginStart, beginStop, endStart, endStop;
  final String icon, title, description;
  final DateTime schedule;

  Todo({
    required this.gradientStartColor,
    required this.gradientStopColor,
    required this.beginStart,
    required this.beginStop,
    required this.endStart,
    required this.endStop,
    required this.title,
    required this.description,
    required this.colorCode,
    required this.icon,
    required this.schedule,
  });
}

List<Todo> todos = [
  Todo(
    colorCode: 0x4dfea64c,
    icon: "assets/icons/shopping_cart.svg",
    title: "Shopping list, food for the week",
    description:
        "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint",
    schedule: DateTime.now(),
    gradientStartColor: 0xfffe1e9a,
    gradientStopColor: 0xfffea64c,
    beginStart: 1.0,
    beginStop: -1.0,
    endStart: -0.83,
    endStop: 1.0,
  ),
  Todo(
    colorCode: 0x4dfe1e9a,
    icon: "assets/icons/basketball.svg",
    title: "Play basketball with Billy and Bob Desmond",
    description:
        "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint",
    schedule: DateTime.now(),
    gradientStartColor: 0xfffe1e9a,
    gradientStopColor: 0xff254dde,
    beginStart: -0.83,
    beginStop: 1.0,
    endStart: 0.85,
    endStop: -1.0,
  ),
  Todo(
    colorCode: 0x4d254dde,
    icon: "assets/icons/location.svg",
    title: "Go to Richmond Park to get the package",
    description:
        "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint",
    schedule: DateTime.now(),
    gradientStartColor: 0xd9254dde,
    gradientStopColor: 0xd9181743,
    beginStart: -0.92,
    beginStop: 1.07,
    endStart: 1.0,
    endStop: -1.0,
  ),
];
