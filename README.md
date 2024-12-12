# Deep Live Cam Flutter Package Documentation

Welcome to the **Deep Live Cam** Flutter package documentation. This package allows you to easily integrate real-time image processing, image to image processing, video to image and image to video processing or transformations into your Flutter apps. This guide will walk you through how to get started, use the package, and explore the available features.

## Table of Contents

- [Introduction](#introduction)
- [Getting Started](#getting-started)
- [Installation](#installation)
- [Usage](#usage)
  - [Real-Time Image Processing](#real-time-image-processing)
  - [Image-to-Image Processing](#image-to-image-processing)
  - [Video-to-Image Processing](#video-to-image-processing)
- [API Reference](#api-reference)
  - [DeepLiveCam Class](#deeplivecam-class)
  - [Methods](#methods)
  - [Callbacks](#callbacks)
- [Example](#example)
- [FAQ](#faq)
- [License](#license)

---

## Introduction

**Deep Live Cam** is a Flutter package designed for deep learning-based image and video processing. Whether you're building an app for real-time image processing, video processing, or transforming images, this package provides all the tools you need.

### Key Features:
- **Real-Time Image Processing** 
- **Image-to-Image Processing** 
- **Video-to-Image Processing** 

---

## Getting Started

Before you start using the package, ensure you have a Flutter environment set up. You can find instructions on how to set up Flutter on the [official Flutter website](https://flutter.dev/docs/get-started/install).

### Installation

1. **Add Dependency**  
   Add `deep_live_cam` as a dependency in your `pubspec.yaml` file:

   ```yaml
   dependencies:
     deep_live_cam: ^1.0.0
   ```

2. **Install the Package**  
   Run the following command in your project directory:

   ```bash
   flutter pub get
   ```

3. **Import the Package**

   Import the package in your Dart files:

   ```dart
   import 'package:deep_live_cam/deep_live_cam.dart';
   ```

---

## Usage

Now that you've installed the package, let’s walk through how to use it in your Flutter application.

Before you can start using the Deep Live Cam Flutter package, you'll need to follow these steps:
1. Create an Application on flutterdeeplivecam.com

    Go to the flutterdeeplivecam.com website.
    Sign up or log in to your account.
    Navigate to the Dashboard.
    Create a new application by providing a name and description for your app.
    Once your app is created, you'll be provided with an API Key.

This API key will be used to authenticate your requests and access the image and video processing services.

2. Add the API Key to Your Flutter Application

Once you have your API key, you need to add it to your Flutter project. Here’s how:

    Open your pubspec.yaml file and add the API key under the Deep Live Cam configuration section:

dependencies:
  deep_live_cam: ^1.0.0

flutter:
  deep_live_cam:
    api_key: "YOUR_API_KEY"

Replace "YOUR_API_KEY" with the API key you generated on the flutterdeeplivecam.com website.

    Run the following command to install the dependencies:

flutter pub get

3. Start Using Deep Live Cam in Your Application

Now that you have the API key set up, you can begin using Deep Live Cam in your app. 

#### Example:

```dart
import 'package:flutter/material.dart';
import 'package:deep_live_cam/deep_live_cam.dart';

//TODO
```

### Image-to-Image Processing

Apply transformations to captured images, using deep learning models.

```dart
//TODO
```

### Video-to-Image Processing

Extract frames from a video and apply image processing on each frame.

```dart
//TODO
```

## API Reference

### DeepLiveCam Class

The `DeepLiveCam` class is the main entry point for using the package. It provides methods for starting and stopping camera feed, processing images, and handling real-time events.

#### Methods:
- **`startProcessing()`**  
  Starts the camera feed and begins real-time image processing.
  
- **`stopProcessing()`**  
  Stops the camera feed and halts the real-time processing.

- **`processImage(Image image)`**  
  Applies an image-to-image transformation to a captured image.

- **`extractFramesFromVideo(File videoFile)`**  
  Extracts frames from a video file.

- **`processImagesToVideo(List<File> imageFiles)`**  
  Converts a series of images into a video.

  // TODO
  

#### Callbacks:
- **`onFrameProcessed`**  
  Triggered when a frame from the camera feed has been processed. This callback can be used to update the UI or apply transformations.

- **`onFaceDetected`**  
  Triggered when faces are detected in the camera feed.

//TODO

---

## Example

Here is a complete example that demonstrates how to use **Deep Live Cam** for real-time image processing and face detection:

```dart
import 'package:flutter/material.dart';
import 'package:deep_live_cam/deep_live_cam.dart';

//TODO

---

## FAQ

//TODO


---

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---
