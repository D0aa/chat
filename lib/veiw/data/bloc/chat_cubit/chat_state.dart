
abstract class ChatState {}

class ChatInitial extends ChatState {}

class GetProfileSuccessState extends ChatState{}

class SendMessageLoadingState extends ChatState{}
class SendMessageSuccessState extends ChatState{}
class SendMessageErrorState extends ChatState{}

class GetAllMessageLoadingState extends ChatState{}
class GetAllMessageSuccessState extends ChatState{}
class GetAllMessageErrorState extends ChatState{}