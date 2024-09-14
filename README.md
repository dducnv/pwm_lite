# cyber_safe

build release

flutter build appbundle --target-platform android-arm,android-arm64,android-x64 --obfuscate --split-debug-info=/app_build_log

# check outdate pub

flutter pub outdated

# Run app

`run flutter pub get`

1. create .env to root folder
  content env:

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

  VERSION_KEY=1
  ```

- genarate key & database entity
`dart run build_runner clean`
`dart run build_runner build --delete-conflicting-outputs`
