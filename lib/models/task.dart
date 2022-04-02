class Task {
  final String icon, title, description;
  final DateTime schedule;

  Task({
    required this.title,
    required this.description,
    required this.icon,
    required this.schedule,
  });
}

List<Task> tasks = [
  Task(
    icon: "cart",
    title: "Shopping list, food for the week",
    description:
        "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sintLorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint",
    schedule: DateTime.now(),
  ),
  Task(
    icon: "basketball",
    title: "Play basketball with Billy and Bob Desmond",
    description:
        "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint",
    schedule: DateTime.now(),
  ),
  Task(
    icon: "location",
    title: "Go to Richmond Park to get the package",
    description:
        "Lorem ipsum dolor sit amet, consectetur  ex adipiscing elit, sed do  eiusmod  tempor  incid  idunt  ut  labore  et set  dolore  magna  aliqua.   Ut  enim  ad  minim  veniam,  quis  nostrud  esse  cillum dolore  eu  fugiat  nulla  pariatur.  Excepteur  sint",
    schedule: DateTime.now(),
  ),
];
