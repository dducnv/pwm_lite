# CyberSafe - Open Source Offline Password Manager

![CyberSafe Logo](https://lh3.googleusercontent.com/AmTkIuE2n6Nj2HcTBWn-2rfrvq9vAmU-LhJZtZeekp3a5M5pTqSjp0L4SB-DgMXGBEo)

## Introduction

Welcome to CyberSafe, the open-source offline password management application designed to securely store and organize your login information. CyberSafe operates entirely offline, ensuring that your data remains protected from online threats and breaches.

**Download CyberSafe on Google Play: [CyberSafe on Google Play](https://play.google.com/store/apps/details?id=com.duc_app_lab_ind.cybersafe_lmt)**

## Features

### **Application Security**
- **PIN Application Lock:** Protect your app with a PIN to prevent unauthorized access.
- **Biometric Unlocking:** Use fingerprint or facial recognition for quick and secure access.
- **Screen Capture Prevention:** Disable screenshots to enhance privacy.
- **Automatic Logout:** Configure automatic logout after a preset time to secure your data.

### **Data Categorization**
- **Category Filter:** Easily search and manage your data with an optimized category filter.
- **Quick Category Addition:** Add and manage categories directly from the homepage.

### **Custom Information**
- **Custom Data Fields:** Add and organize extra data fields tailored to your needs.

### **Automatic Password Generation**
- **Password Generator Tool:** Create strong and secure passwords with our modern and intuitive password generator.

### **Backup and Restore**
- **Local Data Storage:** All data is stored on your device.
- **Encrypted Backup:** Create encrypted backup files for easy device transitions.
- **PIN Protection for Backup:** Secure your backup files with a PIN for added safety.
- **Restoration:** Restore your data seamlessly by entering the PIN.

### **Browser Data Integration**
- **CSV Import:** Export passwords from modern browsers and import them into CyberSafe for easy data migration.

## Build and Usage

### **Clone the Repository**
```bash
git clone https://github.com/dducnv/pwm_lite.git
cd pwm_lite
```

### **Create .env File**
```env
PIN_CODE_ENCRYPT_KEY=
INFO_ENCRYPT_KEY=
PASSWORD_ENCRYPT_KEY=
FILE_ENCRYPT_KEY=

OLD_PIN_CODE_ENCRYPT_KEY=
OLD_INFO_ENCRYPT_KEY=
OLD_PASSWORD_ENCRYPT_KEY=
OLD_FILE_ENCRYPT_KEY=

DATETIME_CHANGE_KEY=

VERSION_KEY=
```

### **Generate Obfuscate Key & Database Entity**
```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### **Install Pub to run**
```bash
flutter pub get
```

### **Build Release**
```bash
flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --obfuscate --split-debug-info=/app_build_log
```

### *Contact**
For support or inquiries, please reach out to us at contact.ducnv@gmail.com.

Thank you for choosing CyberSafe, and stay secure!



