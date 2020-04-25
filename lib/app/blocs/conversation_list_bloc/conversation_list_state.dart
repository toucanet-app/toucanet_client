part of 'conversation_list_bloc.dart';

abstract class ConversationListState extends Equatable {
  const ConversationListState();
}


class ConversationList extends ConversationListState {
  ConversationList(this.dialogs);

  List<Conversation> dialogs;

  @override
  List<Object> get props => [dialogs];
}

class Loading extends ConversationListState {
  @override
  List<Object> get props => [];
}
