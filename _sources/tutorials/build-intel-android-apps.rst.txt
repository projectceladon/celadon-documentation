.. _build-intel-android-apps:

Building Intel Platform-Friendly Android Apps
#############################################

Preface
*******

With the booming development of mobile devices, such as mobile phones,
Android-based mobile applications have achieved great success. In recent
years, the growth of mobile phone users has slowed down, and the market
has become increasingly saturated. In addition to the impact of the
epidemic, China's domestic smartphone sales fell by 14-18% year-on-year.
This information from the mobile phone market report for the first
quarter of 2022 released by research institutions such as IDC,
Counterpoint, CINNO Research, and Canalys also reported that global data
also fell 11% year-on-year. But we're also seeing the boundaries of
Android app services expand into new markets, such as cloud, edge, and
desktop clients:

- In the cloud, Android applications begin to serve cloud games, office
  cloud phones, cloud testing, and other scenarios.

- IoT devices also provide a convenient interactive experience based on
  Android, such as car entertainment systems, retail vending machines,
  etc.;

- On the computer client side, software and hardware manufacturers such
  as Microsoft (Windows 11 WSA), Google (Chrome OS ARCVM and Google
  Play Games on PC), and Huawei (mobile application engine) have
  announced the launch of Android-based mobile application ecological
  support solutions.

In the above solutions, there are many Android systems running on Intel®
architecture platforms. Intel continues to invest in software
development in the Android ecosystem:

