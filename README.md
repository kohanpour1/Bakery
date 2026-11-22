# Bakery Time Online (پایش عملکرد کارکنان)

نسخه وب مستقل برای مدیریت کاربران و وظایف، ثبت تاریخچه، گزارش مدیریتی و اجرای محاسبه‌گر ساعت کاری نسخه ۵.

## اجرای محلی
1. Node.js 22 نصب کنید.
2. `npm install`
3. برای اجرای توسعه: `npm run dev`
4. برای اجرا: `npm start`
5. بررسی syntax: `npm run check`

## cPanel / Node 22
- Image: `node:22-bookworm-slim`
- Start command: `npm start`
- Host: `0.0.0.0`
- Port: `PORT` (پیش‌فرض: 3000)
- Health check: `/health`
- Storage: پوشه `data/` روی volume دائمی

## Docker
1. `.env.example` را به `.env` کپی کنید.
2. `docker compose up -d --build`

## امنیت
- رمز با bcrypt
- نشست HttpOnly / SameSite=Lax
- فایل `.env` را در Git قرار ندهید.
