# 🚀 Deliverak (ديليفرك) - Hyperlocal Marketplace System

سيستم متكامل لإدارة خدمات التوصيل والطلب (مطاعم، صيدليات، سوبر ماركت) مخصص لخدمة أهالي **المنيا وأبو قرقاص**. السيستم مبني باستخدام **Flutter** للموبايل والويب، ويعتمد على **Supabase** كباكيند مأمن وقاعدة بيانات لحظية (Real-time).

---

## 📱 هيكل التطبيقات الأربعة (System Architecture)
يتكون المشروع من 4 تطبيقات منفصلة تماماً، تشترك جميعها في نفس الباكيند:

1. **`deliverak_customer`**: تطبيق العميل لتصفح المحلات، المنيو، الطلب، وتتبع الكابتن لايف.
2. **`deliverak_driver`**: تطبيق الكابتن لاستقبال الطلبات وتحديث حالتها وتتبع الخرائط.
3. **`deliverak_merchant`**: تطبيق التاجر (صاحب المحل) لإدارة المنيو، قبول الطلبات، ومتابعة المبيعات.
4. **`deliverak_admin`**: لوحة تحكم الأدمن (Flutter Web) لمراقبة النظام، قبول المحلات والكباتن، وإدارة الحسابات.

---

## 🛠️ التكنولوجي ستاك المعتمد (Tech Stack)

* **Frontend**: Flutter (Dart) - يعتمد على هندسة **Feature-First Clean Architecture**.
* **State Management**: Cubit / Bloc (`flutter_bloc`).
* **Routing**: `go_router` لإدارة التنقل والـ Deep Linking.
* **Backend & Database**: **Supabase (PostgreSQL)** مع تفعيل الـ Realtime لتتبع الطلبات.
* **Security**: تفعيل **Row Level Security (RLS)** كاملاً لحماية البيانات + تشفير التوكنز محلياً عبر `flutter_secure_storage`.

---

## 🔒 إعدادات البيئة والأمان (Environment Setup)

لحماية مفاتيح الربط في مرحلة البرودكشن، يعتمد كل تطبيق على ملف بيئة محلي `.env` **(مخفي ولا يتم رفعه على GitHub)**.

### خطوت البدء والتشغيل:

1. قم بإنشاء ملف باسم `.env` في الفولدر الرئيسي لـ **كل تطبيق** (جنب ملف `pubspec.yaml`).
2. أضف البيانات التالية داخل الملف:
```env
SUPABASE_URL=[https://hexclihkpccgempnniks.supabase.co](https://hexclihkpccgempnniks.supabase.co)
SUPABASE_ANON_KEY=your_supabase_anon_public_key