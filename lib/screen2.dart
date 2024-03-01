import 'package:flutter/material.dart';
import 'package:movies/screen1.dart';
import 'package:provider/provider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Screen2 extends StatefulWidget {
  const Screen2({Key? key}) : super(key: key);

  @override
  State<Screen2> createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  bool _isDescriptionVisible = false;
  bool _isliked = false;
  double _rating  = 0;
  void _toggleLike() {
    setState(() {
      _isliked = !_isliked;
    });
  }
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
                MaterialPageRoute(builder: (context) => screen1()),);
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
           SizedBox(
             height: 10,
           ),

        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left : 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.thumb_up_sharp,
                  color: _isliked ? Colors.blue : Colors.white,
                ),
                onPressed:
                _toggleLike
                ,),
            ),
             SizedBox(
               width: 200,
             ),
             RatingBar.builder(
              initialRating: _rating,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 30.0,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ), onRatingUpdate: (rating) {
                setState(() {
                  _rating = rating;
                });
             },)
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
           ElevatedButton(onPressed:(){
             setState(() {
               _isDescriptionVisible = ! _isDescriptionVisible;
             });
             
           },
             child:
             Text(_isDescriptionVisible ? 'Hide Description' : 'Show Description'),),
           Visibility(
             visible: _isDescriptionVisible,
               child: Consumer<datamodel1>(
                 builder: (context, mydata,child){
                   String descripion =  mydata.getdescription(movieindex) ;
                   String test = 'hello';
                   return Text(descripion, style: TextStyle(color: Colors.white, fontSize: 20),);
                 },
               ), )
        
        
        
        
        
        
        
         ],
        ),
      ),



    );
  }
}
