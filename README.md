# StarWars Characters App

A native iOS application that displays a list of Star Wars characters fetched from a remote feed, with a detail view for each character. Built as a UIKit project following MVVM architecture with Combine for reactive data binding.

---

## Features

- Browse a list of Star Wars characters
- Search characters by name via `UISearchController`
- View character details including image and description
- Activity indicator during data loading
- Image caching via `URLCache`

---

## Tech Stack

| Category | Technology |
|---|---|
| Language | Swift 5 |
| UI Framework | UIKit |
| UI Layout | Storyboards |
| Architecture | MVVM |
| Async / Reactive | Combine |
| Networking | URLSession |
| Image Caching | URLCache |
| List Management | UITableViewDiffableDataSource |
| Dependency Management | None (no external packages) |

---

## Project Structure

```
StarWars/
├── Modules/
│   ├── CharacterList/          # List screen — ViewController, ViewModel, Cell
│   └── CharacterDetail/        # Detail screen — ViewController, Cell
├── Source/
│   ├── Models/                 # CharacterResponse data model
│   ├── Networking/             # Network protocols and error handling
│   ├── Requesters/             # URLSession-based requester (QueryRequester)
│   ├── Requests/               # API request definitions (StarWarsRequest)
│   ├── Service/                # StarWarsService — business logic layer
│   └── Extensions/             # UIImageView async image loading
└── SupportingFiles/
    ├── AppDelegate.swift
    ├── SceneDelegate.swift
    └── Assets.xcassets/
```

---

## Data Flow

```
ViewController → ViewModel → Service → NetworkManager → QueryRequester → URLSession
                    ↑
             @Published property
             (Combine subscriber)
```

---

## Requirements

- Xcode 14+
- iOS 15+
- Swift 5

---

## How to Run

1. **Clone the repository**

```bash
git clone https://github.com/YOUR_USERNAME/starwars-app-uikit.git
cd starwars-app-uikit
```

2. **Open the project in Xcode**

```bash
open StarWars.xcodeproj
```

3. **Select a simulator or device**

   In Xcode, choose your target device from the scheme selector at the top.

4. **Run the app**

   Press `Cmd + R` or click the ▶ Run button.

> No additional setup or package installation is required — the project has no external dependencies.

---

## API

Character data is fetched from a public JSON feed:

```
https://raw.githubusercontent.com/phunware/dev-interview-homework/master/feed.json
```
