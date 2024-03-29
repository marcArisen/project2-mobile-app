import 'dart:collection';
import 'dart:convert';

import 'package:project2_mobile_app/UniversityRepo/UniversityDatabase.dart';
import 'package:project2_mobile_app/UniversityRepo/university.dart';

import '../model/student_model.dart';

class ApiPuller {

  Future<List>? updateNumberToDatabase(List<Record>? lst){

    var nationalities = listAllNationalityNameEng(lst);
    var to_add = mockDatabase();
    var names = listAllUniversities(lst);

    var map = {};
    for (int a = 0; a < lst!.length; a++) {
      map[lst[a].univMasterName!] = {...nationalities};
    }

    /// update number of foreigners in a map
    for (int i = 0; i < lst.length; i++) {
      map[lst[i].univMasterName!][lst[i].nationalityNameEng] += lst[i].amount;
    }

    var highest = 0;
    var tempname = "";

    var temp_map = {};

    for (int i = 0; i < map.length; i++) {
      for (int j = 0; j < 3; j++){
        var temp = map[names[i]]; // map for each uni
        temp.forEach((key, value) {
          if (value >= highest){
            highest = value;
            tempname = key;
          }
        });
        temp_map[tempname] = highest;
        map[names[i]][tempname] = 0;
        highest = 0;
        tempname = "";
      }
      map[names[i]] = temp_map;
      temp_map = {};
    }

    //add to database
    for (int j = 0; j < to_add.length; j++) {
      to_add[j].numbers = json.encode(map[names[j]]);
      UniversityDatabase.databaseManager.addUniversity(to_add[j]);
    }

    return null;
  }


  /// return list of nationalities
  Map listAllNationalityNameEng(List<Record>? lst){
    var map = {};
    for (int i = 0; i < lst!.length; i++) {
      map[lst[i].nationalityNameEng] = 0;
    }
    // there are 98 Nationalities
    map.forEach((key, value) {
      print(key);
    });

    return map;
  }

  /// return list of all uni
  List listAllUniversities(List<Record>? lst){
    var to_return = [];
    for (int i = 0; i < lst!.length; i++) {
      to_return.add(lst[i].univMasterName!);
    }
    // there are 97 universities
    return to_return.toSet().toList();
  }

  /// this will return in map form
  HashMap listAllUniversities2(List<Record>? lst){
    var map = HashMap();
    var to_return = [];
    for (int i = 0; i < lst!.length; i++) {
      map[lst[i].univMasterName!] = 0;
    }
    // there are 97 universities
    // print(map.length);
    return map;
  }