- Open-sourced Intel Android system-Celadon
  (https://01.org/projectceladon）

- Android Cloud Gaming Solutions

- Intel binary translator solution - Intel® Bridge Technology (Intel®
  BT)

Supporting Intel-based Android devices provides Android application
developers with a wider range of application scenarios and platforms. In
order to allow applications to run better on Intel-supported devices and
platforms, we have summarized the best development practices for
developers and put them together in this white paper.

Provide native x86\_64 ABI support
**********************************

If the application uses Java, Kotlin, C#, and other cross-platform
programming languages (including all libraries or SDKs), the existing
mainstream development tools support the application to run on Intel
platforms with excellent performance and compatibility. If the app uses
any native code, or a third-party native code base, make sure to provide
x86\_64/x86 ABI support. Here, we take only the 64-bit scene as an
example.

For self-developed native code, add the following configuration during
building:

- Build with Android Studio and Gradle

  When an Android Studio project uses Gradle as the underlying build
  system, to build native code simply requires adding x86\_64 to the
  ndk.abiFilters setting in the app's "build.gradle" file, e.g.

  .. code-block:: bash

     ndk.abiFilters 'armeabi-v7a','arm64-v8a','x86',**'x86_64'**


- Build Native code with CMake:

  You can build x86\_64 ABI by passing 'x86\_64' to the
  "-DANDROID\_ABI" parameter:

  .. code-block:: bash

     :: Command Line
     > cmake -DANDROID_ABI=x86_64 …

- Build with ndk-build

  If your application was built with ndk-build, the "Application.mk"
  file can be modified using the APP\_ABI variable to build with
  x86\_64 ABI:

  .. code-block:: bash

     APP_ABI := armeabi-v7a arm64-v8a x86 **x86_64**

If your application uses other SDKs or development tools, you can refer
to the documentation for enabling x86\_64 ABI support. If your
application is built with Unity, you can first confirm whether the
version of Unity you are using supports x86\_64 compilation in the
Android environment. You can check the version of Unity in the Version
drop-down box in the upper left corner of the Unity manual
(`LINK <https://docs.unity3d.com/2019.4/Documentation/Manual/android-ChromeOS-building-your-application.html>`__).
According to this document, the supported Unity versions are:

+----------------------------------------------------------+
| 2022.2, 2022.1, 2021.3, 2021.2, 2021.1, 2020.3, 2019.4   |
+----------------------------------------------------------+

In the above corresponding version, switch to the Android compilation
platform first, and then select the x86\_64 option in the Project
Settings page:

.. figure:: images/cs003-f1-enable-x86-64-unity-settings.png
   :width: 5.00000in
   :height: 2.75000in

   Figure 1: Enable x86\_64 in Unity Settings

If your Unity application needs to be optimized for Google Play Games
for PC, you can refer to
(`LINK <https://codelabs.developers.google.com/android-google-play-games-unity-quickstart#0>`__)
to test by deploying the application to the Google Play emulator. You
can also optimize the emulator as follows:

- Adjust the UI according to the running effect.

- Use the Input SDK Unity package to adapt mouse and keyboard.

- Remove ads and embedded site views.

- Remove permission dialog.

- Adjust texture compression format to DXT or ASTC for better fit on
  desktop.

- Adjust Graphics Quality in Project Settings.

If the SDK or library used does not have x86\_64 and only supports arm
ABI, try one of the following solutions:

- Contact the corresponding vendor

- Check its code source to know if there is an x86 or x86\_64 ABI
  release

- Choose an alternative library solution.

If you still can't get the support of the corresponding ABI, you can
continue to release support based on the arm ABI. Intel provides a
binary translation solution to run the code of the arm ABI. Please
refer to the next section.

Provide Intel BT-friendly ARM native code implementation
********************************************************

If the application can only provide support for arm ABI due to
third-party dependencies or other reasons, the application can still be
executed on Intel platforms through Intel BT in most cases, but to get
excellent performance and compatibility, you need to be aware of the
following limitations:

- Avoid relying on Intel BT to run JIT applications to achieve stable
  performance, and try to use the built-in WebView of the Android
  system for components such as browsers.

- Apps and SDKs should avoid using non-public or non-standard system
  APIs.

- Avoid the behavior of hooking the system Linker/Loader.

- Avoid mixing arm/x86 libraries at the same time.

- Do not support multiple accounts.

If there is a specific Intel processor-based software and hardware
platform that needs to be supported, we recommend that you first check
whether the corresponding Android system integrates Intel BT components
and perform unit testing on the corresponding platform.

Application hardening
*********************

Before being put onto the app store or released, many applications or
SDKs will be hardened with a hardening scheme to improve the security
defense capability. Some hardening solutions also introduce native code
modules for pure Java/Kotlin apps, thereby converting ABI
platform-independent applications to applications running on a specific
ABI platform. We recommend using reinforcement solutions that support
x86\_64, such as Lebian, Bangcle, Alibaba mPaaS, Tencent Legu, NetEase
Yundun, Ijiami, and other solutions. These manufacturers have already
adapted the x86 platform and Intel BT.

Anti-emulator and platform checking
***********************************

Many Android runtime environments on Intel platforms run in virtual
machines or containers, and on non-ARM-based processors. Some emulator
detection schemes simply classify Intel platforms as emulator
environments and restrict the application. On many platforms, such as
WSA, Huawei Mobile App Engine, Chrome OS, and cloud gaming, etc., they
should not simply be classified as illegal emulators.

It is expected that application developers can provide more fine-grained
inspection strategies to allow applications to run in reasonable
scenarios without any problems.

Support for PC devices
**********************

In Intel's Android use cases, horizontal large screen displays and
computer input and output devices are common scenarios, such as
laptop displays and conference system smart screens. Google,
Microsoft, and other manufacturers also promote the support of
large-screen devices. Here, we summarize the support points:

• To support screens of various sizes, especially large screens
  (landscape), application developers should design
  responsive/adaptive layouts that provide a great user experience on
  various devices.

• Support PC-specific interactive devices – such as touchpads, mice
  (including right button and scroll wheel, etc.), keyboards
  (including key combinations), styluses, gamepads, etc.

• Apps should not rely on features such as app widgets, live
  wallpapers, and app launchers. In many cases, a separate Launcher
  cannot be assumed.

• We recommend you set the Android APK Target API level to 24+
  (Android 7+) free-form Windows and Drag-drop support, use ViewModel
  to save window size state.

• Don't rely on Bluetooth or other networks. Do support virtual
  network cards and WiFi.

• Adapt the App layout to show and hide the status bar.

• Camera support; if the app provides a camera preview, check the
  orientation and aspect ratio of the preview on large screens.

Application test
****************

We also recommend that Intel devices be introduced for testing as early
as possible during application testing. At present, it should be
relatively easy to find corresponding devices in the market. For
example:

- Android SDK embedded Android Virtual device (AVD): You can easily
  create x86\_64 ABI virtual devices and test your native x86\_64
  supported applications on Intel processor-based development
  machines. For details, refer to:
  https://developer.android.com/studio/run/managing-avds

- Microsoft's WSA: WSA is already available in the US and other regions
  and can run Android applications on the Windows 11 operating system
  and WSA-supported hardware platforms.

  To setup WSA and install the app, please refer to the following link:
  https://docs.microsoft.com/en-us/windows/android/wsa/

- We are looking for partners to build a cloud-based x86 Android test
  environment, and we will notify you as soon as it is completed.

Application release
*******************

If your app already supports the x86\_64 ABI, be sure to include support
libraries for x86\_64 ABI when publishing your app.

Toolchains and reference platforms
**********************************

At present, mainstream Android development IDE manufacturers provide
x86\_64 support, such as Android Studio, Visual Studio, and so on. For
Intel platforms, if you want to perform in-depth performance tuning,
Intel provides the VTune™ tool, for more details see:

https://www.intel.com/content/www/us/en/developer/tools/oneapi/vtune-profiler.html

Summary
*******

To better support Intel hardware platforms, we strongly recommend that
applications provide native x86\_64 support for excellent performance
and compatibility. If you have to provide an application with an ARM ABI
only, we recommend you test it on WSA or a Chromebook based on Intel
processors. If hardening is required, use a hardening solution that
supports Intel platform adaptation. If you have any questions and
suggestions, we welcome feedback through the Celadon community.

.. figure:: images/cs003-f2-contact-us.png
   :width: 5.00000in
   :height: 1.70833in


References
**********

- https://docs.microsoft.com/en-us/windows/android/wsa/

- https://developer.android.com/chrome-os/intro

- https://chromeos.dev/en/posts/desktop-avd-in-android-studio

- https://developer.android.com/large-screens

- https://developer.android.com/games/optimize/64-bit

- https://www.gsma.com/mobileeconomy/wp-content/uploads/2021/02/GSMA_MobileEconomy2021_China_Ch-1.pdf

-  `将 Android 应用引入 Windows
   (microsoft.com) <https://mybuild.microsoft.com/zh-CN/sessions/241d43b6-130d-4e83-a263-22c94872ff24?source=https://mybuild.microsoft.com/zh-CN/theme/create-next-gen-experience-at-scale-with-windows?f=%255B%257B%2522name%2522%253A%2522%25E5%2585%25A8%25E7%2590%2583%2522%252C%2522facetName%2522%253A%2522event%2522%257D%255D&p=2&t=%257B%2522from%2522%253A%25222022-05-24T00%253A00%253A00%252B08%253A00%2522%252C%2522to%2522%253A%25222022-05-26T23%253A59%253A00%252B08%253A00%2522%257D>`__

- https://developer.android.com/games/playgames/pc-compatibility

- https://codelabs.developers.google.com/android-google-play-games-unity-quickstart#0

-  `2020手游模拟器市场综合分析-易观分析
   (analysys.cn) <https://www.analysys.cn/article/detail/20020032>`__

- https://blogs.windows.com/windowsdeveloper/2022/07/14/windows-subsystem-for-android/

