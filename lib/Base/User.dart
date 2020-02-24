class Student {
  int id;
  String name;

  Student(this.name);

  Student.map(dynamic obj){
    this.id = obj['id'];
    this.name = obj['name'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if(id!=null) {
    map['id'] = id;
    }
    map['name']=name;
    return map;
  }

  Student.fromMap(Map<String, dynamic> map) {
    this.id = map['id'];
    this.name = map['name'];
  }
}