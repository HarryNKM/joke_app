class HomeModel {
  String? id;
  String? joke;

  HomeModel({ this.id,  this.joke});

  factory HomeModel.mapToModel(Map m1) {
    return HomeModel(
      id: m1['id'],
      joke: m1['value'],
    );
  }
}
