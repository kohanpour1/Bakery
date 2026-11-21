# راهنمای استقرار Node.js روی cPanel / Docker Node 22


## وضعیت این بسته
این پروژه سرور Express و پایگاه‌داده SQLite را دارد. فایل‌های رابط کاربری `public/` در ZIP دریافت‌شده موجود نبودند؛ بدون آن‌ها رابط کاربری و محاسبه‌گر در مرورگر کامل نخواهد شد. پیش از استقرار عملی، پوشه `public/` نسخه اصلی شامل `index.html`، `app.js`، `style.css` و `calculator.html` را اضافه کنید.


## تنظیمات اجرا
- Node image: `node:22` / Debian Bookworm
- Start command: `npm start`
- Port: `3000` (یا PORT تعیین‌شده توسط میزبان)
- Host: `0.0.0.0`
- Health endpoint: `/health`
- Persistent data: پوشه `data/` را روی volume دائمی نگاشت کنید.


## متغیرهای محیطی لازم
- `NODE_ENV=production`
- `PORT` مقدار پورت اختصاص داده‌شده توسط میزبان
- `HOST=0.0.0.0`
- `BASE_PATH=/` برای نصب در ریشه دامنه
- `SESSION_SECRET` رشته تصادفی حداقل ۳۲ نویسه
- `ADMIN_USERNAME` نام کاربری مدیر (اختیاری؛ پیش‌فرض `kohanpour`)
- `ADMIN_INITIAL_PASSWORD` رمز اولیه قوی مدیر (در حالت production اجباری)
- `FORCE_ADMIN_PASSWORD_CHANGE=true`

در production سرور در صورت نبود یا کوتاه بودن SESSION_SECRET یا نبود ADMIN_INITIAL_PASSWORD اجرا نمی‌شود تا با تنظیم ناامن بالا نیاید.


## بررسی قبل از Deploy
1. `npm install`
2. `npm run check`
3. تنظیم environment variables بالا
4. اجرای `npm start`
5. تست `https://your-domain/health` و انتظار پاسخ JSON با `status: ok`
6. تأیید اینکه `data/` روی فضای دائمی است و در redeploy پاک نمی‌شود.

**مهم:** این ZIP فعلاً شامل سرور است و نه فایل‌های رابط کاربری. افزودن `public/` اصلی الزامی است.
