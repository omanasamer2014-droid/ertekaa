const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

// استقبل البيانات هنا
app.post('/register', (req, res) => {
    console.log("بيانات التسجيل:", req.body);
    // هنا تكتب كود حفظ البيانات في قاعدة البيانات
    res.json({ success: true });
});

app.post('/login', (req, res) => {
    console.log("بيانات الدخول:", req.body);
    // هنا تكتب كود التحقق من قاعدة البيانات
    res.json({ success: true });
});

app.listen(2020, () => console.log('السيرفر يعمل الآن على بورت 2020'));
