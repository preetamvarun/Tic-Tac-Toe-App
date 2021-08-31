class TicTacToe{

    String ans = "";

    var mat = [["","",""],["","",""],["","",""]];

    void insertIntoCell(int rowIndex,int columnIndex,String val){
      mat[rowIndex][columnIndex] = val;
    }

    String checkWinningCondition(){

      for(int i=0;i<3;i++){
        if((mat[i][0] != "") && (mat[i][0] == mat[i][1]) && (mat[i][1] == mat[i][2])){
          ans = "you win";
          break;
        }
      }

      for(int i=0;i<3;i++){
        if((ans != "you win") && (mat[0][i] != "") && (mat[0][i] == mat[1][i]) && (mat[1][i] == mat[2][i])){
          ans = "you win";
          break;
        }

      }

      if((ans != "you win") &&(mat[0][0] != "") && (mat[0][0] == mat[1][1]) && (mat[1][1] == mat[2][2])){
        ans = "you win";
      }

      if( (ans != "you win") && (mat[2][0] != "") && (mat[2][0] == mat[1][1]) && (mat[1][1] == mat[0][2])){
        ans = "you win";
      }

      return ans;
    }

}