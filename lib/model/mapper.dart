import 'dart:convert';

import 'package:projet_groupe_c/assets/enumIcons.dart';

import '../services/mapper_service.dart';

class Mapper {
  Map<String, String> validationsVehicles = {};
  Map<String, String> vehiclesTypes = {};
  Map<String, String> sinisterTypes = {};
  Map<int,iconEnum> iconTypes = {};
  fillMapperIcons(Map<int,iconEnum> map){
    int i = 0;
    for(var value in iconEnum.values){
      map.putIfAbsent(i, () => value);
      i++;
    }
    iconTypes.forEach((key, value) {
      print("Key is " + key.toString() + "value is " + value.toString());
    });
  }
  fillMapper(dynamic value, Map<String, String> map) {
    for (var object in json.decode(value.body)) {
      map.putIfAbsent(object['libelle'], () => object['_id']);
    }
    sinisterTypes.forEach((key, value) {
      print("Key is " + key + ' | Value is ' + value);
    });
  }

  findIconById(int id){
    print(iconEnum.CRM_FULL.index);
    iconEnum.values[26];
      return iconEnum.values[id];
  }
  findIdofIcon(iconEnum i){
    return i.index;
  }

  findValidationVehiclesByKey(String id) {
    validationsVehicles.keys.firstWhere(
        (element) => validationsVehicles[element] == id,
        orElse: () => 'Id not found');
  }

  findVehicleTypeByKey(String id) {
    vehiclesTypes.keys.firstWhere((element) => vehiclesTypes[element] == id,
        orElse: () => 'Id not found');
  }

  findSinisterTypeByKey(String id) {
    sinisterTypes.keys.firstWhere((element) => sinisterTypes[element] == id,
        orElse: () => 'Id not found');
  }

  Mapper() {
    MapperService.getVehiclesType().then(
        (value) => {print("vehiclesTypes"), fillMapper(value, vehiclesTypes)});
    MapperService.getValidationsVehicles().then((value) =>
        {print("ValidationVehicles"), fillMapper(value, validationsVehicles)});
    MapperService.getSinisterType().then(
        (value) => {print("SinisterType"), fillMapper(value, sinisterTypes)});
    print("IconTypes");fillMapperIcons(iconTypes);

  }
}
