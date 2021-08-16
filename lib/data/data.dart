import 'dart:convert';

import 'package:http/http.dart' as ht;
import 'package:grid_pagination/data/datamodel.dart';

class GetData {
  List<DataModel> datalist = [];
  Future getDetails(int index, int count) async {
    var data = await ht.get(Uri.parse(
        "https://softawork2.xyz/fandlApi/product/get_play_school_all?page_no=1&distance_range=5&user_id=81"));
    var response = jsonDecode(data.body);
    if (response["status"] == 200) {
      for (; count < index; count++) {
        if (count < response["playSchoolAllList"].length) {
          var element = response["playSchoolAllList"][count];
          DataModel dataModel = DataModel(
              play_school_id: element["play_school_id"],
              play_school_user_id: element["play_school_user_id"],
              play_school_name: element["play_school_name"],
              play_school_contact_person_name:
                  element["play_school_contact_person_name"],
              play_school_email: element["play_school_email"],
              play_school_mobile: element["play_school_mobile"],
              play_school_address: element["play_school_address"],
              play_school_website: element["play_school_website"],
              play_school_images: element["play_school_images"],
              play_school_grade: element["play_school_grade"],
              play_school_age_from: element["play_school_age_from"],
              play_school_age_to:
                  element["play_school_weageplay_school_age_to"],
              play_school_facilites: element["play_school_facilites"],
              play_school_status: element["play_school_status"],
              play_school_description: element["play_school_description"],
              play_school_latitude: element["play_school_latitude"],
              play_school_longitude: element["play_school_longitude"],
              play_school_other_activities:
                  element["play_school_other_activities"],
              created_date: element["created_date"],
              modified_date: element["modified_date"],
              rating: element["rating"],
              distance: element["distance"],
              time: element["time"]);
          datalist.add(dataModel);
        }
      }
      return datalist;
    }
  }
}
