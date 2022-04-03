class Task {
  final String icon, title, description;
  final DateTime schedule;
  final bool done;
  final int id;

  Task({
    this.done = false,
    required this.title,
    required this.description,
    required this.icon,
    required this.schedule,
    required this.id,
  });
}

String dummyText =
    "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint";

String largeDummyText =
    "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint";

List<Task> tasks = [
  Task(
    id: 1,
    icon: "cart",
    title: "Shopping list, food for the week",
    description: largeDummyText,
    schedule: DateTime.now(),
  ),
  Task(
    id: 2,
    icon: "basketball",
    title: "Play basketball with Billy and Bob Desmond",
    description: dummyText,
    schedule: DateTime.now(),
  ),
  Task(
    id: 3,
    icon: "location",
    title: "Go to Richmond Park to get the package",
    description: dummyText,
    schedule: DateTime.now(),
  ),
];
