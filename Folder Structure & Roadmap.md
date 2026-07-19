1. The updated Folder Structure (dividing the Main) 

Plaintext 

lib/ 

├── core/ # Common needs 

│ ├── constants/ # API Keys, URLs, Theme constants 

│ ├── errors/ # Custom Exceptions & Failures 

│ ├── network/ # Supabase Client, Interceptors, Connection Checker 

│ ├── security/ # Encryption, Secure Storage 

│ └── utils/ # Validators, Formatters, Helpers 

├── features/ # Features (Customer, Driver, Vendor) 

│ ├── customer/ # A complete folder for the customer 

│ ├── driver/ # A complete folder for the delegate 

- │ └── vendor/ # A complete folder for the merchant 

│ └── [feature_name]/ # Same internal division (data, domain, presentation) 

├── main_config.dart # [new] Responsible for configuring everything (Supabase, Firebase, Injection, Crashlytics) 

├── main.dart # [New] Only responsible for running the App (runApp) after verifying the configuration 

└── app.dart # MaterialApp and Routing 

2. Detailed User Stories (for each application separately) 

Customer App 

Authentication: 

As a user, I want to log in with my mobile number + OTP code, to ensure the security of my account. 

Browse & Search: 

As a user, I want to browse the sections (food, pharmacy, vegetables), in order to quickly access the service. 

As a user, I want to search by name and filter by price, to find what fits my budget. 

# Checkout: 

As a user, I want to add products to the cart and check the final price including delivery, in order to avoid any hidden costs. 

Tracking: 

As a user, I want to track the representative on a map in real time, so I know when my order arrives. 

# Driver App 

Shift Management: 

As a delegate, I want to change my status to "Online" in order to receive requests. 

Order Handling: 

As a delegate, I want to receive a new order notification with the distance and cost, so I can decide whether to accept the order. 

Navigation & Delivery: 

As a representative, I want to open the map to go to the customer's address, in order to arrive as quickly as possible. 

Vendor Dashboard 

Order Management: 

As a merchant, I want a list of new orders, so I can start processing them. 

MenuControl: 

As a merchant, I want to update the product status (available/unavailable), so that the customer does not order something that does not exist. 

3. Roadmap from scratch for the “first user” 

The first stage (Setup): 

Setting main_config.dart and main.dart. 

Connect Supabase to main_config and activate RLS. 

The second stage (Auth Module): 

Building the Auth Feature in the client application (the first thing we need to finish). 

The third stage (MVP Core): 

Build tables of vendors, products, and orders. 

Cart Logic works. 

The fourth stage (Integration): 

Connect realtime to follow up on orders. 

The fifth stage (Testing & Go-Live): 

Try the application (we make a “test order” from your mobile phone to the representative, and make sure that the merchant receives it). 

4. Golden tips for Security & Error Handling 

Security: Use Row Level Security (RLS) in Supabase for each table, encrypt storage data with flutter_secure_storage. 

Error Handling: 

Use custom Dio Interceptors or Supabase Exceptions. 

Any error that appears to the user must be an understandable text message in Arabic. 

Use Firebase Crashlytics to track errors in the release version. 

This file is our basic reference to start implementing "Deliverak". 

