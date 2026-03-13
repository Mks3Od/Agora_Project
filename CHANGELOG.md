# CHANGELOG.md

## Issues:

> Issue 1

FAILURE: Build failed with an exception.

- Where:
  Script 'C:\Users\Manish\develop\flutter\packages\flutter_tools\gradle\app_plugin_loader.gradle' line: 9

- What went wrong:
  A problem occurred evaluating script.
  You are applying Flutter's app_plugin_loader Gradle plugin imperatively using the apply script method, which is not possible anymore. Migrate to applying Gradle plugins with the declarative plugins block: https://flutter.dev/to/flutter-gradle-plugin-apply

- Try:
  Run with --stacktrace option to get the stack trace.
  Run with --info or --debug option to get more log output.
  Run with --scan to get full insights.
  Get more help at https://help.gradle.org.

BUILD FAILED in 1s

> Issue 2

Warning: Flutter support for your project's Kotlin version (1.9.10) will soon be dropped. Please upgrade your Kotlin version to a version of at least 2.1.0 soon.
Alternatively, use the flag "--android-skip-build-dependency-validation" to
bypass this check.

Potential fix: Your project's KGP version is typically defined in the plugins block of the `settings.gradle` file (C:\Users\Manish\develop\projects\agora_rtc_engine-6.5.2\example\android/settings.gradle), by a plugin with the id of org.jetbrains.kotlin.android.
If you don't see a plugins block, your project was likely created with an older template version, in which case it is most likely defined in the top-level build.gradle file (C:\Users\Manish\develop\projects\agora_rtc_engine-6.5.2\example\android/build.gradle) by the ext.kotlin_version property.

FAILURE: Build failed with an exception.

- Where:
  Build file 'C:\Users\Manish\develop\projects\agora_rtc_engine-6.5.2\example\android\app\build.gradle' line: 70

- What went wrong:
  A problem occurred evaluating project ':app'.

  > Could not get unknown property 'kotlin_version' for object of type org.gradle.api.internal.artifacts.dsl.dependencies.DefaultDependencyHandler.

- Try:
  > Run with --stacktrace option to get the stack trace.
  > Run with --info or --debug option to get more log output.
  > Run with --scan to get full insights.
  > Get more help at https://help.gradle.org.

BUILD FAILED in 2m 3s
