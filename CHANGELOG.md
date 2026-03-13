# CHANGELOG.md

## Issues:

> Issue 1

---

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

---

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

> Issue 3

---

Your project is configured to compile against Android SDK 34, but the following plugin(s) require to be compiled against a higher Android SDK version:

- path_provider_android compiles against Android SDK 36
  Fix this issue by compiling against the highest Android SDK version (they are backward compatible).
  Add the following to C:\Users\Manish\develop\projects\agora_rtc_engine-6.5.2\example\android\app\build.gradle:

      android {
          compileSdk = 36
          ...
      }

  warning: [options] source value 8 is obsolete and will be removed in a future release
  warning: [options] target value 8 is obsolete and will be removed in a future release
  warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
  3 warnings
  warning: [options] source value 8 is obsolete and will be removed in a future release
  warning: [options] target value 8 is obsolete and will be removed in a future release
  warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
  3 warnings
  warning: [options] source value 8 is obsolete and will be removed in a future release
  warning: [options] target value 8 is obsolete and will be removed in a future release
  warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
  C:\Users\Manish\AppData\Local\Pub\Cache\hosted\pub.dev\permission_handler_android-10.3.6\android\src\main\java\com\baseflow\permissionhandler\PermissionHandlerPlugin.java:28: error: cannot find symbol
  @Nullable private io.flutter.plugin.common.PluginRegistry.Registrar pluginRegistrar;
  ^
  symbol: class Registrar
  location: interface PluginRegistry
  C:\Users\Manish\AppData\Local\Pub\Cache\hosted\pub.dev\permission_handler_android-10.3.6\android\src\main\java\com\baseflow\permissionhandler\PermissionHandlerPlugin.java:47: error: cannot find symbol
  public static void registerWith(io.flutter.plugin.common.PluginRegistry.Registrar registrar) {
  ^
  symbol: class Registrar
  location: interface PluginRegistry
  2 errors
  3 warnings

FAILURE: Build failed with an exception.

- What went wrong:
  Execution failed for task ':permission_handler_android:compileDebugJavaWithJavac'.

  > Compilation failed; see the compiler error output for details.

- Try:
  > Run with --info option to get more log output.
  > Run with --scan to get full insights.

BUILD FAILED in 2m 17s
Running Gradle task 'assembleDebug'... 138.0s

Flutter Fix

[!] Consult the error logs above to identify any broken plugins, specifically those containing "error: cannot ││ find symbol..." ││ This issue is likely caused by v1 embedding removal and the plugin's continued usage of removed references to the ││ v1 embedding. ││ To fix this error, please upgrade your current package's dependencies to latest versions by running `flutter pub  ││ upgrade`. ││ If that does not work, please file an issue for the problematic plugin(s) here: ││ https://github.com/flutter/flutter/issues

Error: Gradle task assembleDebug failed with exit code 1

> Issue 4

---

warning: [options] source value 8 is obsolete and will be removed in a future release
warning: [options] target value 8 is obsolete and will be removed in a future release
warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
3 warnings
warning: [options] source value 8 is obsolete and will be removed in a future release
warning: [options] target value 8 is obsolete and will be removed in a future release
warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
3 warnings
warning: [options] source value 8 is obsolete and will be removed in a future release
warning: [options] target value 8 is obsolete and will be removed in a future release
warning: [options] To suppress warnings about obsolete options, use -Xlint:-options.
C:\Users\Manish\AppData\Local\Pub\Cache\hosted\pub.dev\permission_handler_android-10.3.6\android\src\main\java\com\baseflow\permissionhandler\PermissionHandlerPlugin.java:28: error: cannot find symbol
@Nullable private io.flutter.plugin.common.PluginRegistry.Registrar pluginRegistrar;
^
symbol: class Registrar
location: interface PluginRegistry
C:\Users\Manish\AppData\Local\Pub\Cache\hosted\pub.dev\permission_handler_android-10.3.6\android\src\main\java\com\baseflow\permissionhandler\PermissionHandlerPlugin.java:47: error: cannot find symbol
public static void registerWith(io.flutter.plugin.common.PluginRegistry.Registrar registrar) {
^
symbol: class Registrar
location: interface PluginRegistry
2 errors
3 warnings

FAILURE: Build failed with an exception.

- What went wrong:
  Execution failed for task ':permission_handler_android:compileDebugJavaWithJavac'.

  > Compilation failed; see the compiler error output for details.

- Try:
  > Run with --info option to get more log output.
  > Run with --scan to get full insights.

BUILD FAILED in 20s
Running Gradle task 'assembleDebug'... 20.9s

Error: Gradle task assembleDebug failed with exit code 1
