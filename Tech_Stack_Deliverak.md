# 1. State Management 

Tool: flutter_bloc (specifically Cubit). 

Reason: We chose Cubit because it's lighter and simpler than a full block for handling events. This keeps our code clean and makes it easier to manage UI states (Loading, Success, Error), which we agreed are essential for error handling. 

# 2. Backend Communication (Data & Network Layer) 

Tool: supabase_flutter. 

Reason: We'll be using the official Supabase SDK. It handles PostgreSQL, supports real-time, and manages authentication perfectly. 

Architecture: We'll use a Repository Pattern to isolate the UI from any Supabase-specific details (if we decide to change the backend later, the UI won't be affected). 

# 3. Dependency Injection 

Tool: get_it. Reason: We'll use it in injection_container.dart to perform lazy registration for Cubits and Repositories, which conserves memory on less powerful phones. 

# 4. Security Stack 

Data Storage: flutter_secure_storage (for tokens and sensitive data). 

Connection Protection: Implementing SSL Pinning to ensure the application only communicates with our Supabase servers. 

Code Protection: Enabling Obfuscation during the Release Build. 

# 5. Error Handling 

Logical Handling: We'll create custom exceptions for each feature (such as AuthException and 

OrderException). 

UI Handling: We'll create a FailureHandler class in the core that takes the exception and converts it into an Arabic text message displayed to the client in the Snackbar or Dialog. Monitoring: firebase_crashlytics (to immediately detect if the application crashes for any customer in Abu Qurqas). 

# 6. Notifications & Maps 

Map: google_maps_flutter (to locate the customer and sales representative). 

Notifications: firebase_messaging (to send instant notifications even when the application is closed). 

Summary of the structure we will follow: 

Technical Layers Language: Dart UI Framework: Flutter 

State Management: Cubit 

Backend: Supabase (PostgreSQL) 

Dependency Injection: GetIt 

Network: Supabase SDK + Custom Interceptors 

Local Storage: Flutter Secure Storage 

Monitoring: Firebase Crashlytics 

Now we have: 

Folder Structure (by dividing the main system). 

User Stories (detailed for each application). 

Project Roadmap (implementation plan). 

Tech Stack (the tools we will build with). 

