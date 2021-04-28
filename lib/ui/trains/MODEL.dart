
import 'package:google_maps/google_maps.dart';

class Station {
  String stationName;
  String address;
  String description;
  String thumbNail;
  LatLng locationCoords;

  Station(
      {this.stationName,
        this.address,
        this.description,
        this.thumbNail,
        this.locationCoords});
}

final List<Station> coffeeShops = [
  Station(
      stationName: 'Ramses Station',
      address: 'Ramses Square , Cairo',
      description:
      'محطة مصر أو محطة رمسيس، هي محطة القطارات المركزية بمدينة القاهرة في مصر. تقع في ميدان رمسيس ',
      locationCoords: LatLng(30.062382, 31.246582),
      thumbNail: 'https://live.staticflickr.com/8235/8426917352_77c93c68b1_b.jpg'
  ),
  Station(
      stationName: 'Giza Station',
      address: 'العمرانية الشرقية، الجيزة، مصر',
      description:
      'محطة الجيزة هي محطة القطارات المركزية تقع في العمرانية',
      locationCoords: LatLng(30.009264, 31.208038),
      thumbNail: 'https://lh3.googleusercontent.com/p/AF1QipNey4GwAfjYgLpMrU_1vCyYk7ixMvp3plG8EGUZ=s1600-h1536'
  ),
  Station(
      stationName: 'Banha Station',
      address: 'قسم بنها، بنها، القليوبية',
      description:
      'محطة بنها هي محطة القطارات المركزية تقع في القليوبية',
      locationCoords: LatLng(30.455546, 31.181067),
      thumbNail: 'https://img.youm7.com/ArticleImgs/2020/5/26/96306-%D8%AA%D8%B1%D9%83%D9%8A%D8%A8-%D8%B9%D9%84%D8%A7%D9%85%D8%A7%D8%AA-%D8%A7%D9%84%D9%85%D8%B3%D8%A7%D9%81%D8%A9-%D8%A8%D9%85%D8%AD%D8%B7%D8%A9-%D9%82%D8%B7%D8%A7%D8%B1-%D8%A8%D9%86%D9%87%D8%A7-7.jpg'
  ),
  Station(
      stationName: 'Tanta Station',
      address: 'طنطا (قسم 2)، طنطا، الغربية',
      description:
      'محطة طنطا هي محطة القطارات المركزية تقع في الغربية',
      locationCoords: LatLng(30.781681, 30.994857),
      thumbNail: 'https://www.shorouknews.com/uploadedimages/Other/original/61715--%D9%85%D8%AD%D8%B7%D8%A9-%D8%A7%D9%84%D8%B3%D9%83%D8%A9-%D8%A7%D9%84%D8%AD%D8%AF%D9%8A%D8%AF--(1).jpg'
  ),
  Station(
      stationName: 'Sohag Station',
      address: 'الخولي، قسم أول سوهاج',
      description:
      'محطة سوهاج هي محطة القطارات المركزية تقع في الصعيد',
      locationCoords: LatLng(26.551354, 31.699072),
      thumbNail: 'https://www.mobtada.com/resize?src=uploads/images/2016/12/146100.jpg&w=750&h=450&zc=0&q=70'
  )
];
