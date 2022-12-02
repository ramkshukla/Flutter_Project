class ChatModel {
  final String name;
  final String message;
  final String time;
  final String avatarUrl;

  ChatModel(
      {required this.name,
      required this.message,
      required this.time,
      required this.avatarUrl});
}

List<ChatModel> dummyData = [
  ChatModel(
      name: "Emily",
      message: "Hey Flutter, You are so amazing !",
      time: "15:30",
      avatarUrl:
          "https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80"),
  ChatModel(
      name: "Kaylee",
      message: "Hey, I have hacked WhatsApp !",
      time: "15:30",
      avatarUrl:
          "https://images.unsplash.com/photo-1516522973472-f009f23bba59?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
  ChatModel(
      name: "Sage",
      message: "Wassup !",
      time: "15:30",
      avatarUrl:
          "https://images.unsplash.com/photo-1627067227573-07bc616f46ee?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=387&q=80"),
  ChatModel(
      name: "Serenity",
      message: "I'm good !",
      time: "15:30",
      avatarUrl:
          "https://images.unsplash.com/photo-1516195851888-6f1a981a862e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=405&q=80"),
  ChatModel(
      name: "Jolie",
      message: "Hey, Flutter is fastest UI development SDK !",
      time: "15:30",
      avatarUrl:
          "https://images.unsplash.com/photo-1601288496920-b6154fe3626a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1374&q=80"),
  ChatModel(
      name: "Presley",
      message: "Hey Flutter, You are so cool !",
      time: "15:30",
      avatarUrl:
          "https://images.unsplash.com/photo-1568739253582-afa48fbcea47?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=464&q=80")
];
