// import 'package:chatview/chatview.dart';
// import 'package:dating_app/app/modules/chat/chat_controller.dart';
// import 'package:dating_app/app/theme/colors.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ChatMainView extends StatelessWidget {
//   const ChatMainView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final ChatMainViewController chatMainViewController =
//         Get.put(ChatMainViewController());
//     final ChatController chatController = ChatController(
//         initialMessageList: chatMainViewController.messageList,
//         scrollController: ScrollController(),
//         otherUsers: [ChatUser(id: '2', name: "Pawan")],
//         currentUser: ChatUser(id: '1', name: 'Bhargav'));
//     return Scaffold(
//       backgroundColor: AppColors.white,
//       body: ChatView(
//           chatController: chatController,
//           chatViewState: ChatViewState.hasMessages,
//
//       ),
//     );
//   }
// }
