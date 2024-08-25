class Task {
final String title;
final String description;
final bool isDone;

Task({
required this.title,
required this.description,
required this.isDone,
});
}

List tasks = [
Task(
title: 'Task 1',
description: 'Lear Flutter',
isDone: false,
),
Task(
title: 'Task 2',
description: 'Clean room',
isDone: true,
),
Task(
title: 'Task 3',
description: 'Go to the gym',
isDone: false,
),
];

