# Todo List App

A simple and clean task management app built with Flutter and GetX.  
It allows users to create task categories, add tasks, track progress, delete tasks with drag-and-drop and view reports. The app focuses on smooth interactions, modular code structure and local data persistence.

---

## 🚀 Features

- Create task categories  
- Add tasks using a custom dialog  
- Drag and drop to delete  
- Progress tracking with visual indicators  
- Report screen for task statistics  
- Tab navigation (Home + Report)  
- Local storage with GetStorage  
- Smooth UI feedback using EasyLoading  
- Reusable widgets and clean UI components  

---

## 📱 Screenshots

_Add your screenshots here_


---

## 🛠️ Tech Stack

| Technology | Purpose |
| :----------| :----------|
| **Flutter** | Application development |
| **GetX** | State management, routing|
| **GetStorage** | Local storage |
| **EasyLoading** | UI feedback |
| **Equatable** | Model comparison |
| **Step Progress Indicator** | Progress tracking |
| **Intl** | Date formatting |

---

## 📂 Project Structure
 ```pqsql

lib/
└── app/
    ├── core/
    │   ├── utils/
    │   │   ├── extensions.dart
    │   │   └── keys.dart
    │   └── values/
    │       ├── colors.dart
    │       └── icons.dart
    ├── data/
    ├── modules/
    │   ├── home/
    │   │   ├── widgets/
    │   │   │   ├── add_cart.dart
    │   │   │   ├── add_dialog.dart
    │   │   │   └── task_cart.dart
    │   │   ├── controller.dart
    │   │   ├── binding.dart
    │   │   └── view.dart
    │   ├── detail/
    │   │   ├── widgets/
    │   │   └── view.dart
    │   └── report/
    │       └── view.dart
└── widgets/

```
## ⚙️ How to Run

1. Clone the repository
  ```bash
  git clone https://github.com/arnob444/Flutter_all_projects_006.git
   
2. Go to the project directory
     cd todo_list

3. Install dependencies
     flutter pub get

4. Run the app
     flutter run

 ```

## Dependencies:
get  
get_storage  
equatable  
flutter_easyloading  
device_preview  
dotted_border  
step_progress_indicator  
intl  

## Key Highlights

Modular architecture for clean code separation

Custom extensions for responsive UI

Reusable widgets for dialogs, cards and report components

GetX controllers for state and logic

Smooth drag-and-drop interactions

