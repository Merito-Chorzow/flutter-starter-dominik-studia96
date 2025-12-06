
class Entry {
  final String id;         
  final String title;       
  final String description; 
  final String location;    
  final String? imageUrl;   
  final DateTime date;      


  Entry({
    required this.id,
    required this.title,
    required this.description,
    required this.location,
    this.imageUrl,           
    required this.date,
  });

 
  factory Entry.fromJson(Map<String, dynamic> json) {
    return Entry(
      id: json['id'],                             
      title: json['title'],                      
      description: json['description'],          
      location: json['location'],                
      imageUrl: json['imageUrl'],                 
      date: DateTime.parse(json['date']),          
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,                               
      'title': title,                              
      'description': description,                  
      'location': location,                     
      'imageUrl': imageUrl,                      
      'date': date.toIso8601String(),            
    };
  }
}
