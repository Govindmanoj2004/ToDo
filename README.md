# 📝 Flutter Todo App

A simple Todo application built using **Flutter** and core **Widgets**.

## 🚀 Features

- Add new tasks.
- Mark tasks as completed.
- Delete tasks with a swipe action using the [`flutter_slidable`](https://pub.dev/packages/flutter_slidable) package.
- Manage task data locally using a `List` that tracks task content and completion status.

## 📦 Packages Used

- [`flutter_slidable`](https://pub.dev/packages/flutter_slidable): Enables swipe actions on task tiles.

## 🛠 Implementation Details

- Each task is represented as a tile.
- Task tiles are wrapped with `Slidable` to enable swipe gestures.
- Swipe actions include a delete option using `SlidableAction`.
- Common methods are implemented for:
  - **Adding** new tasks.
  - **Updating** task completion status (done/undone).

## 📷 UI Overview

- Clean and minimal design.
- Tasks displayed using `ListView`.
- Interactive tiles with smooth swipe-to-delete functionality.
- Intuitive and simple user experience.

## 💡 Getting Started

1. Clone the repository.
2. Run `flutter pub get`.
3. Launch the app using `flutter run`.

## 🔄 Planned Updates

- Integrate with a database for persistent storage.
- Add more features such as editing tasks, categories, and filters.

---

