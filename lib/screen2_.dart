import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movies/screen1.dart';

class MovieData extends ChangeNotifier {
  bool _isDescriptionVisible = false;
  bool _isliked = false;
  double _rating = 0;

  bool get isLiked => _isliked;

  double get rating => _rating;

 int toggleLike() {
    _isliked = !_isliked;
    notifyListeners();
    return 0;
  }

 int setRating(double rating) {
    _rating = rating;
    notifyListeners();
    return 0;
  }

 int toggleDescriptionVisibility() {
    _isDescriptionVisible = !_isDescriptionVisible;
    notifyListeners();
    return 0;
  }

  void reset() {
    _isDescriptionVisible = false;

  }

  bool get isDescriptionVisible => _isDescriptionVisible;

}

class screen2_ extends StatelessWidget {
  const screen2_({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.white10,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white,),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => screen1()),).then((_) => Provider.of<MovieData>(context, listen: false).reset());
          },
        ),
      ),

    body:
    SingleChildScrollView(
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    SizedBox(
    height: 50,
    ),
    Center(
    child: Container(
    height: 325,
    width: 375,
    color: Colors.transparent,
    child: Consumer<datamodel1>(
    builder: (context, mydata,child){
    String imageurl =  mydata.getimage(movieindex) ;
    String test = 'hello';
    return Image.network('https://image.tmdb.org/t/p/w500' + imageurl, );
    },
    ),

    ),
    ),
      Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left : 8.0),
            child: Consumer<MovieData>(
              builder: (context, moviedata, child){
                return IconButton(
                  onPressed: moviedata.toggleLike,
                  icon: Icon(Icons.thumb_up_sharp,
                  color: moviedata._isliked? Colors.blue : Colors.white,
                ),);
              },
            ),
          ),
          SizedBox(
            width: 200,
          ),
          Consumer<MovieData>(
              builder: (context, moviedata, child){
                return RatingBar.builder(
                  initialRating: moviedata._rating,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemSize: 30.0,
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ), onRatingUpdate: (rating) {

                    moviedata._rating = rating;

                },);
              }
          )

        ],
      ),

      SizedBox(
        height: 20,
      ),

      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Consumer<datamodel1>(
          builder: (context, mydata, child){
            String moviename =mydata.getname(movieindex);
            return Text('Movie Name :  ' + moviename, style: TextStyle(color: Colors.white, fontSize: 20), );
          },
        ),

      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Consumer<datamodel1>(
          builder: (context, mydata, child){
            double AudienceRating =mydata.getAudienceRATING(movieindex);
            return Text('Audience Rating :  ' + AudienceRating.toString(), style: TextStyle(color: Colors.white, fontSize: 20), );
          },
        ),

      ),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Consumer<datamodel1>(
          builder: (context, mydata, child){
            String releasedate =mydata.getreleasedate(movieindex);
            return Text('Release Date :  ' + releasedate, style: TextStyle(color: Colors.white, fontSize: 20), );
          },
        ),

      ),

      SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Consumer<datamodel1>(
          builder: (context, mydata, child){
            bool adult =mydata.isadult(movieindex);
            return Text(adult == true ? 'Age Rating : Adult' : 'Age Rating : UA', style: TextStyle(color: Colors.white, fontSize: 20), );
          },
        ),

      ),
      SizedBox(
        height: 10,
      ),

      Consumer<MovieData>(
          builder: (context, moviedata, child){
            return ElevatedButton(onPressed:
              moviedata.toggleDescriptionVisibility,
               child:  Text(moviedata._isDescriptionVisible ? 'Hide Description' : 'Show Description'),);

            },

             ),
                Consumer<MovieData>(
        builder:  (context, moviedata, child){
            return Visibility(
            visible: moviedata._isDescriptionVisible,
            child: Consumer<datamodel1>(
        builder: (context, mydata,child){
        String descripion =  mydata.getdescription(movieindex) ;
        return Text(descripion, style: TextStyle(color: Colors.white, fontSize: 20),);
        },
        ), );
        }),


    ],
    ),
    ));
  }
}
