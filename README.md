# run localization
flutter pub run easy_localization:generate -S "assets/translations" -O "lib/translations" -o "locale_keys.g.dart"-f keys

# generate .g file 
dart run build_runner build
