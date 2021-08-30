String TTO(){

  String ans = "draw";

  int m = 3,n = 3;

  // var mat = List.generate(m, (i) => ["a","b","c"], growable: false);

  var mat = [["c","b","b"],["a","a","c"],["a","a","b"]];


  for(int i=0;i<m;i++){
    if((mat[i][0] != '') && (mat[i][0] == mat[i][1]) && (mat[i][1] == mat[i][2])){
      ans = "you win";
      break;
    }
  }

  for(int i=0;i<m;i++){
    if((mat[0][i] != '') && (mat[0][i] == mat[1][i]) && (mat[1][i] == mat[2][i])){
      ans = "you win";
      break;
    }
  }

  if( (mat[0][0] != '') && (mat[0][0] == mat[1][1]) && (mat[1][1] == mat[2][2])){
    ans = "you win";
  }

  if( (mat[2][0] != '') && (mat[2][0] == mat[1][1]) && (mat[1][1] == mat[0][2])){
    ans = "you win";
  }

  return ans;
}


void main(){
  String finalResult = TTO();
  print(finalResult);
}

/*
a b c
a a a
a a c
 */