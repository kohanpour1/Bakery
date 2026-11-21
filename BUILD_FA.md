# راهنمای بیلد و CI

## بیلد محلی
1. Node.js نسخه 20 یا بالاتر را نصب کنید.
2. در ریشه پروژه اجرا کنید: `npm install`
3. بررسی Syntax: `node --check server.js` و `node --check public/app.js`
4. اجرای برنامه: `npm start`

## بیلد GitHub Actions
فایل `.github/workflows/build.yml` بررسی Syntax و ساخت Docker image را در هر Push به شاخه main/master انجام می‌دهد. پس از قرار دادن پروژه در GitHub و فعال بودن Actions، از تب Actions اجرای workflow را ببینید.

این workflow هنوز در GitHub اجرا نشده است؛ اجرای واقعی نیازمند Push به ریپو است.
