
boolean move(int x1,int y1,int x2,int y2,int[][] feld,boolean king){
  if(x1>7||y1>7||x2>7||y2>7||(x1==x2&&y1==y2)||feld[x1][y1]<2) return false;
  if(config[2]){
    feld[x2][y2] = feld[x1][y1];
    feld[x1][y1] = 0;
    return true;
  }
  if((feld[x1][y1]-2)%4/2!=feld[0][8]%2||(feld[x2][y2]>1&&(feld[x1][y1]-2)%4/2==(feld[x2][y2]-2)%4/2))return false;
  int[][] befor = clone(feld);
  if(feld[0][8]%4/2==1){
    int[][] rotate = clone(feld);
    x1 = 7-x1;
    x2 = 7-x2;
    y1 = 7-y1;
    y2 = 7-y2;
    for(int i=0; i<8; i++){
      for (int j=0; j<8; j++){
        feld[i][j] = rotate[7-i][7-j];
      }
    }
  }
  switch((feld[x1][y1]-2)/4){
    case 0:
      if(pow(x1-x2,2)+pow(y1-y2,2)<3&&min(max(y2-y1,-1),1)==feld[0][8]%2*2-1){
        if(abs(y2-y1)==1&&x1==x2&&feld[x2][y2]<2){
          feld[x2][y2] = feld[x1][y1];
          feld[x1][y1] = 0;
        }
        if(abs(y2-y1)==abs(x2-x1)&&feld[x2][y2]>1&&(feld[x2][y2]-2)%4/2==1-feld[0][8]%2){
          feld[x2][y2] = feld[x1][y1];
          feld[x1][y1] = 0;
        }
        if(abs(y2-y1)==abs(x2-x1)&&feld[x2][y2]>1&&(feld[x2][y2]-2)%4/2==1-feld[0][8]%2){
          feld[x2][y2] = feld[x1][y1];
          feld[x1][y1] = 0;
        }
        //  6/5-(1/5)*y1&&x1==x2&&feld[x1][y){
        //feld[0][8] |= int(64*pow(2,x1)*pow(256,y2-3));
        //feld[x2][y2] = feld[x1][y1];
        //feld[x1][y1] = 0;
      }
    break;
    case 1:
      if(x1==x2||y1==y2){
        int x = x1;
        int y = y1;
        while(!((x>x2&&x2>x1)||(y>y2&&y2>y1)||(x<x2&&x2<x1)||(y<y2&&y2<y1))){
          x = x+min(max(x2-x1,-1),1);
          y = y+min(max(y2-y1,-1),1);
          if(x==x2&&y==y2){
            feld[x2][y2] = feld[x1][y1];
            feld[x1][y1] = 0;
          }
          if(feld[x][y]>1)break;
        }
      }
    break;
    case 2:
      if(abs(x1-x2)==abs(y1-y2)){
        int x = x1;
        int y = y1;
        while(!((x>x2&&x2>x1)||(y>y2&&y2>y1)||(x<x2&&x2<x1)||(y<y2&&y2<y1))){
          x = x+min(max(x2-x1,-1),1);
          y = y+min(max(y2-y1,-1),1);
          if(x==x2&&y==y2){
            feld[x2][y2] = feld[x1][y1];
            feld[x1][y1] = 0;
          }
          if(feld[x][y]>1)break;
        }
      }
    break;
    case 3:
      if(pow(x1-x2,2)+pow(y1-y2,2)==5){
        feld[x2][y2] = feld[x1][y1];
        feld[x1][y1] = 0;
      }
    break;
    case 4:
      if(x1==x2||y1==y2||abs(x2-x1)==abs(y2-y1)){
        int x = x1;
        int y = y1;
        while(!((x>x2&&x2>x1)||(y>y2&&y2>y1)||(x<x2&&x2<x1)||(y<y2&&y2<y1))){
          x = x+min(max(x2-x1,-1),1);
          y = y+min(max(y2-y1,-1),1);
          if(x==x2&&y==y2){
            feld[x2][y2] = feld[x1][y1];
            feld[x1][y1] = 0;
          }
          if(feld[x][y]>1)break;
        }
      }
    break;
    case 5:
      if(abs(x2-x1)<2&&abs(y2-y1)<2){
        feld[0][8] |= int(12*pow(4,float(floor((feld[x1][y1]-2)%4/2))));
        feld[x2][y2] = feld[x1][y1];
        feld[x1][y1] = 0;
      }
    break;
    case 6:
    break;
    case 7:
    break;
    case 8:
    break;
  }
  feld[0][8] &= int(4194303-16320*pow(256,1-feld[0][8]%2));
  if(feld[0][8]%4/2==1){
    int[][] rotate = clone(feld);
    x1 = 7-x1;
    x2 = 7-x2;
    y1 = 7-y1;
    y2 = 7-y2;
    for(int i=0; i<8; i++){
      for (int j=0; j<8; j++){
        feld[i][j] = rotate[7-i][7-j];
      }
    }
  }
  if(king&&!equal(feld,befor)){
    int x = -1;
    int y = -1;
    for(int i=0; i<8; i++){
      for(int j=0; j<8; j++){
        if(feld[i][j]/2==11+feld[0][8]%2){
          x = i;
          y = j;
        }
      }
    }
    if(x==-1||y==-1){
      feld = befor;
      return false;
    }
    for(int i=0; i<8; i++){
      for(int j=0; j<8; j++){
        for(int k=0; k<8; k++){
          for(int l=0; l<8; l++){
            int[][] test = clone(feld);
            test[0][8] ^= 1;
            if(move(i,j,k,l,test,false)&&test[x][y]/2!=11+feld[0][8]%2)feld = befor;
          }
        }
      }
    }
  }
  if(!equal(feld,befor)){
    feld[0][8] ^= 1;
    return true;
  }
  return false;
}

int minmax(int d,int[][] feld){
  print(d);
  if(d<1){
    int score = 0;
    //TO-DO
    score = 50;
    for(int i=0; i<8; i++){
      for(int j=0; j<8; j++){
        if((feld[i][j]-2)%4/2==0){
          score += ((feld[i][j]-2)/4);
        }
        else{
          score -= ((feld[i][j]-2)/4);
        }
      }
    }
    //TO-DO
    return score;
  }
  else{
    int score;
    if(feld[0][8]%2==0){
      score = 0;
    }
    else{
      score = 100;
    }
    ArrayList<int[][]> best_board = new ArrayList<int[][]>();
    best_board.add(feld);
    for(int i=0; i<8; i++){
      for(int j=0; j<8; j++){
        for(int k=0; k<8; k++){
          for(int l=0; l<8; l++){
            int[][] test = clone(feld);
            if(move(i,j,k,l,test,config[3])){
              int this_score = minmax(d-1,clone(test));
              if(this_score==score)best_board.add(test);
              if(feld[0][8]%2==0&&this_score>score){
                best_board = new ArrayList<int[][]>();
                best_board.add(test);
                score = this_score;
              }
              if(feld[0][8]%2==1&&this_score<score){
                best_board = new ArrayList<int[][]>();
                best_board.add(test);
                score = this_score;
              }
            }
          }
        }
      }
    }
    feld = best_board.get(int(random(best_board.size())));
    return score;
  }
}
