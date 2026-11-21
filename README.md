# Bakery Time Online (پایش عملکرد کارکنان)

نسخه وب مستقل برای مدیریت کاربران و وظایف، ثبت تاریخچه، گزارش مدیریتی و اجرای محاسبه‌گر ساعت کاری نسخه ۵.

## وضعیت سورس دریافتی
ZIP اولیه شامل `server.js` و تنظیمات استقرار بود، اما پوشه `public/` (رابط کاربری شامل `index.html`, `app.js`, `style.css`, `calculator.html`) در آن وجود نداشت. این نسخه سرور را برای استقرار Node 22 اصلاح می‌کند؛ برای اجرای کامل، فایل‌های رابط کاربری اصلی را در `public/` قرار دهید.


## اجرای محلی
1. Node.js 22 نصب کنید.
2. `npm install`
3. برای اجرای توسعه: `npm run dev`
4. برای اجرا: `npm start`
5. بررسی syntax: `npm run check`

## cPanel / Node 22
- Image: `node:22-bookworm-slim` (Dockerfile شامل ابزارهای build برای `better-sqlite3` است)
- Start command: `npm start`
- Host: `0.0.0.0`
- Port: `PORT` محیطی میزبان (fallback: 3000)
- Health check: `/health`
- Storage: پوشه `data/` باید روی volume دائمی باشد.
- جزئیات تنظیم متغیرها در `CPANEL_NODE_DEPLOY_FA.md`.

## تنظیمات Production
`SESSION_SECRET` باید حداقل ۳۲ نویسه و `ADMIN_INITIAL_PASSWORD` باید به صورت محیطی تنظیم شود؛ سرور در production با مقدار ناقص اجرا نمی‌شود. مدیر با `ADMIN_USERNAME` (پیش‌فرض `kohanpour`) ساخته می‌شود و تغییر رمز اولیه اجباری است، مگر اینکه `FORCE_ADMIN_PASSWORD_CHANGE=false` تنظیم شود.

## Docker
1. `.env.example` را به `.env` کپی کنید و مقادیر امن واقعی را تنظیم کنید.
2. `docker compose up -d --build`
3. داده‌ها را در `data/` نگه دارید و از آن پشتیبان تهیه کنید.

## نکات امنیتی
- رمز کاربران با bcrypt هش می‌شود.
- نشست HttpOnly و SameSite=Lax است؛ در Production کوکی Secure می‌شود.
- کنترل دسترسی مدیر در API اعمال می‌شود.
- از `SESSION_SECRET` و رمز اولیه مدیر امن استفاده کنید. فایل `.env` را در Git قرار ندهید.
