# **New 🎓**

**New** is a modern, fast, and lightweight Flutter news application built using  
**Clean Architecture, MVVM, and the Repository Pattern**.  
The app fetches real-time news using **API**, supports **caching**, **pagination**, **theming**, 
**search with debounce**, and article preview through an integrated **WebView**.

---

## ✨ **Features**

### **🔍 News Browsing**

- Fetch latest news dynamically from the API.
- Smooth pagination while scrolling.
- Displays loading, error, and empty states.
- Cached images using **cached_network_image**.

### **🔎 Search News**

- Real-time searching with **500ms debounce**.
- Dedicated search screen UI.
- Handles loading and error states.

### **🌐 Article Preview**

- Open full articles inside the app using **WebView**.
- Shows **Linear Progress Indicator** while loading.

### **🎨 Theming**

- **Light / Dark mode**.
- Theme saved using **SharedPreferences**.
- Managed by **Provider**.

### **📱 UI & UX Enhancements**

- Fully responsive UI using **ScreenUtil**.
- Custom **launcher icon**, **app name**, and **splash screen**.
- Entire app built in **one main page without navigation**.

---

## 🛠️ **Tech Stack**

- **Framework**: Flutter
- **Architecture**: Clean Architecture + MVVM
- **State Management**: Cubit (**flutter_bloc**)
- **Networking**: **Dio**, Interceptor, PrettyDioLogger
- **Local Storage**: Hive, SharedPreferences
- **Dependency Injection**: **Injectable + GetIt**
- **Responsive UI**: flutter_screenutil
- **Web Rendering**: webview_flutter
- **Environment Variables**: flutter_dotenv

---

## 📦 **Dependencies**

- `google_fonts` – Use custom fonts
- `flutter_screenutil` – Responsive UI
- `flutter_native_splash` – Custom splash screen
- `cached_network_image` – Efficient image caching
- `webview_flutter` – Display web pages inside the app
- `flutter_svg` – Render SVG images
- `get_time_ago` – Show human-readable time (e.g., 2 hours ago)
- `shared_preferences` – Store simple key-value data locally
- `flutter_bloc` – State management with Cubit/Bloc
- `connectivity_plus` – Check network connectivity
- `hive` – Local database for caching and storage
- `path_provider` – Access device directories
- `injectable` – Dependency injection generator
- `pretty_dio_logger` – Log Dio requests nicely
- `get_it` – Service locator for dependency injection
- `dio` – HTTP client for API calls
- `provider` – State management & theming support
- `flutter_dotenv` – Load environment variables from `.env` file
- `device_preview` – Test UI on different device sizes

### **Dev Dependencies**

- `flutter_test` – Unit & widget testing
- `flutter_lints` – Standard Flutter lint rules
- `hive_generator` – Code generator for Hive models
- `build_runner` – Run code generators
- `injectable_generator` – Generate DI boilerplate for Injectable

---

## 🚀 **Getting Started**

### **1️⃣ Clone the repository**

```bash
git clone https://github.com/AYAEMAD0/News_App.git
cd News_App
```

### **2️⃣ Install dependencies**

   ```bash
   flutter pub get
   ```

### **3️⃣ Generate injectable files**

 ```bash
flutter pub run build_runner build --delete-conflicting-outputs
  ```

### **4️⃣ Run the app**

   ```bash
   flutter run
   ```

---


**🏛️ Architecture**

The project is structured using Clean Architecture + MVVM
![Arch Diagram2](assets/screenshots/arch.png)

![Arch Diagram 1](assets/screenshots/flow.png)

---

## 🔐 **Environment Variables**

Create a `.env` file in the root directory:

```env
API_KEY=your_api_key_here
Used to protect secret API keys from being exposed publicly.
  ```

---
**🖼️ Screenshots**

## 🚀 Launcher & Splash

| Launcher                                     | Splash                                   |
|----------------------------------------------|------------------------------------------|
| ![Launcher](assets/screenshots/launcher.png) | ![Splash](assets/screenshots/splash.png) |

---

## Home

| Home Light                            | Home Dark                                  | Home Light                                | Home Dark                                      |
|---------------------------------------|--------------------------------------------|-------------------------------------------|------------------------------------------------|
| ![Home1](assets/screenshots/home.png) | ![Home2](assets/screenshots/home_dark.png) | ![Home3](assets/screenshots/home_two.png) | ![Home4](assets/screenshots/home_two_dark.png) |

---

## Drawer

| Drawer 1                                       | Drawer 2                                           | Drawer 3                                             |
|------------------------------------------------|----------------------------------------------------|------------------------------------------------------|
| ![Drawer1](assets/screenshots/home_drawer.png) | ![Drawer2](assets/screenshots/home_drawer_two.png) | ![Drawer3](assets/screenshots/home_drawer_three.png) |

---

## News

| News Light                                 | News Dark                                 | News handle image not found in Api                          |
|--------------------------------------------|-------------------------------------------|-------------------------------------------------------------|
| ![New1](assets/screenshots/news_light.png) | ![New2](assets/screenshots/news_dark.png) | ![New3](assets/screenshots/news_handle_image_not_found.png) |

| News Caching without internet                 | News Pagination                                  | News handle error                                  |
|-----------------------------------------------|--------------------------------------------------|----------------------------------------------------|
| ![News4](assets/screenshots/news_caching.png) | ![News5](assets/screenshots/news_pagination.png) | ![News6](assets/screenshots/news_handle_error.png) |

---

## Bottom Sheet

| Bottom Sheet Light Theme                                  | Bottom Sheet Dark Theme                                   |
|-----------------------------------------------------------|-----------------------------------------------------------|
| ![Bottom Sheet1](assets/screenshots/bottom_sheet_one.png) | ![Bottom Sheet2](assets/screenshots/bottom_sheet_two.png) |

---

## Webview

| Webview Loading                                 | Webview half Loading                            | Webview Loading finish                            | 
|-------------------------------------------------|-------------------------------------------------|---------------------------------------------------|
| ![Webview1](assets/screenshots/webview_one.png) | ![Webview2](assets/screenshots/webview_two.png) | ![Webview3](assets/screenshots/webview_three.png) | 

---

## Search

| Search Initial                                | Search Result Dark                            | Search Result Light                             |
|-----------------------------------------------|-----------------------------------------------|-------------------------------------------------|
| ![Search1](assets/screenshots/search_one.png) | ![Search2](assets/screenshots/search_two.png) | ![Search3](assets/screenshots/search_three.png) |

| Search not found                               | Search Loading                                 | Search Clear Button                             |
|------------------------------------------------|------------------------------------------------|-------------------------------------------------|
| ![Search4](assets/screenshots/search_four.png) | ![Search5](assets/screenshots/search_five.png) | ![Search6](assets/screenshots/search_clear.png) |

---

**👩‍💻 Author**
Developed by **Aya Emad**

* [GitHub](https://github.com/AYAEMAD0)
* [LinkedIn](https://www.linkedin.com/in/aya-emad1/)
