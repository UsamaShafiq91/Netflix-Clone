
# 🎬 Netflix Clone

A fully functional Netflix-style iOS app built using **Swift**, powered by **TMDB API**, leveraging **Alamofire**, **UIKit**, and **CocoaPods**.

---

## Table of Contents

1. [Overview](#overview)  
2. [Features](#features)  
3. [Technologies Used](#technologies-used)  
4. [App Structure](#app-structure)  
5. [Setup & Installation](#setup--installation)  
6. [Usage](#usage)  
7. [Contributing](#contributing)  
8. [License](#license)  
9. [Author](#author)

---

## Overview

This app replicates core Netflix features for iOS:

- 👀 Browse trending movies and series  
- 🎞 View detailed info: plot, trailer, cast  
- 📺 Explore seasons and episodes for TV shows  
- 🌐 Fetch real-time data using TMDB’s REST API

  ### 📸 Screenshots
  ![Simulator Screenshot - iPhone 15 - 2025-07-05 at 12 59 45](https://github.com/user-attachments/assets/69a6ab85-416a-446b-808f-269f69f7508e)
  ![Simulator Screenshot - iPhone 15 - 2025-07-05 at 12 59 56](https://github.com/user-attachments/assets/982fa8f8-9b9b-4eaa-99fc-1c9d527e84b0)
  ![Simulator Screenshot - iPhone 15 - 2025-07-05 at 13 00 04](https://github.com/user-attachments/assets/3daf386c-e4fe-4966-bb61-9c94a77d273e)
  ![Simulator Screenshot - iPhone 15 - 2025-07-05 at 13 00 17](https://github.com/user-attachments/assets/86148527-b39b-4a37-8ca7-a7270373214a)
  ![Simulator Screenshot - iPhone 15 - 2025-07-05 at 13 00 28](https://github.com/user-attachments/assets/b8b61bf9-8109-4fd4-b28a-fd8739d0c6dd)
  ![Simulator Screenshot - iPhone 15 - 2025-07-05 at 13 00 33](https://github.com/user-attachments/assets/42ed9b08-c89c-441f-8003-a1d9812443b6)
  

---

## Features

- **Discover screen** – horizontal scrolling lists by genre  
- **Detail view** – includes synopsis, cast roster, and embedded trailers  
- **Series view** – navigate seasons, view episodes  
- **Search functionality** – (if available in code)  
- **Responsive UI** – built with `UITableView`, `UICollectionView`, and Auto Layout  

---

## Technologies Used

- **Swift & UIKit**  
- **CocoaPods** – for dependency management  
- **Alamofire** – network layer  
- **TMDB API** – movie and show data  
- **UIKit components** – `UITableView`, `UICollectionView`, `AVKit` (trailers)  
- **Auto Layout** – adaptable UI  

---

## App Structure

```
Netflix-Clone/
├── Netflix-Clone.xcworkspace
├── Netflix-Clone.xcodeproj
├── Netflix-Clone/
│   ├── Models/
│   ├── Views/
│   │   ├── Cells/
│   │   └── Detail Views/
│   ├── ViewControllers/
│   ├── Network/
│   └── Resources/
├── Pods/…
└── Tests/
```

- **Network**: Contains `APIClient.swift` (Alamofire) and TMDB models.  
- **ViewControllers**: Includes the Discover feed, Detail, and Series screens.  
- **Views**: Custom table/collection view cells.  
- **Pods**: Installed with CocoaPods.

---

## Setup & Installation

1. **Clone the repo**  
   ```bash
   git clone https://github.com/UsamaShafiq91/Netflix-Clone.git
   cd Netflix-Clone
   ```

2. **Install CocoaPods dependencies**  
   ```bash
   pod install
   ```

3. **Open the workspace**  
   ```bash
   open Netflix-Clone.xcworkspace
   ```

4. **TMDB API Key**  
   - Sign up at [TMDB](https://www.themoviedb.org/)  
   - In `Network/APIClient.swift`, replace `"YOUR_API_KEY"` with your actual TMDB API key.

5. **Build and run**  
   Choose a simulator or device and run via Xcode (`⌘R`).

---

## Usage

1. 📱 Launch app – “Discover” screen shows movies by category.  
2. 🔍 Tap any item to view details, play trailer (if available), and browse cast.  
3. 📺 For TV shows, navigate seasons and tap episodes for details.

```swift
let movie = Movie(
  id: 12345,
  title: "Inception",
  overview: "A thief who steals corporate secrets …",
  posterPath: "/qmDpIHrmpJINaRKAfWQfftjCdyi.jpg",
  trailerURL: URL(string: "https://youtu.be/YoHD9XEInc0")
)
showDetail(for: movie)
```

---

## Contributing

Contributions are welcomed!  
To contribute:

1. Fork this repo  
2. Create a new feature branch (`git checkout -b feature/...`)  
3. Commit your changes (`git commit -am 'Add some feature'`)  
4. Push to your branch (`git push origin feature/...`)  
5. Submit a Pull Request  

Please follow standard Swift style conventions and include meaningful commit messages.

---

## License

This project is provided for educational purposes and does not claim ownership of TMDB data or Netflix trademarks.  
Feel free to use and modify it—but please don’t redistribute proprietary assets.

---

## Author

**Usama Shafiq**  
- GitHub: [UsamaShafiq91](https://github.com/UsamaShafiq91)  
- Feel free to reach out via GitHub Discussions or Issues for questions or feedback.

---

*Made with 💜 using Swift & TMDB API*
