# 🌟 Periodic Table Flutter App

An interactive **Periodic Table** built with **Flutter** for Web & Mobile.  
Includes hover effects, gradient text, responsive layout, and dialog boxes for element details.


# 🌟 Periodic Table Flutter App

An interactive **Periodic Table** built with **Flutter** for Web & Mobile.  
Includes hover effects, gradient text, responsive layout, and dialog boxes for element details.

---

## 📖 About the Periodic Table

The **Periodic Table of Elements** is a chart organizing chemical elements by:
- **Atomic number** (protons)
- **Electron configuration**
- **Chemical properties**

### Blocks:
- **s-block** → Groups 1–2 (and Helium)
- **p-block** → Groups 13–18
- **d-block** → Transition metals
- **f-block** → Lanthanides and actinides

This app makes exploring the periodic table **visual, interactive, and responsive**.

---

## ✨ Features

- 🎨 **Beautiful Gradient Titles** using `simple_gradient_text`
- 🖱 **Hover Effect** with `flutter_bloc` (border color + elevation)
- 📊 **Accurate Periodic Table Layout** using `GridView`
- 🪟 **Dialog Box for Element Details** with close icon
- 📱 **Responsive Design** (forces landscape mode under 500px width)
- 🌍 **Web & Mobile Compatible**

---

## 📂 Folder Structure
````
lib/
│
├── core/ # Core configurations and utilities
│ ├── constants/ # Application constants
│ ├── errors/ # Error handling classes
│ └── utils/ # Utility functions
│
├── data/ # Data layer
│ ├── datasources/ # API related classes
│ │ ├── api.dart
│ │ └── api_service.dart
│ ├── models/ # Data models
│ └── repository/ # Repository implementations
│ └── remote_data_source_implement...
│
├── domain/ # Domain layer
│ └── repositories/ # Repository interfaces
│ └── periodic_table_repository.dart
│
├── presentation/ # Presentation/UI layer
│ ├── screens/
│ │ ├── bloc/ # BLoC state management
│ │ │ ├── hover_effect_bloc.dart
│ │ │ ├── hover_effect_event.dart
│ │ │ ├── hover_effect_state.dart
│ │ │ ├── periodic_table_bloc.dart
│ │ │ ├── periodic_table_event.dart
│ │ │ └── periodic_table_state.dart
│ │ ├── data_shows.dart/ # UI components for displaying data
│ │ │ ├── dialog_widgets.dart
│ │ │ ├── design.dart
│ │ │ ├── element_card_design.dart
│ │ │ ├── hover_effect.dart
│ │ │ ├── landscape.dart
│ │ │ └── linear_text.dart
│
└── main.dart # App entry point

````
---

## 📦 Dependencies

```yaml
dependencies:
  cupertino_icons: ^1.0.8
  equatable: ^2.0.7
  dartz: ^0.10.1
  http: ^1.4.0
  flutter_bloc: ^9.1.1
  dotted_line: ^3.2.3
  simple_gradient_text: ^1.3.0
  auto_size_text: ^3.0.0
