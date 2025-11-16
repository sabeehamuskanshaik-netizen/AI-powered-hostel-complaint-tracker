AI-Powered Hostel Complaint Tracker
A full-stack complaint management system built for the hostel structure of VIT-AP, enhanced with Google Vision AI for automated image-based complaint detection.
This project includes:
1. A Flutter mobile app for students
2. A Node.js + Express backend
3. A MongoDB database
4. A React panel used for processing images through Google Vision API

📱 Mobile App (Flutter)

The Flutter app allows students to:

1. File new complaints
2. Attach photos for automated category detection (via Google Vision)
3. Track complaint status
4. View complaint history
Fast, clean UI built with Material widgets

🧑‍🏫 Warden Module
Wardens get a filtered view of complaints based on their assigned block.
They can:
1. View complaints belonging to their block only
2. Update complaint status (In Progress, Completed, etc.)
3. Monitor student issues quickly
4. Ensure faster problem resolution
This makes the system practical for real hostel operations.

Tech Stack (Frontend – Flutter)
>Flutter
>Dart
>REST API integration
>Google Vision API support (indirectly through your React panel)

Run the Flutter App
cd prjapp
flutter pub get
flutter run

🧠 Google Vision Feature (React Panel)
A lightweight React interface used to:
>Send images to Google Vision API
>Detect labels / text / categories
>Return the extracted data to the Flutter app

Tech Stack (React Panel)
>React
>JavaScript
>Google Cloud Vision API


🗄 Backend (Node.js + Express)
The backend handles:
1. Complaint creation
2. Complaint status updates
3. Fetching complaints per student
4. Connecting to MongoDB

Tech Stack (Backend)
>Node.js
>Express.js
>MongoDB 

Make sure MongoDB is running locally or connected through Atlas.

🗂 Project Structure
AI-powered-hostel-complaint-tracker/
│
├── flutter_app/            # Flutter mobile application
│
├── Backend/                # Node.js + Express API server
│
└── VisionPanel/            # React panel for Google Vision AI


🚀 Key Features
>Full-stack architecture
>AI-powered complaint classification
>Clean mobile UI
>Real-time complaint tracking
>Scalable backend with MongoDB
>React-based Google Vision processing panel

🎯 Future Enhancements
Push notifications
Admin dashboard (React or Flutter Web)
Analytics: frequency of complaints, hotspot detection
Automated assignment of complaints to hostel wardens

📸 Screenshots
![UI 1]![UI 2](https://github.com/user-attachments/assets/dd1bb547-aa25-4be1-8660-d4fd62e7d667)
(https://github.com/user-attachments/assets/e02f2161-e07d-4da0-8d67-d24db36306d3)
![Uploading UI 2.jpeg…]()
![UI 3](https://github.com/user-attachments/assets/8a2be23c-d4c8-4dea-91b2-62ceab5f4295)



📧 Contact
sabeehamuskanshaik@gmail.com
For collaboration or improvements, feel free to reach out.
