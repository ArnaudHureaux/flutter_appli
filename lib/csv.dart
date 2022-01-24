import 'dart:io';
import 'package:csv/csv.dart';

void main() {
  final csv_path = 'C:/Users/DELL/1Python/clicker/data/data.csv';

  List list_of_list = import_csv_to_list_of_list(csv_path);
  list_of_list = add_importance_to_list_of_list(list_of_list, 2, 'OUI');
  export_list_of_list_to_csv(list_of_list, csv_path);
}

import_csv_to_list_of_list(csv_path) {
  final file_name = csv_path;
  final lines = File(file_name).readAsLinesSync();
  List? list_of_list = [];
  for (var i = 0; i < lines.length; i++) {
    list_of_list.add(lines[i].split(','));
  }
  return (list_of_list);
}

add_importance_to_list_of_list(list_of_list, index, value) {
  list_of_list[index].add(value);
  return (list_of_list);
}

export_list_of_list_to_csv(list_of_list, csv_path) {
  String csv = const ListToCsvConverter().convert(list_of_list);
  File file = File(csv_path);
  file.writeAsString(csv);
  print('CSV export in $csv_path');
}
