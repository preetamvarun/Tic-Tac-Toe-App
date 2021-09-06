
class TicTacToe{

    String ans = "",ansLetter = "";

    var mat = [["","",""],["","",""],["","",""]];

    void insertIntoCell(int rowIndex,int columnIndex,String val){
      mat[rowIndex][columnIndex] = val;
      ansLetter = val;
    }

    String checkWinningCondition(){

      for(int i=0;i<3;i++){
        if((mat[i][0] != "") && (mat[i][0] == mat[i][1]) && (mat[i][1] == mat[i][2])){
          ans = ansLetter +" "+"Wins";
          break;
        }
      }

      for(int i=0;i<3;i++){
        if((ans != "you win") && (mat[0][i] != "") && (mat[0][i] == mat[1][i]) && (mat[1][i] == mat[2][i])){
          ans = ansLetter +" "+"Wins";
          break;
        }
      }

      if((ans != "you win") &&(mat[0][0] != "") && (mat[0][0] == mat[1][1]) && (mat[1][1] == mat[2][2])){
        ans = ansLetter +" "+"Wins";
      }

      if( (ans != "you win") && (mat[2][0] != "") && (mat[2][0] == mat[1][1]) && (mat[1][1] == mat[0][2])){
        ans = ansLetter +" "+"Wins";
      }

      return ans;
    }

    String checkDrawCondition(){

      bool isDraw = true;
      for(int i = 0; i < 3; i++){
        for(int j = 0; j < 3; j++){
          if(mat[i][j] == ""){
            isDraw = false;
            break;
          }
        }
        if(isDraw){
          continue;
        }
        else{
          break;
        }
      }
      if(isDraw){
        ans = "Draw";
      }
      else{
        ans = "";
      }

      return ans;
    }
}