  List mockDatabase(){
    var temp1 = University(
      id: 1,
      name: 'Chulalongkorn University',
      thaiName: 'จุฬาลงกรณ์มหาวิทยาลัย',
      imageUrl: 'assets/universities/images/chula.jpg',
      logo:'assets/universities/logo/chula.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp2 = University(
      id: 2,
      name: 'Kasetsart University',
      thaiName: 'มหาวิทยาลัยเกษตรศาสตร์',
      imageUrl: 'assets/universities/images/2.jpeg',
      logo:'assets/universities/logo/2.jpeg',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp3 = University(
      id: 3,
      name: 'Khon Kaen University',
      thaiName: 'มหาวิทยาลัยขอนแก่น',
      imageUrl: 'assets/universities/images/3.jpeg',
      logo:'assets/universities/logo/3.png',
      province: 'Khon Kaen',
      description: '',
      map: '',
      numbers: null,
    );
    var temp4 = University(
      id: 4,
      name: 'Chiang Mai University',
      thaiName: 'มหาวิทยาลัยเชียงใหม่',
      imageUrl: 'assets/universities/images/4.jpeg',
      logo:'assets/universities/logo/4.png',
      province: 'Chiang Mai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp5 = University(
      id: 5,
      name: 'Burapha University',
      thaiName: 'มหาวิทยาลัยบูรพา',
      imageUrl: 'assets/universities/images/5.jpeg',
      logo:'assets/universities/logo/5.png',
      province: 'Chonburi',
      description: '',
      map: '',
      numbers: null,
    );
    var temp6 = University(
      id: 6,
      name: 'Thammasat University',
      thaiName: 'มหาวิทยาลัยธรรมศาสตร์',
      imageUrl: 'assets/universities/images/6.jpeg',
      logo:'assets/universities/logo/6.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp7 = University(
      id: 7,
      name: 'Silpakorn University',
      thaiName: 'มหาวิทยาลัยศิลปากร',
      imageUrl: 'assets/universities/images/7.jpeg',
      logo:'assets/universities/logo/7.png',
      province: 'Nakhon Phathom',
      description: '',
      map: '',
      numbers: null,
    );
    var temp8 = University(
      id: 8,
      name: 'Mahidol University',
      thaiName: 'มหาวิทยาลัยมหิดล',
      imageUrl: 'assets/universities/images/mahidol.jpg',
      logo:'assets/universities/logo/mahidol.png',
      province: 'Nakhon Phathom',
      description: '',
      map: '',
      numbers: null,
    );
    var temp9 = University(
      id: 9,
      name: 'Ramkhamhaeng University',
      thaiName: 'มหาวิทยาลัยรามคำแหง',
      imageUrl: 'assets/universities/images/9.jpeg',
      logo:'assets/universities/logo/9.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp10 = University(
      id: 10,
      name: 'Srinakharinwirot University',
      thaiName: 'มหาวิทยาลัยศรีนครินทรวิโรฒ',
      imageUrl: 'assets/universities/images/10.jpeg',
      logo:'assets/universities/logo/10.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp11 = University(
      id: 11,
      name: 'Songklanakarin University',
      thaiName: 'มหาวิทยาลัยสงขลานครินทร์',
      imageUrl: 'assets/universities/images/11.jpeg',
      logo:'assets/universities/logo/11.png',
      province: 'Songkla',
      description: '',
      map: '',
      numbers: null,
    );
    var temp12 = University(
      id: 12,
      name: 'Sukhothai Thammathirat Open University',
      thaiName: 'มหาวิทยาลัยสุโขทัยธรรมาธิราช',
      imageUrl: 'assets/universities/images/12.jpeg',
      logo:'assets/universities/logo/12.jpeg',
      province: 'Sukhothai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp13 = University(
      id: 13,
      name: 'NIDA',
      thaiName: 'สถาบันบัณฑิตพัฒนบริหารศาสตร์',
      imageUrl: 'assets/universities/images/13.jpeg',
      logo:'assets/universities/logo/13.png',
      province: '',
      description: '',
      map: '',
      numbers: null,
    );
    var temp14 = University(
      id: 14,
      name: 'Maejo University',
      thaiName: 'มหาวิทยาลัยแม่โจ้',
      imageUrl: 'assets/universities/images/14.jpeg',
      logo:'assets/universities/logo/14.png',
      province: 'Chiang Mai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp15 = University(
      id: 15,
      name: "King Mongkut's University of Technology Thonburi",
      thaiName: 'มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี',
      imageUrl: 'assets/universities/images/15.jpeg',
      logo:'assets/universities/logo/15.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp16 = University(
      id: 16,
      name: "King Mongkut's University of Technology North Bangkok ",
      thaiName: 'มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าพระนครเหนือ',
      imageUrl: 'assets/universities/images/16.jpeg',
      logo:'assets/universities/logo/16.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp17 = University(
      id: 17,
      name: "King Mongkut's Institute of Technology Ladkrabang",
      thaiName: 'สถาบันเทคโนโลยีพระจอมเกล้าเจ้าคุณทหารลาดกระบัง',
      imageUrl: 'assets/universities/images/17.jpeg',
      logo:'assets/universities/logo/17.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp18 = University(
      id: 18,
      name: 'Suranaree University of Technology',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีสุรนารี',
      imageUrl: 'assets/universities/images/18.jpeg',
      logo:'assets/universities/logo/18.png',
      province: 'Nakron Ratchasima',
      description: '',
      map: '',
      numbers: null,
    );
    var temp19 = University(
      id: 19,
      name: 'Ubon Ratchathani University',
      thaiName: 'มหาวิทยาลัยอุบลราชธานี',
      imageUrl: 'assets/universities/images/19.jpeg',
      logo:'assets/universities/logo/19.png',
      province: 'Ubon Ratchathani',
      description: '',
      map: '',
      numbers: null,
    );
    var temp20 = University(
      id: 20,
      name: 'Thaksin University',
      thaiName: 'มหาวิทยาลัยทักษิณ',
      imageUrl: 'assets/universities/images/20.jpeg',
      logo:'assets/universities/logo/20.png',
      province: 'Songkhla',
      description: '',
      map: '',
      numbers: null,
    );
    var temp21 = University(
      id: 21,
      name: 'Walailak University',
      thaiName: 'มหาวิทยาลัยวลัยลักษณ์',
      imageUrl: 'assets/universities/images/21.jpeg',
      logo:'assets/universities/logo/21.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp22 = University(
      id: 22,
      name: 'Mae Fah Luang University',
      thaiName: 'มหาวิทยาลัยแม่ฟ้าหลวง',
      imageUrl: 'assets/universities/images/22.jpeg',
      logo:'assets/universities/logo/22.png',
      province: 'Chiang Rai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp23 = University(
      id: 23,
      name: 'Phayao University',
      thaiName: 'มหาวิทยาลัยพะเยา',
      imageUrl: 'assets/universities/images/23.jpeg',
      logo:'assets/universities/logo/23.png',
      province: 'Phayao',
      description: '',
      map: '',
      numbers: null,
    );
    var temp24 = University(
      id: 24,
      name: 'Bangkok University',
      thaiName: 'มหาวิทยาลัยกรุงเทพ',
      imageUrl: 'assets/universities/images/24.jpeg',
      logo:'assets/universities/logo/24.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp25 = University(
      id: 25,
      name: 'Payap University',
      thaiName: 'มหาวิทยาลัยพายัพ',
      imageUrl: 'assets/universities/images/25.jpeg',
      logo:'assets/universities/logo/25.png',
      province: 'Chaing Mai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp26 = University(
      id: 26,
      name: 'Sripatum University',
      thaiName: 'มหาวิทยาลัยศรีปทุม',
      imageUrl: 'assets/universities/images/26.jpeg',
      logo:'assets/universities/logo/26.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp27 = University(
      id: 27,
      name: 'University of the Thai Chamber of Commerce',
      thaiName: 'มหาวิทยาลัยหอการค้าไทย',
      imageUrl: 'assets/universities/images/27.jpeg',
      logo:'assets/universities/logo/27.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp28 = University(
      id: 28,
      name: 'Krirk University',
      thaiName: 'มหาวิทยาลัยเกริก',
      imageUrl: 'assets/universities/images/28.png',
      logo:'assets/universities/logo/28.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp29 = University(
      id: 29,
      name: 'Christian University Thailand',
      thaiName: 'มหาวิทยาลัยคgริสเตียน',
      imageUrl: 'assets/universities/images/29.jpeg',
      logo:'assets/universities/logo/29.png',
      province: 'Nakhon Pathom',
      description: '',
      map: '',
      numbers: null,
    );
    //TODO: come to here hard code again
    var temp30 = University(
      id: 30,
      name: 'Technology Mahanakorn University',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีมหานคร',
      imageUrl: 'assets/universities/images/30.jpeg',
      logo:'assets/universities/logo/30.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp31 = University(
      id: 31,
      name: 'Rangsit University',
      thaiName: 'มหาวิทยาลัยรังสิต',
      imageUrl: 'assets/universities/images/31.jpeg',
      logo:'assets/universities/logo/31.jpeg',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp32 = University(
      id: 32,
      name: 'Huachiew Chalermprakiet University',
      thaiName: 'มหาวิทยาลัยหัวเฉียวเฉลิมพระเกียรติ',
      imageUrl: 'assets/universities/images/32.jpeg',
      logo:'assets/universities/logo/32.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp33 = University(
      id: 33,
      name: 'Assumption University',
      thaiName: 'มหาวิทยาลัยอัสสัมชัญ',
      imageUrl: 'assets/universities/images/33.jpeg',
      logo:'assets/universities/logo/33.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp34 = University(
      id: 34,
      name: 'Thonburi University',
      thaiName: 'มหาวิทยาลัยธนบุรี',
      imageUrl: 'assets/universities/images/34.jpeg',
      logo:'assets/universities/logo/34.jpeg',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp35 = University(
      id: 35,
      name: 'Chinnawat University',
      thaiName: 'มหาวิทยาลัยชินวัตร',
      imageUrl: 'assets/universities/images/35.jpeg',
      logo:'assets/universities/logo/35.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp36 = University(
      id: 36,
      name: 'Dhurakij Pundit University',
      thaiName: 'มหาวิทยาลัยธุรกิจบัณฑิตย์',
      imageUrl: 'assets/universities/images/36.jpeg',
      logo:'assets/universities/logo/36.jpeg',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp37 = University(
      id: 37,
      name: 'Northeastern University',
      thaiName: 'มหาวิทยาลัยภาคตะวันออกเฉียงเหนือ',
      imageUrl: 'assets/universities/images/37.jpeg',
      logo:'assets/universities/logo/37.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp38 = University(
      id: 38,
      name: 'Vongchavalitkul University',
      thaiName: 'มหาวิทยาลัยวงษ์ชวลิตกุล',
      imageUrl: 'assets/universities/images/38.jpeg',
      logo:'assets/universities/logo/38.png',
      province: 'Nakorn Ratchasima',
      description: '',
      map: '',
      numbers: null,
    );
    var temp39 = University(
      id: 39,
      name: 'Webster University',
      thaiName: 'มหาวิทยาลัยเว็บสเตอร์(ประเทศไทย)',
      imageUrl: 'assets/universities/images/39.jpeg',
      logo:'assets/universities/logo/39.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp40 = University(
      id: 40,
      name: 'Thongsook University',
      thaiName: 'วิทยาลัยทองสุข',
      imageUrl: 'assets/universities/images/40.jpg',
      logo:'assets/universities/logo/40.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp41 = University(
      id: 41,
      name: 'Southeast Asia University',
      thaiName: 'มหาวิทยาลัยเอเชียอาคเนย์',
      imageUrl: 'assets/universities/images/41.jpeg',
      logo:'assets/universities/logo/41.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp42 = University(
      id: 42,
      name: 'Eastern Asia University',
      thaiName: 'มหาวิทยาลัยอีสเทิร์นเอเชีย',
      imageUrl: 'assets/universities/images/42.jpeg',
      logo:'assets/universities/logo/42.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp43 = University(
      id: 43,
      name: 'Bangkok Thonburi University',
      thaiName: 'มหาวิทยาลัยกรุงเทพธนบุรี',
      imageUrl: 'assets/universities/images/43.jpg',
      logo:'assets/universities/logo/43.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp44 = University(
      id: 44,
      name: 'St Theresa University',
      thaiName: 'วิทยาลัยนานาชาติเซนต์เทเรซา',
      imageUrl: 'assets/universities/images/44.jpeg',
      logo:'assets/universities/logo/44.png',
      province: 'Nakhon Nayok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp45 = University(
      id: 45,
      name: 'Southeast Bangkok University',
      thaiName: 'วิทยาลัยเซาธ์อีสท์บางกอก',
      imageUrl: 'assets/universities/images/45.jpeg',
      logo:'assets/universities/logo/45.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp46 = University(
      id: 46,
      name: 'Dusit Thani University',
      thaiName: 'วิทยาลัยดุสิตธานี',
      imageUrl: 'assets/universities/images/46.jpeg',
      logo:'assets/universities/logo/46.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp47 = University(
      id: 47,
      name: 'North Bangkok University',
      thaiName: 'มหาวิทยาลัยนอร์ทกรุงเทพ',
      imageUrl: 'assets/universities/images/47.jpeg',
      logo:'assets/universities/logo/47.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp48 = University(
      id: 48,
      name: 'North-Chiang Mai University',
      thaiName: 'มหาวิทยาลัยนอร์ทเชียงใหม่',
      imageUrl: 'assets/universities/images/38.jpg',
      logo:'assets/universities/logo/38.png',
      province: 'Chiang Mai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp49 = University(
      id: 49,
      name: 'Stamford University',
      thaiName: 'มหาวิทยาลัยนานาชาติแสตมฟอร์ด',
      imageUrl: 'assets/universities/images/49.jpeg',
      logo:'assets/universities/logo/49.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp50 = University(
      id: 50,
      name: 'Asia-Pacific International University',
      thaiName: 'มหาวิทยาลัยนานาชาติ เอเชีย-แปซิฟิก',
      imageUrl: 'assets/universities/images/50.jpeg',
      logo:'assets/universities/logo/50.png',
      province: 'Sara Buri',
      description: '',
      map: '',
      numbers: null,
    );
    var temp51 = University(
      id: 51,
      name: 'Chiang Mai Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏเชียงใหม่',
      imageUrl: 'assets/universities/images/51.jpeg',
      logo:'assets/universities/logo/51.jpeg',
      province: 'Chiang Mai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp52 = University(
      id: 52,
      name: 'Hatyai University',
      thaiName: 'มหาวิทยาลัยหาดใหญ่',
      imageUrl: 'assets/universities/images/52.jpg',
      logo:'assets/universities/logo/52.png',
      province: 'Hat Yai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp53 = University(
      id: 53,
      name: 'Sangtam University',
      thaiName: 'วิทยาลัยแสงธรรม',
      imageUrl: 'assets/universities/images/47.jpg',
      logo:'assets/universities/logo/53.png',
      province: 'Nakorn Phathom',
      description: '',
      map: '',
      numbers: null,
    );
    var temp54 = University(
      id: 54,
      name: 'Kanchanaburi Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏกาญจนบุรี',
      imageUrl: 'assets/universities/images/54.jpeg',
      logo:'assets/universities/logo/54.png',
      province: 'Kanchanaburi',
      description: '',
      map: '',
      numbers: null,
    );
    var temp55 = University(
      id: 55,
      name: 'Chiang Rai Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏเชียงราย',
      imageUrl: 'assets/universities/images/55.jpeg',
      logo:'assets/universities/logo/55.png',
      province: 'Chiang Rai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp56 = University(
      id: 56,
      name: 'Nakhon Pathom Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏนครปฐม',
      imageUrl: 'assets/universities/images/56.jpeg',
      logo:'assets/universities/logo/55.png',
      province: '',
      description: '',
      map: '',
      numbers: null,
    );
    var temp57 = University(
      id: 57,
      name: 'Nakorn Ratchasima Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏนครราชสีมา',
      imageUrl: 'assets/universities/images/57.png',
      logo:'assets/universities/logo/57.png',
      province: 'Nakorn Ratchasima',
      description: '',
      map: '',
      numbers: null,
    );
    var temp58 = University(
      id: 58,
      name: 'Nakhon Si Thammarat Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏนครศรีธรรมราช',
      imageUrl: 'assets/universities/images/58.jpeg',
      logo:'assets/universities/logo/58.png',
      province: 'Nakhon Si Thammarat',
      description: '',
      map: '',
      numbers: null,
    );
    var temp59 = University(
      id: 59,
      name: 'Pibulsongkram Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏพิบูลสงคราม',
      imageUrl: 'assets/universities/images/59.jpeg',
      logo:'assets/universities/logo/59.png',
      province: 'Phitsanulok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp60 = University(
      id: 60,
      name: 'Rajabhat Rajanagarindra University',
      thaiName: 'มหาวิทยาลัยราชภัฏราชนครินทร์',
      imageUrl: 'assets/universities/images/60.jpeg',
      logo:'assets/universities/logo/60.png',
      province: 'Chachoengsao',
      description: '',
      map: '',
      numbers: null,
    );
    var temp61 = University(
      id: 61,
      name: 'Rambhai Barni University',
      thaiName: 'มหาวิทยาลัยราชภัฏรำไพพรรณี',
      imageUrl: 'assets/universities/images/61.jpeg',
      logo:'assets/universities/logo/61.png',
      province: 'Chanthaburi',
      description: '',
      map: '',
      numbers: null,
    );
    var temp62 = University(
      id: 62,
      name: 'Lampang Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏลำปาง',
      imageUrl: 'assets/universities/images/62.jpeg',
      logo:'assets/universities/logo/60.png',
      province: 'Lampang',
      description: '',
      map: '',
      numbers: null,
    );
    var temp63 = University(
      id: 63,
      name: 'Loei Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏเลย',
      imageUrl: 'assets/universities/images/63.jpeg',
      logo:'assets/universities/logo/63.png',
      province: 'Loei',
      description: '',
      map: '',
      numbers: null,
    );
    var temp64 = University(
      id: 64,
      name: 'Sisaket Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏศรีสะเกษ',
      imageUrl: 'assets/universities/images/64.jpeg',
      logo:'assets/universities/logo/64.png',
      province: 'Sisaket',
      description: '',
      map: '',
      numbers: null,
    );
    var temp65 = University(
      id: 65,
      name: 'Songkla Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏสงขลา',
      imageUrl: 'assets/universities/images/65.jpeg',
      logo:'assets/universities/logo/64.png',
      province: 'Songkla',
      description: '',
      map: '',
      numbers: null,
    );
    var temp66 = University(
      id: 66,
      name: 'Suan Dusit University',
      thaiName: 'มหาวิทยาลัยสวนดุสิต',
      imageUrl: 'assets/universities/images/66.jpeg',
      logo:'assets/universities/logo/66.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp67 = University(
      id: 67,
      name: 'Suan Sunandha Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏสวนสุนันทา',
      imageUrl: 'assets/universities/images/67.jpeg',
      logo:'assets/universities/logo/67.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp68 = University(
      id: 68,
      name: 'Udon Thani Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏอุดรธานี',
      imageUrl: 'assets/universities/images/68.jpeg',
      logo:'assets/universities/logo/68.jpeg',
      province: 'Udon Thani',
      description: '',
      map: '',
      numbers: null,
    );
    var temp69 = University(
      id: 69,
      name: 'Ubon Ratchathani Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏอุบลราชธานี',
      imageUrl: 'assets/universities/images/69.jpeg',
      logo:'assets/universities/logo/69.png',
      province: 'Ubon Ratchathani',
      description: '',
      map: '',
      numbers: null,
    );
    var temp70 = University(
      id: 70,
      name: 'Suratthani Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏสุราษฏร์ธานี',
      imageUrl: 'assets/universities/images/70.jpeg',
      logo:'assets/universities/logo/70.png',
      province: 'Suratthani',
      description: '',
      map: '',
      numbers: null,
    );
    var temp71 = University(
      id: 71,
      name: 'Bansomdejchaopraya Rajabhat University',
      thaiName: 'มหาวิทยาลัยราชภัฏบ้านสมเด็จเจ้าพระยา',
      imageUrl: 'assets/universities/images/71.jpeg',
      logo:'assets/universities/logo/71.jpeg',
      province: 'Nakorn Ratchasima',
      description: '',
      map: '',
      numbers: null,
    );
    var temp72 = University(
      id: 72,
      name: 'Kasem Bundit University',
      thaiName: 'มหาวิทยาลัยเกษมบัณฑิต',
      imageUrl: 'assets/universities/images/72.jpeg',
      logo:'assets/universities/logo/72.jpeg',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp73 = University(
      id: 73,
      name: 'Siam University',
      thaiName: 'มหาวิทยาลัยสยาม',
      imageUrl: 'assets/universities/images/73.jpeg',
      logo:'assets/universities/logo/73.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp74 = University(
      id: 74,
      name: 'National Buddism University',
      thaiName: 'วิทยาลัยพุทธศาสนานานาชาติ',
      imageUrl: 'assets/universities/images/74.jpg',
      logo:'assets/universities/logo/74.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp75 = University(
      id: 75,
      name: 'Nakorn Ratchasima University',
      thaiName: 'วิทยาลัยนครราชสีมา',
      imageUrl: 'assets/universities/images/75.jpeg',
      logo:'assets/universities/logo/75.jpeg',
      province: 'Nakorn Ratchasima',
      description: '',
      map: '',
      numbers: null,
    );
    var temp76 = University(
      id: 76,
      name: 'Rajamangala University of Technology',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลธัญบุรี',
      imageUrl: 'assets/universities/images/76.jpeg',
      logo:'assets/universities/logo/76.jpeg',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp77 = University(
      id: 77,
      name: 'Rajamangala University of Technology Krungthep',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลกรุงเทพ',
      imageUrl: 'assets/universities/images/77.jpeg',
      logo:'assets/universities/logo/77.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp78 = University(
      id: 78,
      name: 'Rajamangala University of Technology Tawan-ok',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลตะวันออก',
      imageUrl: 'assets/universities/images/78.jpeg',
      logo:'assets/universities/logo/78.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp79 = University(
      id: 79,
      name: 'Rajamangala University of Technology Phra Nakhon',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลพระนคร',
      imageUrl: 'assets/universities/images/79.jpeg',
      logo:'assets/universities/logo/79.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp80 = University(
      id: 80,
      name: 'Rajamangala University of Technology Rattanakosin',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลรัตนโกสินทร์',
      imageUrl: 'assets/universities/images/80.jpeg',
      logo:'assets/universities/logo/80.png',
      province: 'Nakhon Pathom',
      description: '',
      map: '',
      numbers: null,
    );
    var temp81 = University(
      id: 81,
      name: 'Rajamangala University of Technology Lanna',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลล้านนา',
      imageUrl: 'assets/universities/images/81.jpeg',
      logo:'assets/universities/logo/81.png',
      province: 'Chiang Mai',
      description: '',
      map: '',
      numbers: null,
    );
    var temp82 = University(
      id: 82,
      name: 'Rajamangala University of Technology Srivijaya',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลศรีวิชัย',
      imageUrl: 'assets/universities/images/82.jpeg',
      logo:'assets/universities/logo/81.png',
      province: 'Songkhla',
      description: '',
      map: '',
      numbers: null,
    );
    var temp83 = University(
      id: 83,
      name: 'Siam Techonology University',
      thaiName: 'วิทยาลัยเทคโนโลยีสยาม',
      imageUrl: 'assets/universities/images/83.jpeg',
      logo:'assets/universities/logo/83.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp84 = University(
      id: 84,
      name: 'Rajamangala University of Technology Isan',
      thaiName: 'มหาวิทยาลัยเทคโนโลยีราชมงคลอีสาน',
      imageUrl: 'assets/universities/images/84.jpeg',
      logo:'assets/universities/logo/84.png',
      province: 'Nakorn Ratchasima',
      description: '',
      map: '',
      numbers: null,
    );
    var temp85 = University(
      id: 85,
      name: 'Institutions of Community Colleges',
      thaiName: 'สถาบันวิทยาลัยชุมชน',
      imageUrl: 'assets/universities/images/85.jpeg',
      logo:'assets/universities/logo/85.jpeg',
      province: 'Samut Sakhon',
      description: '',
      map: '',
      numbers: null,
    );
    var temp86 = University(
      id: 86,
      name: 'Thailand National Sports University',
      thaiName: 'มหาวิทยาลัยการกีฬาแห่งชาติ',
      imageUrl: 'assets/universities/images/86.jpg',
      logo:'assets/universities/logo/86.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp87 = University(
      id: 87,
      name: 'Bangkok Suvarnabhumi University',
      thaiName: 'มหาวิทยาลัยกรุงเทพสุวรรณภูมิ',
      imageUrl: 'assets/universities/images/87.jpeg',
      logo:'assets/universities/logo/87.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp88 = University(
      id: 88,
      name: 'Rajapruk University',
      thaiName: 'มหาวิทยาลัยราชพฤกษ์',
      imageUrl: 'assets/universities/images/88.jpeg',
      logo:'assets/universities/logo/88.png',
      province: 'Nonthaburi',
      description: '',
      map: '',
      numbers: null,
    );
    var temp89 = University(
      id: 89,
      name: 'Chulabhorn Royal Academy',
      thaiName: 'ราชวิทยาลัยจุฬาภรณ์',
      imageUrl: 'assets/universities/images/89.jpeg',
      logo:'assets/universities/logo/89.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp90 = University(
      id: 90,
      name: 'Thai-Nichi Institute of Technology',
      thaiName: 'สถาบันเทคโนโลยีไทย-ญี่ปุ่น',
      imageUrl: 'assets/universities/images/90.jpeg',
      logo:'assets/universities/logo/90.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp91 = University(
      id: 91,
      name: 'Arsom Silp Institute of the Arts',
      thaiName: 'สถาบันอาศรมศิลป์',
      imageUrl: 'assets/universities/images/91.jpeg',
      logo:'assets/universities/logo/91.jpeg',
      province: 'Ratcha Buri',
      description: '',
      map: '',
      numbers: null,
    );
    var temp92 = University(
      id: 92,
      name: 'Panyapiwat Institute of Management',
      thaiName: 'สถาบันเทคโนโลยีปัญญาภิวัฒน์',
      imageUrl: 'assets/universities/images/92.jpeg',
      logo:'assets/universities/logo/92.png',
      province: 'Nonthaburi',
      description: '',
      map: '',
      numbers: null,
    );
    var temp93 = University(
      id: 93,
      name: 'Learning Institute For Everyone',
      thaiName: 'สถาบันการเรียนรู้เพื่อปวงชน',
      imageUrl: 'assets/universities/images/93.png',
      logo:'assets/universities/logo/93.png',
      province: 'Samut Songkhram',
      description: '',
      map: '',
      numbers: null,
    );
    var temp94 = University(
      id: 94,
      name: 'Mahachai Institute of Automotive Technology',
      thaiName: 'สถาบันเทคโนโลยียานยนต์มหาชัย',
      imageUrl: 'assets/universities/images/94.jpeg',
      logo:'assets/universities/logo/94.png',
      province: 'Samut Sakorn',
      description: '',
      map: '',
      numbers: null,
    );
    var temp95 = University(
      id: 95,
      name: 'Navamindradhiraj University',
      thaiName: 'มหาวิทยาลัยนวมินทราธิราช',
      imageUrl: 'assets/universities/images/95.jpeg',
      logo:'assets/universities/logo/95.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp96 = University(
      id: 96,
      name: 'Chitralada Technology Institute',
      thaiName: 'สถาบันเทคโนโลยีจิตรลดา',
      imageUrl: 'assets/universities/images/96.jpeg',
      logo:'assets/universities/logo/96.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );
    var temp97 = University(
      id: 97,
      name: 'Raffle International College',
      thaiName: 'วิทยาลัยนานาชาติราฟเฟิลส์',
      imageUrl: 'assets/universities/images/97.jpeg',
      logo:'assets/universities/logo/97.png',
      province: 'Bangkok',
      description: '',
      map: '',
      numbers: null,
    );

    var lst = [];
    lst.add(temp1);
    lst.add(temp2);
    lst.add(temp3);
    lst.add(temp4);
    lst.add(temp5);
    lst.add(temp6);
    lst.add(temp7);
    lst.add(temp8);
    lst.add(temp9);
    lst.add(temp10);
    lst.add(temp11);
    lst.add(temp12);
    lst.add(temp13);
    lst.add(temp14);
    lst.add(temp15);
    lst.add(temp16);
    lst.add(temp17);
    lst.add(temp18);
    lst.add(temp19);
    lst.add(temp20);
    lst.add(temp21);
    lst.add(temp22);
    lst.add(temp23);
    lst.add(temp24);
    lst.add(temp25);
    lst.add(temp26);
    lst.add(temp27);
    lst.add(temp28);
    lst.add(temp29);
    lst.add(temp30);
    lst.add(temp31);
    lst.add(temp32);
    lst.add(temp33);
    lst.add(temp34);
    lst.add(temp35);
    lst.add(temp36);
    lst.add(temp37);
    lst.add(temp38);
    lst.add(temp39);
    lst.add(temp40);
    lst.add(temp41);
    lst.add(temp42);
    lst.add(temp43);
    lst.add(temp44);
    lst.add(temp45);
    lst.add(temp46);
    lst.add(temp47);
    lst.add(temp48);
    lst.add(temp49);
    lst.add(temp50);
    lst.add(temp51);
    lst.add(temp52);
    lst.add(temp53);
    lst.add(temp54);
    lst.add(temp55);
    lst.add(temp56);
    lst.add(temp57);
    lst.add(temp58);
    lst.add(temp59);
    lst.add(temp60);
    lst.add(temp61);
    lst.add(temp62);
    lst.add(temp63);
    lst.add(temp64);
    lst.add(temp65);
    lst.add(temp66);
    lst.add(temp67);
    lst.add(temp68);
    lst.add(temp69);
    lst.add(temp70);
    lst.add(temp71);
    lst.add(temp72);
    lst.add(temp73);
    lst.add(temp74);
    lst.add(temp75);
    lst.add(temp76);
    lst.add(temp77);
    lst.add(temp78);
    lst.add(temp79);
    lst.add(temp80);
    lst.add(temp81);
    lst.add(temp82);
    lst.add(temp83);
    lst.add(temp84);
    lst.add(temp85);
    lst.add(temp86);
    lst.add(temp87);
    lst.add(temp88);
    lst.add(temp89);
    lst.add(temp90);
    lst.add(temp91);
    lst.add(temp92);
    lst.add(temp93);
    lst.add(temp94);
    lst.add(temp95);
    lst.add(temp96);
    lst.add(temp97);

    return lst;

  }


}
