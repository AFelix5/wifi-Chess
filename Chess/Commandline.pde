void run_command(){
  if(input.charAt(0)=='/'){
    if(config[1]) chat.add(input);
    if(input.indexOf("help")==1){
      if(input.substring(5).equals("")){
        chat.add("Help:");
        chat.add("-----------------------------");
        chat.add("/help {[int]}");
        chat.add("/debug {[boolean]}");
        chat.add("/debugLog [boolean]");
        chat.add("/showPossible [boolean]");
      }
      else if(input.substring(5).matches(" \\d+")){
        int number = Integer.parseInt(input.substring(6));
        switch(number){
          case 1:
            chat.add("Help1:");
            chat.add("-----------------------------");
            chat.add("/help {[int]}");
            chat.add("/debug {[boolean]}");
            chat.add("/debugLog [boolean]");
            chat.add("/showPossible [boolean]");
          break;
          case 2:
            chat.add("Help2:");
            chat.add("-----------------------------");
            chat.add("/preSets [String]");
            chat.add("/rotate {[boolean]} ");
            chat.add("/play {[boolean]}");
            chat.add("/rules [String] [boolean]");
          break;
          case 3:
            chat.add("Help3:");
            chat.add("-----------------------------");
            chat.add("/save");
            chat.add("/load [int]");
            chat.add("/next {[int]}");
            chat.add("/back {[int]}");
          break;
          case 4:
            chat.add("Help4:");
            chat.add("-----------------------------");
            chat.add("/set [int] {[int] [int]}");
            chat.add("/move [int] [int] [int] [int] {[boolean]}");
            chat.add("/fullScreen {[int] [int]}");
            chat.add("/depth [int]");
          break;
          case 5:
            chat.add("Help5:");
            chat.add("-----------------------------");
            chat.add("/connect [int] {[int] [int] [int] [int]}");
            chat.add("/config [String]");
            chat.add("/sync {[boolean]}");
            chat.add("/info");
          break;
          default:
            if(!config[1]) chat.add(input);
            chat.add("Help: /help {[int]}");
          break;
        }
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /help {[int]}");
      }
    }
    else if(input.indexOf("debug")==1){
      if(input.substring(6).equals("")){
        if(config[0]){
          config[0] = false;
          config[1] = false;
          chat.remove(chat.size()-1);
        }
        else{
          config[0] = true;
          config[1] = true;
        }
      }
      else if(input.substring(6).equals(" true")){
        config[0] = true;
      }
      else if(input.substring(6).equals(" false")){
        config[0] = false;
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /debug {[boolean]}");
      }
    }
    else if(input.indexOf("debugLog")==1){
      if(input.substring(9).equals(" true")){
        config[1] = true;
        chat.add(input);
      }
      else if(input.substring(9).equals(" false")){
        config[1] = false;
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /debugLog [boolean]");
      }
    }
    else if(input.indexOf("showPossible")==1){
      if(input.substring(13).equals(" true")){
        config[6] = true;
      }
      else if(input.substring(13).equals(" false")){
        config[6] = false;
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /showPossible [boolean]");
      }
    }
    else if(input.indexOf("preSet")==1){
      if(input.substring(7).equals(" Setup")){
        config[2] = true;
        config[3] = false;
        config[6] = false;
        config[7] = false;
        config[8] = false;
      }
      else if(input.substring(7).equals(" 1Player")){
        config[2] = false;
        config[3] = true;
        config[6] = true;
        config[7] = false;
        config[8] = true;
      }
      else if(input.substring(7).equals(" 2Player")){
        config[2] = false;
        config[3] = true;
        config[6] = true;
        config[7] = true;
        config[8] = false;
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /preSet [String]");
        chat.add("Try: Setup 1Player 2Player");
      }
    }
    else if(input.indexOf("rotate")==1){
      if(input.substring(7).equals("")){
        mouse_x = 7-mouse_x;
        mouse_y = 7-mouse_y;
        board[0][8] ^= 2;
        int[][] rotate = clone(board);
        for(int i=0; i<8; i++){
          for (int j=0; j<8; j++){
            board[i][j] = rotate[7-i][7-j];
          }
        }
      }
      else if(input.substring(7).equals(" true")){
        config[7] = true;
      }
      else if(input.substring(7).equals(" false")){
        config[7] = false;
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /rotate");
      }
    }
    else if(input.indexOf("play")==1){
      if(input.substring(5).equals("")){
        mouse_x = -1;
        mouse_y = -1;
        minmax(depth,board);
      }
      else if(input.substring(5).equals(" true")){
        config[8] = true;
      }
      else if(input.substring(5).equals(" false")){
        config[8] = false;
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /play {[boolean]}");
      }
    }
    else if(input.indexOf("rules")==1){
      if(input.matches(" freePlay [true|false]")){
        config[2] = input.substring(16).equals("true");
      }
      else if(input.matches(" kingCheck [true|false]")){
        config[3] = input.substring(18).equals("true");
      }
      else if(input.matches(" autoQueen [true|false]")){
        config[4] = input.substring(18).equals("true");
      }
      else if(input.matches(" doubleMove [true|false]")){
        config[5] = input.substring(19).equals("true");
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /rules [String] [boolean]");
        chat.add("Try: freePlay kingCheck autoQueen doubleMove");
      }
    }
    else if(input.indexOf("save")==1){
      if(input.substring(5).equals("")){
        index++;
        if(index<history.size()){
          for(int i=history.size(); i>index; i--){
            history.remove(i-1);
          }
        }
        history.add(clone(board));
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /save");
      }
    }
    else if(input.indexOf("load")==1){
      if(input.substring(5).matches(" [0-4]")){
        board = board_init[Integer.parseInt(input.substring(6))];
        mouse_x = -1;
        mouse_y = -1;
        index++;
        if(index<history.size()){
          for(int i=history.size(); i>index; i--){
            history.remove(i-1);
          }
        }
        history.add(clone(board));
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /load [int]");
      }
    }
    else if(input.indexOf("next")==1){
      if(input.substring(5).equals("")){
        if(index<history.size()-1){
          mouse_x = -1;
          mouse_y = -1;
          index++;
          board = clone(history.get(index));
        }
      }
      else if(input.substring(5).matches(" \\d+")){
        mouse_x = -1;
        mouse_y = -1;
        int number = Integer.parseInt(input.substring(6));
        for(int i=0; i<number; i++){
          if(index<history.size()-1){
            index++;
            board = clone(history.get(index));
          }
        }
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /next {[int]}");
      }
    }
    else if(input.indexOf("back")==1){
      if(input.substring(5).equals("")){
        if(index>0){
          mouse_x = -1;
          mouse_y = -1;
          index--;
          board = clone(history.get(index));
        }
      }
      else if(input.substring(5).matches(" \\d+")){
        mouse_x = -1;
        mouse_y = -1;
        int number = Integer.parseInt(input.substring(6));
        for(int i=0; i<number; i++){
          if(index>0){
            index--;
            board = clone(history.get(index));
          }
        }
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /back {[int]}");
      }
    }
    else if(input.indexOf("set")==1){
      if(input.substring(4).matches(" \\d+")){
        int number = Integer.parseInt(input.substring(6));
        if(number<4096){
          board[0][8] = number;
        }
        else{
          if(!config[1]) chat.add(input);
          chat.add("Help: /set [int] {[int] [int]}");
        }
      }
      else if(input.substring(4).matches(" \\d+ \\d \\d")){
        int number = Integer.parseInt(input.substring(5,input.length()-4));
        int x = Integer.parseInt(String.valueOf(input.charAt(input.length()-1)));
        int y = Integer.parseInt(String.valueOf(input.charAt(input.length()-3)));
        if(number<38&&x<8&&y<8){
          board[x][y] = number;
        }
        else{
          if(!config[1]) chat.add(input);
          chat.add("Help: /set [int] {[int] [int]}");
        }
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /set [int] {[int] [int]}");
      }
    }
    else if(input.indexOf("move")==1){
      if(input.substring(5).matches(" \\d \\d \\d \\d[ true| false]?")){
        int x1 = Integer.parseInt(String.valueOf(input.charAt(6)));
        int y1 = Integer.parseInt(String.valueOf(input.charAt(8)));
        int x2 = Integer.parseInt(String.valueOf(input.charAt(10)));
        int y2 = Integer.parseInt(String.valueOf(input.charAt(12)));
        if(input.substring(13).equals("")){
          if(move(x1,y1,x2,y2,board,config[3])){
            index++;
            if(index<history.size()){
              for(int i=history.size(); i>index; i--){
                history.remove(i-1);
              }
            }
            history.add(clone(board));
          }
          else{
            chat.add("Move not valid!");
          }
        }
        else{
          boolean force = config[2];
          config[2] = input.substring(14).equals("true");
          if(!move(x1,y1,x2,y2,board,config[3])){
            chat.add("Move not valid!");
          }
          config[2] = force;
        }
        index++;
        if(index<history.size()){
          for(int i=index; i<history.size(); i++){
            history.remove(i);
          }
        }
        history.add(clone(board));
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /move [int] [int] [int] [int] {[boolean]}");
      }
    }
    else if(input.indexOf("fullScreen")==1){
      if(input.substring(11).equals("")){
        //surface.setSize(displayWidth, displayHeight);
      }
      else if(input.substring(11).matches(" \\d+ \\d+")){
        int char_index = 0;
        for(int i=0; i<input.length(); i++){
          if(input.charAt(i)==' ')char_index = i;
        }
        int x = Integer.parseInt(input.substring(12,char_index));
        int y = Integer.parseInt(input.substring(char_index+1,input.length()));
        print(x+" "+y);
        //surface.setSize(x,y);
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /fullScreen {[int] [int]}");
      }
    }
    else if(input.indexOf("depth")==1){
      if(input.substring(6).matches(" \\d+")){
        depth = Integer.parseInt(input.substring(7));
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /depth [int]");
      }
    }
    else if(input.indexOf("connect")==1){
      if(input.substring(8).matches(" \\d+")){
        port = Integer.parseInt(input.substring(9));
      }
      else if(input.substring(8).matches(" \\d+ \\d+ \\d+ \\d+ \\d+")){
        
      }
      else{
        if(!config[1]) chat.add(input);
        chat.add("Help: /connect [int] {[int] [int] [int] [int]}");
      }
    }
    else{
      if(!config[1]) chat.add(input);
      chat.add("Type \"/help\" for List of Commands.");
    }
  }
  else{
    chat.add(input);
    //TO-DO
  }
  input = "";
}
