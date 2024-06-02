class jobsModel{
    int id;
    String name;
    String image;
    String job_time_type;
    String job_type;
    int job_level;
    String job_description;
    String job_skill;
    String comp_name;
    String comp_email;
    String comp_website;
    String about_comp;
    String location;
    String salary;
    String favorites;
    String expired;
    String created_at;
    String updated_at;
    jobsModel({
      required this.id,
      required this.name,
      required this.image,
      required this.job_time_type,
      required this.job_type,
      required this.job_level,
      required this.job_description,
      required this.job_skill,
      required this.comp_name,
      required this.comp_email,
      required this.comp_website,
      required this.about_comp,
      required this.location,
      required this.salary,
      required this.favorites,
      required this.expired,
      required this.created_at,
      required this.updated_at,


    });

    factory jobsModel.formJson(Map<String,dynamic>? json){
      return jobsModel(
          id: json!['id'],
          name: json!['name'],
          image: json!['image'],
          job_time_type: json!['job_time_type'],
          job_type: json!['job_type'],
          job_level: json!['job_level'],
          job_description: json!['job_description'],
          job_skill: json!['job_skill'],
          comp_name: json!['comp_name'],
          comp_email: json!['comp_email'],
          comp_website: json!['comp_website'],
          about_comp: json!['about_comp'],
          location: json!['location'],
          salary: json!['salary'],
          favorites: json!['favorites'],
          expired: json!['expired'],
          created_at: json!['created_at'],
          updated_at: json!['updated_at'],
      );
    }

    Map<String,dynamic> toMap(){
      return{
        'id': id,
        'name': name,
        'image' : image,
        'job_time_type' : job_time_type,
        'job_type' : job_type,
        'job_level' : job_level,
        'job_description' : job_description,
        'job_skill' : job_skill,
        'comp_name' : comp_name,
        'comp_email' : comp_email,
        'comp_website' : comp_website,
        'about_comp' : about_comp,
        'location' : location,
        'salary' : salary,
        'favorites' : favorites,
        'expired' : expired,
        'created_at' : created_at,
        'updated_at' : updated_at,
      };
    }

}