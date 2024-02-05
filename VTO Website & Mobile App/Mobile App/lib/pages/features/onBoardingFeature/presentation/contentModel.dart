class ContentModel {
 final String image;
 final String title;
 final String subtitle;
 final String description;

  ContentModel({required this.image,required this.title,required this.subtitle,required this.description});
}

List<ContentModel> contents = [
  ContentModel(  
    image: "assets/logo.png",
    title:  "Welcome to MirrorMeNow",
    description:  "Try on your perfect look, without leaving your nook - with MirrorMeNow!", subtitle: ''
  ),
  ContentModel(  
    image: "assets/f1.png",
    title:  "Frames's VirtualTryon",
    description:  "\"Find your perfect pair of glasses with a virtual try-on experience - See it to believe it!\"", subtitle: ''
  ),
  ContentModel(  
    image: "assets/shirt3.png",
    title:  "Shirt's VirtualTryon",
    description:  "Experience the perfect fit every time - Try on shirts virtually with just a tap!", subtitle: ''
  ),
];
