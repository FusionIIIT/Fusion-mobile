class MessItem{
  int id;
  String mealTime;
  String dish;
  String messOption;
  MessItem({required this.id, required this.mealTime,required this.dish,required this.messOption});

  factory MessItem.fromJson(Map<String,dynamic> x){
    return MessItem(id:x['id'],mealTime:x['meal_time'],dish:x['dish'],messOption:x['mess_option']);
  }
}

List<String> getdata(String x)
{
  int len = x.length;
  return [x.substring(0,len-1),x[len-1]];
}

void insertatindex(List<String> x, String time,String dish) {
  if (time == 'B') {
    x[0] = dish;
  } else if (time == 'L') {
    x[1] = dish;
  } else {
    x[2] = dish;
  }
}

List<List<String>> processMessItems(List<MessItem> messitems){
  List<String> M=['','',''];
  List<String> T = ['','',''];
  List<String> W = ['','',''];
  List<String> TH = ['','',''];
  List<String> F = ['','',''];
  List<String> S = ['','',''];
  List<String> SU = ['','',''];
  Map<String,int> mp={};
  for(var m in messitems)
  {
    var temp = getdata(m.mealTime);
    String day=temp[0];
    String time = temp[1];
    if(!mp.containsKey(day))
    {
      mp[day]=1;
      switch(day){
        case 'M': insertatindex(M,time,m.dish);
        break;
        case 'T':insertatindex(T,time,m.dish);
        break;

        case 'W':insertatindex(W,time,m.dish);
        break;

        case 'TH':insertatindex(TH,time,m.dish);
        break;

        case 'F':insertatindex(F,time,m.dish);
        break;

        case 'S':insertatindex(S,time,m.dish);
        break;

        case 'SU':insertatindex(SU,time,m.dish);
        break;
      }
    }
    else if(mp[day]!<=3)
    {
      mp[day]= mp[day]!+1;
      switch(day){
        case 'M': insertatindex(M,time,m.dish);
        break;
        case 'T':insertatindex(T,time,m.dish);
        break;

        case 'W':insertatindex(W,time,m.dish);
        break;

        case 'TH':insertatindex(TH,time,m.dish);
        break;

        case 'F':insertatindex(F,time,m.dish);
        break;

        case 'S':insertatindex(S,time,m.dish);
        break;

        case 'SU':insertatindex(SU,time,m.dish);
        break;
      }
    }
  }
  return [M,T,W,TH,F,S,SU];
}

