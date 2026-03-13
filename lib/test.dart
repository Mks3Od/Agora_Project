import 'dart:async';

import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

const appId = "e97e65b01c8d40d59f6a07a004513103";
const token =
    "007eJxTYFgvHbH8o9Xf7G75CO/XvcfUe9cY33H0XtDOY2TZ9Iap+48CQ6qleaqZaZKBYbJFiolBiqllmlmigXmigYGJqaGxoYFx2MbNmQ2BjAxPOB8xMEIhiM/CUJJaXMLAAAA72h85";
const channel = "test06";

// void main() => runApp(const MaterialApp(home: MyTestApp()));

class MyTestApp extends StatefulWidget {
  const MyTestApp({Key? key}) : super(key: key);

  @override
  State<MyTestApp> createState() => _MyTestAppState();
}

class _MyTestAppState extends State<MyTestApp> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  @override
  void initState() {
    super.initState();
    initAgora();
  }

  Future<void> initAgora() async {
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    // create the engine
    debugPrint(">>> Step 2: Creating engine...");
    _engine = createAgoraRtcEngine();
    await _engine.initialize(const RtcEngineContext(
      appId: appId,
      channelProfile: ChannelProfileType.channelProfileLiveBroadcasting,
    ));
    debugPrint(">>> Engine initialized");

    // 1️⃣ Register event handlers FIRST
    debugPrint(">>> Step 3: Registering event handlers...");
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint(
              ">>> ✅ onJoinChannelSuccess: local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint(">>> ✅ onUserJoined: remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint(">>> onUserOffline: remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onError: (ErrorCodeType err, String msg) {
          debugPrint(">>> ❌ onError: code=$err, msg=$msg");
        },
        onConnectionStateChanged: (RtcConnection connection,
            ConnectionStateType state, ConnectionChangedReasonType reason) {
          debugPrint(">>> 🔗 Connection state: $state, reason: $reason");
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(">>> ⚠️ Token about to expire!");
        },
      ),
    );

    // 2️⃣ Then set up video
    debugPrint(">>> Step 4: Setting up video...");
    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();
    debugPrint(">>> Video enabled, preview started");

    // 3️⃣ Then join the channel
    debugPrint(">>> Step 5: Joining channel '$channel'...");
    await _engine.joinChannel(
      token: token,
      channelId: channel,
      uid: 0,
      options: const ChannelMediaOptions(
        autoSubscribeVideo: true,
        autoSubscribeAudio: true,
        publishCameraTrack: true,
        publishMicrophoneTrack: true,
        clientRoleType: ClientRoleType.clientRoleBroadcaster,
      ),
    );
    debugPrint(">>> joinChannel called");
  }

  @override
  void dispose() {
    super.dispose();

    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agora Video Call'),
        ),
        body: Column(
          children: [
            // video
            SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Center(
                    child: _remoteVideo(),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: SizedBox(
                      width: 100,
                      height: 150,
                      child: Center(
                        child: _localUserJoined
                            ? AgoraVideoView(
                                controller: VideoViewController(
                                  rtcEngine: _engine,
                                  canvas: const VideoCanvas(uid: 0),
                                ),
                              )
                            : const CircularProgressIndicator(),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // // Publish
            // ElevatedButton(
            //     onPressed: () async {
            //       await _engine.joinChannel(
            //         token: token,
            //         channelId: channel,
            //         uid: 0,
            //         options: const ChannelMediaOptions(
            //           autoSubscribeVideo:
            //               true, // Automatically subscribe to all video streams
            //           autoSubscribeAudio:
            //               true, // Automatically subscribe to all audio streams
            //           publishCameraTrack: true, // Publish camera-captured video
            //           publishMicrophoneTrack:
            //               true, // Publish microphone-captured audio
            //           // Use clientRoleBroadcaster to act as a host or clientRoleAudience for audience
            //           clientRoleType: ClientRoleType.clientRoleBroadcaster,
            //         ),
            //       );
            //       setState(() {});
            //     },
            //     child: Text("Publish")),

            // //Subscribe
            // ElevatedButton(
            //     onPressed: () {
            //       debugPrint("_engine.registerEventHandler1");
            //       _engine.registerEventHandler(
            //         RtcEngineEventHandler(
            //           onJoinChannelSuccess:
            //               (RtcConnection connection, int elapsed) {
            //             debugPrint("local user ${connection.localUid} joined");
            //             setState(() {
            //               _localUserJoined = true;
            //             });
            //           },
            //           onUserJoined: (RtcConnection connection, int remoteUid,
            //               int elapsed) {
            //             debugPrint("remote user $remoteUid joined");
            //             setState(() {
            //               _remoteUid = remoteUid;
            //             });
            //           },
            //           onUserOffline: (RtcConnection connection, int remoteUid,
            //               UserOfflineReasonType reason) {
            //             debugPrint("remote user $remoteUid left channel");
            //             setState(() {
            //               _remoteUid = null;
            //             });
            //           },
            //           onTokenPrivilegeWillExpire:
            //               (RtcConnection connection, String token) {
            //             debugPrint(
            //                 '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
            //           },
            //         ),
            //       );
            //       debugPrint("_engine.registerEventHandler2");
            //     },
            //     child: Text("Subscribe")),

            ElevatedButton(
                onPressed: () async {
                  await _dispose();
                  debugPrint("_dispose _dispose");
                },
                child: Text("Dispose")),

            ElevatedButton(
                onPressed: () async {
                  await _engine.joinChannel(
                      token: token,
                      channelId: "channelId",
                      uid: 1,
                      options: ChannelMediaOptions());

                  debugPrint("Join channel");
                },
                child: Text("Join channel")),
          ],
        ),
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid),
          connection: const RtcConnection(channelId: channel),
        ),
      );
    } else {
      return const Text(
        'Please wait for remote user to join',
        textAlign: TextAlign.center,
      );
    }
  }
}
