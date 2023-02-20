class TipsModel {
  String? body;
  String? head;
  TipsModel();
  Map<String, dynamic> toMap() {
    return {
      'body': body,
      'head': head,
    };
  }

  TipsModel.fromSnapshot(snapshot)
      : body = snapshot.data()['body'],
        head = snapshot.data()['head'];

  TipsModel.from(data)
      : body = data['body'],
        head = data['head'];
}
