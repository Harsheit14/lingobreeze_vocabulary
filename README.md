# 📚 LingoBreeze Vocabulary

A modern Flutter vocabulary management application built with **Clean Architecture**, **GetX**, **Firebase Firestore**, and **Dio**.

Users can browse vocabulary words from a REST API, save them to their personal collection, and manage their vocabulary through a clean and responsive user interface.

---

## ✨ Features

### Vocabulary Catalog
- Fetches vocabulary words from a REST API
- Displays word, meaning, and translation
- Fast and responsive loading

### Personal Vocabulary Collection
- Save words to Firebase Firestore
- Real-time synchronization
- Persistent storage across app restarts

### Smart User Experience
- Autocomplete word search
- Duplicate word prevention
- Automatic bottom sheet dismissal after saving
- Empty state handling
- Loading state handling
- Error state handling

### Architecture
- Clean Architecture
- Separation of Concerns
- Scalable project structure
- Dependency Injection using GetX

---

## 🏗️ Architecture

The project follows **Clean Architecture** principles.

```text
Presentation Layer
       ↓
Domain Layer
       ↓
Data Layer
```

### Project Structure

```text
lib
├── core
│   ├── di
│   └── network
│
├── features
│   └── vocabulary
│       ├── data
│       │   ├── datasources
│       │   ├── models
│       │   └── repositories
│       │
│       ├── domain
│       │   ├── entities
│       │   ├── repositories
│       │   └── usecases
│       │
│       └── presentation
│           ├── controllers
│           ├── screens
│           └── widgets
│
├── firebase_options.dart
└── main.dart
```

---

## 🛠️ Tech Stack

### Frontend
- Flutter
- Dart

### State Management
- GetX

### Backend
- Node.js
- Express.js

### Database
- Firebase Firestore

### Networking
- Dio

### Architecture
- Clean Architecture

---

## 📱 Screenshots

### Empty State

![alt text](image.png)

### Add Word Bottom Sheet

![alt text](image-3.png)

### Vocabulary List

![alt text](image-1.png)

### Saved Words
![alt text](image-2.png)


---

## 🔥 Firebase

The application uses Firebase Firestore for:

- Saving vocabulary words
- Real-time updates
- Persistent cloud storage
- Duplicate word validation

Firestore Collection:

```text
saved_words
```

Document Structure:

```json
{
  "word": "Beautiful",
  "meaning": "Pleasing to look at",
  "translation": "Hermosa",
  "createdAt": "timestamp"
}
```

---

## 🌐 REST API

The application consumes vocabulary data from a backend API.

Example Response:

```json
{
  "success": true,
  "data": [
    {
      "word": "abundant",
      "meaning": "Existing in large quantities; plentiful.",
      "translation": "abundante"
    }
  ]
}
```

---

## 🚀 Getting Started

### Clone Repository

```bash
git clone https://github.com/Harsheit14/lingobreeze_vocabulary.git
cd lingobreeze_vocabulary
```

### Install Dependencies

```bash
flutter pub get
```

### Run Application

```bash
flutter run
```

---

## 📦 Build APK

```bash
flutter build apk --release
```

Generated APK:

```text
build/app/outputs/flutter-apk/app-release.apk
```

---

## ✅ Quality Checks

```bash
flutter analyze
flutter test
```

Project Status:

- ✅ Flutter Analyze Passed
- ✅ Flutter Tests Passed
- ✅ Firebase Integrated
- ✅ REST API Integrated
- ✅ Release APK Generated

---

## 🎯 Key Learning Outcomes

- Flutter Application Development
- Clean Architecture
- Firebase Firestore Integration
- REST API Consumption using Dio
- GetX State Management
- Dependency Injection
- Real-time Data Synchronization

---
## AI Usage Disclosure

AI tools were used to accelerate development, debugging, and implementation.

### Tools Used

* ChatGPT
* GitHub Copilot

### Estimated Contribution

| Area                               | AI Contribution              |
| ---------------------------------- | ---------------------------- |
| UI Development                     | 60%                          |
| Firebase Integration               | 40%                          |
| Backend API Development            | 50%                          |
| Debugging & Troubleshooting        | 70%                          |
| Architecture Decisions             | 20%                          |
| Final Implementation & Integration | Manual Review and Refinement |

### Notes

AI was used as a development assistant for generating boilerplate code, troubleshooting errors, and accelerating implementation.

All code was reviewed, integrated, tested, debugged, and adapted manually to satisfy the assignment requirements.


## 👨‍💻 Author

**Harsheit Bharti**

- GitHub: https://github.com/Harsheit14

---

## 📄 Release

A production-ready APK is available under:

**GitHub → Releases → v1.0.0**

---

### Version

**v1.0.0**