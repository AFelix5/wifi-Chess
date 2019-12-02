//import processing.net.*;

PImage[] image = new PImage[38];
int[][][] board_init = {{{8 ,4 ,0 ,0 ,0 ,0 ,2 ,6 ,0 },
                         {16,4 ,0 ,0 ,0 ,0 ,2 ,14},
                         {12,4 ,0 ,0 ,0 ,0 ,2 ,10},
                         {24,4 ,0 ,0 ,0 ,0 ,2 ,22},
                         {20,4 ,0 ,0 ,0 ,0 ,2 ,18},
                         {12,4 ,0 ,0 ,0 ,0 ,2 ,10},
                         {16,4 ,0 ,0 ,0 ,0 ,2 ,14},
                         {8 ,4 ,0 ,0 ,0 ,0 ,2 ,6 }},
                        {{0 ,32,0 ,0 ,0 ,30,0 ,30,0 },
                         {32,0 ,32,0 ,0 ,0 ,30,0 },
                         {0 ,32,0 ,0 ,0 ,30,0 ,30},
                         {32,0 ,32,0 ,0 ,0 ,30,0 },
                         {0 ,32,0 ,0 ,0 ,30,0 ,30},
                         {32,0 ,32,0 ,0 ,0 ,30,0 },
                         {0 ,32,0 ,0 ,0 ,30,0 ,30},
                         {32,0 ,32,0 ,0 ,0 ,30,0 }},
                        {{0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {0 ,0 ,0 ,0 ,0 ,0 ,0 ,0 }},
                        {{0 ,4 ,8 ,12,16,20,24,28,0 },
                         {0 ,4 ,8 ,12,16,20,24,28},
                         {1 ,5 ,9 ,13,17,21,25,29},
                         {1 ,5 ,9 ,13,17,21,25,29},
                         {2 ,6 ,10,14,18,22,26,30},
                         {2 ,6 ,10,14,18,22,26,30},
                         {3 ,7 ,11,15,19,23,27,31},
                         {3 ,7 ,11,15,19,23,27,31}},
                        {{32,36,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {32,36,0 ,0 ,0 ,0 ,0 ,0 },
                         {33,37,0 ,0 ,0 ,0 ,0 ,0 },
                         {33,37,0 ,0 ,0 ,0 ,0 ,0 },
                         {34,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {34,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {35,0 ,0 ,0 ,0 ,0 ,0 ,0 },
                         {35,0 ,0 ,0 ,0 ,0 ,0 ,0 }}};
boolean[] config = {false,false,true,true,false,false,false,false,true};
ArrayList<int[][]> history = new ArrayList<int[][]>();
ArrayList<String> chat = new ArrayList<String>();
String input = "";
int port = 128;
int[][] board;
int index = 0;
int depth = 4;
int width_old = 0;
int height_old = 0;
int mouse_image = 0;
int mouse_x = -1;
int mouse_y = -1;
int tile;

void setup(){
  //fullScreen();
  //size(displayWidth, displayHeight);
  size(1000,600);
  surface.setResizable(true);
  tile = min(width/10,height/10);
  image[0] = loadImage("Pices/Chess_00t60.png");
  image[1] = loadImage("Pices/Chess_01t60.png");
  image[2] = loadImage("Pices/Chess_pwt60.png");
  image[3] = loadImage("Pices/Chess_plt60.png");
  image[4] = loadImage("Pices/Chess_pbt60.png");
  image[5] = loadImage("Pices/Chess_pdt60.png");
  image[6] = loadImage("Pices/Chess_rwt60.png");
  image[7] = loadImage("Pices/Chess_rlt60.png");
  image[8] = loadImage("Pices/Chess_rbt60.png");
  image[9] = loadImage("Pices/Chess_rdt60.png");
  image[10] = loadImage("Pices/Chess_bwt60.png");
  image[11] = loadImage("Pices/Chess_blt60.png");
  image[12] = loadImage("Pices/Chess_bbt60.png");
  image[13] = loadImage("Pices/Chess_bdt60.png");
  image[14] = loadImage("Pices/Chess_nwt60.png");
  image[15] = loadImage("Pices/Chess_nlt60.png");
  image[16] = loadImage("Pices/Chess_nbt60.png");
  image[17] = loadImage("Pices/Chess_ndt60.png");
  image[18] = loadImage("Pices/Chess_qwt60.png");
  image[19] = loadImage("Pices/Chess_qlt60.png");
  image[20] = loadImage("Pices/Chess_qbt60.png");
  image[21] = loadImage("Pices/Chess_qdt60.png");
  image[22] = loadImage("Pices/Chess_kwt60.png");
  image[23] = loadImage("Pices/Chess_klt60.png");
  image[24] = loadImage("Pices/Chess_kbt60.png");
  image[25] = loadImage("Pices/Chess_kdt60.png");
  image[26] = loadImage("Pices/Chess_mwt60.png");
  image[27] = loadImage("Pices/Chess_mlt60.png");
  image[28] = loadImage("Pices/Chess_mbt60.png");
  image[29] = loadImage("Pices/Chess_mdt60.png");
  image[30] = loadImage("Pices/Chess_xwt60.png");
  image[31] = loadImage("Pices/Chess_xlt60.png");
  image[32] = loadImage("Pices/Chess_xbt60.png");
  image[33] = loadImage("Pices/Chess_xdt60.png");
  image[34] = loadImage("Pices/Chess_ywt60.png");
  image[35] = loadImage("Pices/Chess_ylt60.png");
  image[36] = loadImage("Pices/Chess_ybt60.png");
  image[37] = loadImage("Pices/Chess_ydt60.png");
  board = clone(board_init[0]);
  history.add(clone(board));
}

void draw(){
  if(width!=width_old||height!=height_old){
    width_old = width;
    height_old = height;
    draw_board();
  }
}

void draw_board(){
  tile = min(width/10,height/10);
  background(127);
  textSize(tile/2);
  for(int i=0; i<8; i++){
    for (int j=0; j<8; j++){
      if((i+j)%2==0){
        fill(64);
      }
      else{
       fill(194);
      }
      rect(tile*(i+1),tile*(j+1),tile,tile);
      image(image[board[i][j]],tile*(i+1),tile*(j+1),tile,tile);
    }
  }
  if(config[0]){
    if(width<height){
      fill(255);
      rect(tile*9/8,tile*37/4,tile*31/4,height-tile*99/8,tile/16);
      rect(tile*9/8,height-tile*23/8,tile*31/4,tile*3/4,tile/16);
      fill(63);
      rect(tile*9/8,height-tile*15/8,tile*15/4,tile*3/4,tile/16);
      rect(tile*41/8,height-tile*15/8,tile*15/4,tile*3/4,tile/16);
      fill(0);
      textAlign(LEFT,CENTER);
      text(input,tile*9/8,height-tile*23/8,tile*31/4,tile*3/4);
      for(int i=1; i<((height*4)/(tile*3))-31/2; i++){
        if(chat.size()>i-1)text(chat.get(chat.size()-i),tile*9/8,height-tile*(25+6*i)/8,tile*31/4,tile*3/4);
      }
      fill(191);
      textAlign(CENTER,CENTER);
      text("Submit",tile*9/8,height-tile*15/8,tile*15/4,tile*3/4);
      text("Back",tile*41/8,height-tile*15/8,tile*15/4,tile*3/4);
    }
    else{
      fill(255);
      rect(tile*37/4,tile*9/8,width-tile*83/8,tile*19/4,tile/16);
      rect(tile*37/4,tile*49/8,width-tile*83/8,tile*3/4,tile/16);
      fill(63);
      rect(tile*37/4,tile*57/8,width-tile*83/8,tile*3/4,tile/16);
      rect(tile*37/4,tile*65/8,width-tile*83/8,tile*3/4,tile/16);
      fill(0);
      textAlign(LEFT,CENTER);
      text(input,tile*37/4,tile*49/8,width-tile*83/8,tile*3/4);
      for(int i=1; i<7; i++){
        if(chat.size()>i-1)text(chat.get(chat.size()-i),tile*37/4,tile*(47-6*i)/8,width-tile*83/8,tile*3/4);
      }
      fill(191);
      textAlign(CENTER,CENTER);
      text("Submit",tile*37/4,tile*57/8,width-tile*83/8,tile*3/4);
      text("Back",tile*37/4,tile*65/8,width-tile*83/8,tile*3/4);
    }
  }
  else{
    if(width<height){
      if(height-tile*81/8<tile*4){
        fill(63);
        rect(tile*9/8,tile*37/4,tile*15/4,height/2-tile*85/16,tile/8);
        rect(tile*41/8,tile*37/4,tile*15/4,height/2-tile*85/16,tile/8);
        rect(tile*9/8,height/2+tile*17/4,tile*29/12,height/2-tile*85/16,tile/8);
        rect(tile*91/24,height/2+tile*17/4,tile*29/12,height/2-tile*85/16,tile/8);
        rect(tile*155/24,height/2+tile*17/4,tile*29/12,height/2-tile*85/16,tile/8);
        fill(191);
        textAlign(CENTER,CENTER);
        text("Back",tile*9/8,tile*37/4,tile*15/4,height/2-tile*85/16);
        text("Next",tile*41/8,tile*37/4,tile*15/4,height/2-tile*85/16);
        if(config[7]&&!config[8]){
          text("Rotate",tile*91/24,height/2+tile*17/4,tile*29/12,height/2-tile*85/16);
        }
        else if(!config[7]&&config[8]){
          text("Play",tile*91/24,height/2+tile*17/4,tile*29/12,height/2-tile*85/16);
        }
        else{
          text("Do",tile*91/24,height/2+tile*17/4,tile*29/12,height/2-tile*85/16);
        }
        text("New Board",tile*9/8,height/2+tile*17/4,tile*29/12,height/2-tile*85/16);
        text("Debug",tile*155/24,height/2+tile*17/4,tile*29/12,height/2-tile*85/16);
      }
      else{
        fill(63);
        rect(tile*9/8,tile*37/4,tile*15/4,height/4-tile*89/32,tile/8);
        rect(tile*41/8,tile*37/4,tile*15/4,height/4-tile*89/32,tile/8);
        rect(tile*9/8,height/4+tile*215/32,tile*31/4,height/4-tile*89/32,tile/8);
        rect(tile*9/8,height/2+tile*67/16,tile*31/4,height/4-tile*89/32,tile/8);
        rect(tile*9/8,height*3/4+tile*53/32,tile*31/4,height/4-tile*89/32,tile/8);
        fill(191);
        textAlign(CENTER,CENTER);
        text("Back",tile*9/8,tile*37/4,tile*15/4,height/4-tile*89/32);
        text("Next",tile*41/8,tile*37/4,tile*15/4,height/4-tile*89/32);
        if(config[7]&&!config[8]){
          text("Rotate",tile*9/8,height/4+tile*215/32,tile*31/4,height/4-tile*89/32);
        }
        else if(!config[7]&&config[8]){
          text("Play",tile*9/8,height/4+tile*215/32,tile*31/4,height/4-tile*89/32);
        }
        else{
          text("Do",tile*9/8,height/4+tile*215/32,tile*31/4,height/4-tile*89/32);
        }
        text("New Board",tile*9/8,height/2+tile*67/16,tile*31/4,height/4-tile*89/32);
        text("Debug",tile*9/8,height*3/4+tile*53/32,tile*31/4,height/4-tile*89/32);
      }
    }
    else{
      fill(63);
      if(width/2-tile*85/16<tile*5/4){
        rect(tile*37/4,tile*9/8,width-tile*83/8,tile*3/4,tile/8);
        rect(tile*37/4,tile*17/8,width-tile*83/8,tile*3/4,tile/8);
      }
      else{
        rect(tile*37/4,tile*9/8,width/2-tile*85/16,tile*7/4,tile/8);
        rect(width/2+tile*67/16,tile*9/8,width/2-tile*85/16,tile*7/4,tile/8);
      }
      rect(tile*37/4,tile*25/8,width-tile*83/8,tile*7/4,tile/8);
      rect(tile*37/4,tile*41/8,width-tile*83/8,tile*7/4,tile/8);
      rect(tile*37/4,tile*57/8,width-tile*83/8,tile*7/4,tile/8);
      fill(191);
      textAlign(CENTER,CENTER);
      if(width/2-tile*85/16<tile*5/4){
        text("Back",tile*37/4,tile*9/8,width-tile*83/8,tile*3/4);
        text("Next",tile*37/4,tile*17/8,width-tile*83/8,tile*3/4);
      }
      else{
        text("Back",tile*37/4,tile*9/8,width/2-tile*85/16,tile*7/4);
        text("Next",width/2+tile*67/16,tile*9/8,width/2-tile*85/16,tile*7/4);
      }
      if(config[7]&&!config[8]){
        text("Rotate",tile*37/4,tile*25/8,width-tile*83/8,tile*7/4);
      }
      else if(!config[7]&&config[8]){
        text("Play",tile*37/4,tile*25/8,width-tile*83/8,tile*7/4);
      }
      else{
        text("Do",tile*37/4,tile*25/8,width-tile*83/8,tile*7/4);
      }
      text("New Board",tile*37/4,tile*41/8,width-tile*83/8,tile*7/4);
      text("Debug",tile*37/4,tile*57/8,width-tile*83/8,tile*7/4);
    }
  }
}

int[][] clone(int[][] in){
  int[][] out = new int[in.length][];
  for(int i=0; i<in.length; i++){
    out[i] = new int[in[i].length];
    for (int j=0; j<in[i].length; j++){
      out[i][j] = in[i][j];
    }
  }
  return out;
}

boolean choose(int[][] test){
  for(int i=0; i<8; i++){
    for (int j=0; j<8; j++){
      if(test[i][j]>25&&test[i][j]<30) return true;
    }
  }
  return false;
}

boolean equal(int[][] test1,int[][] test2){
  for(int i=0; i<8; i++){
    for (int j=0; j<8; j++){
      if(test1[i][j]!=test2[i][j]) return false;
    }
  }
  return true;
}
 
void mousePressed(){
  if(mouseX<tile&&mouseY<tile){
    print("hello"); //<>//
  }
  if(mouse_image==0&&tile<mouseX&&mouseX<9*tile&&tile<mouseY&&mouseY<9*tile){
    int x = mouseX/tile-1;
    int y = mouseY/tile-1;
    if((board[x][y]-2)/4==6){}
    if(mouse_x!=-1&&mouse_y!=-1&&move(mouse_x,mouse_y,x,y,board,config[3])){
      for(int i=0; i<8; i++){
        for (int j=0; j<8; j++){
          if(board[i][j]%2==1)board[i][j]--;
        }
      }
      index++;
      if(index<history.size()){
        for(int i=history.size(); i>index; i--){
          history.remove(i-1);
        }
      }
      history.add(clone(board));
      if(!choose(board)){
        if(config[7]){
          mouse_x = 7-mouse_x;
          mouse_y = 7-mouse_y;
          board[0][8] ^= 2;
          int[][] rotate = clone(board);
          for(int i=0; i<8; i++){
            for (int j=0; j<8; j++){
              board[i][j] = rotate[7-i][7-j];
            }
          }
          index++;
          if(index<history.size()){
            for(int i=history.size(); i>index; i--){
              history.remove(i-1);
            }
          }
          history.add(clone(board));
        }
        if(config[8]){
          minmax(depth,board);
          index++;
          if(index<history.size()){
            for(int i=history.size(); i>index; i--){
              history.remove(i-1);
            }
          }
          history.add(clone(board));
        }
      }
      draw_board();
    }
    else{
      for(int i=0; i<8; i++){
        for (int j=0; j<8; j++){
          if(board[i][j]%2==1)board[i][j]--;
          if(move(x,y,i,j,clone(board),config[3])&&config[6])board[i][j]++;
        }
      }
      mouse_image = board[x][y];
      board[x][y] = 0;
      mouse_x = x;
      mouse_y = y;
      draw_board();
      image(image[mouse_image],mouseX-(tile/2),mouseY-(tile/2),tile,tile);
    }
  }
  else{
    if(config[0]){
      if(width<height){
        if(mouseX>tile*9/8&&mouseY>height-tile*15/8&&mouseX<tile*39/8&&mouseY<height-tile*9/8){
          if(!input.equals("")){
            run_command();
          }
          draw_board();
        }
        if(mouseX>tile*41/8&&mouseY>height-tile*15/8&&mouseX<tile*71/8&&mouseY<height-tile*9/8){
          input = "/debug";
          run_command();
          draw_board();
        }
      }
      else{
        if(mouseX>tile*37/4&&mouseY>tile*57/8&&mouseX<width-tile*9/8&&mouseY<tile*77/8){
          if(!input.equals("")){
            run_command();
          }
          draw_board();
        }
        if(mouseX>tile*37/4&&mouseY>tile*65/8&&mouseX<width-tile*9/8&&mouseY<tile*77/8){
          input = "/debug";
          run_command();
          draw_board();
        }
      }
    }
    else{
      if(width<height){
        if(height-tile*81/8<tile*4){
          if(mouseX>tile*9/8&&mouseY>tile*37/4&&mouseX<tile*39/8&&mouseY<height/2+tile*63/16){
            input = "/back";
            run_command();
            draw_board();
          }
          if(mouseX>tile*41/8&&mouseY>tile*37/4&&mouseX<tile*71/8&&mouseY<height/2+tile*63/16){
            input = "/next";
            run_command();
            draw_board();
          }
          if(mouseX>tile*9/8&&mouseY>height/2+tile*17/4&&mouseX<tile*85/24&&mouseY<height-tile*9/8){
            input = "/load 0";
            run_command();
            draw_board();
          }
          if(mouseX>tile*91/24&&mouseY>height/2+tile*17/4&&mouseX<tile*149/24&&mouseY<height-tile*9/8){
            if(config[7]){
              input = "/rotate";
              run_command();
              input = "/save";
              run_command();
            }
            if(config[8]){
              input = "/play";
              run_command();
              input = "/save";
              run_command();
            }
            draw_board();
          }
          if(mouseX>tile*155/24&&mouseY>height/2+tile*17/4&&mouseX<tile*71/8&&mouseY<height-tile*9/8){
            input = "/debug";
            run_command();
            draw_board();
          }
        }
        else{
          if(mouseX>tile*9/8&&mouseY>tile*37/4&&mouseX<tile*39/8&&mouseY<height/4+tile*205/16){
            input = "/back";
            run_command();
            draw_board();
          }
          if(mouseX>tile*41/8&&mouseY>tile*37/4&&mouseX<tile*71/8&&mouseY<height/4+tile*205/16){
            input = "/next";
            run_command();
            draw_board();
          }
          if(mouseX>tile*9/8&&mouseY>height/4+tile*215/32&&mouseX<tile*71/8&&mouseY<height/2+tile*41/8){
            if(config[7]){
              input = "/rotate";
              run_command();
              input = "/save";
              run_command();
            }
            if(config[8]){
              input = "/play";
              run_command();
              input = "/save";
              run_command();
            }
            draw_board();
          }
          if(mouseX>tile*9/8&&mouseY>height/2+tile*67/16&&mouseX<tile*71/8&&mouseY<height*3/4+tile*43/32){
            input = "/load 0";
            run_command();
            draw_board();
          }
          if(mouseX>tile*9/8&&mouseY>height*3/4+tile*53/32&&mouseX<tile*71/8&&mouseY<height-tile*9/8){
            input = "/debug";
            run_command();
            draw_board();
          }
        }
      }
      else{
        if(width/2-tile*85/16<tile*5/4){
          if(mouseX>tile*37/4&&mouseY>tile*9/8&&mouseX<width-tile*9/8&&mouseY<tile*15/8){
            input = "/back";
            run_command();
            draw_board();
          }
          if(mouseX>tile*37/4&&mouseY>tile*17/8&&mouseX<width-tile*9/8&&mouseY<tile*23/8){
            input = "/next";
            run_command();
            draw_board();
          }
        }
        else{
          if(mouseX>tile*37/4&&mouseY>tile*9/8&&mouseX<width/2+tile*63/16&&mouseY<tile*23/8){
            input = "/back";
            run_command();
            draw_board();
          }
          if(mouseX>width/2+tile*67/16&&mouseY>tile*9/8&&mouseX<width-tile*9/8&&mouseY<tile*23/8){
            input = "/next";
            run_command();
            draw_board();
          }
        }
        if(mouseX>tile*37/4&&mouseY>tile*25/8&&mouseX<width-tile*9/8&&mouseY<tile*39/8){
          if(config[7]){
            input = "/rotate";
            run_command();
            input = "/save";
            run_command();
          }
          if(config[8]){
            input = "/play";
            run_command();
            input = "/save";
            run_command();
          }
          draw_board();
        }
        if(mouseX>tile*37/4&&mouseY>tile*41/8&&mouseX<width-tile*9/8&&mouseY<tile*55/8){
          input = "/load 0";
          run_command();
          draw_board();
        }
        if(mouseX>tile*37/4&&mouseY>tile*57/8&&mouseX<width-tile*9/8&&mouseY<tile*71/8){
          input = "/debug";
          run_command();
          draw_board();
        }
      }
    }
  }
}

void mouseReleased(){
  if(mouse_x!=-1&&mouse_y!=-1&&mouse_image!=0){
    int x = mouse_x;
    int y = mouse_y;
    if(tile<mouseX&&mouseX<9*tile&&tile<mouseY&&mouseY<9*tile){
      x = mouseX/tile-1;
      y = mouseY/tile-1;
    }
    board[mouse_x][mouse_y] = mouse_image;
    mouse_image = 0;
    if(move(mouse_x,mouse_y,x,y,board,config[3])){
      for(int i=0; i<8; i++){
        for (int j=0; j<8; j++){
          if(board[i][j]%2==1)board[i][j]--;
        }
      }
      index++;
      if(index<history.size()){
        for(int i=history.size(); i>index; i--){
          history.remove(i-1);
        }
      }
      history.add(clone(board));
      if(!choose(board)){
        if(config[7]){
          mouse_x = 7-mouse_x;
          mouse_y = 7-mouse_y;
          board[0][8] ^= 2;
          int[][] rotate = clone(board);
          for(int i=0; i<8; i++){
            for (int j=0; j<8; j++){
              board[i][j] = rotate[7-i][7-j];
            }
          }
          index++;
          if(index<history.size()){
            for(int i=history.size(); i>index; i--){
              history.remove(i-1);
            }
          }
          history.add(clone(board));
        }
        if(config[8]){
          minmax(depth,board);
          index++;
          if(index<history.size()){
            for(int i=history.size(); i>index; i--){
              history.remove(i-1);
            }
          }
          history.add(clone(board));
        }
      }
    }
    draw_board();
  }
}

void mouseDragged(){
  if(mouse_image!=0){
    draw_board();
    image(image[mouse_image],mouseX-(tile/2),mouseY-(tile/2),tile,tile);
  }
}

void keyTyped(){
  if(config[0]){
    switch(key){
      case '\n':
      case '\r':
        if(!input.equals("")){
          run_command();
        }
      break;
      case '\b':
        if(input.length()>0){
          input = input.substring(0,input.length()-1);
        }
      break;
      default:
        input += key;
    }
    draw_board();
  }
}
