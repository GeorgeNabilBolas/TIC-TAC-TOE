import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

extension contain on List {
  bool containAll(int num1, int num2, [int? num3]) {
    return num3 == null
        ? contains(num1) && contains(num2)
        : contains(num1) && contains(num2) && contains(num3);
  }
}

class WidgetesXO extends ChangeNotifier {
//____________________________________________________________________________
//____________________________________________________________________________
//____________________________________________________________________________

  List avatars = [
    'images/avatar-1.png',
    'images/avatar-2.png',
    'images/avatar-3.png',
    'images/avatar-4.png',
  ];
  TextEditingController setname = TextEditingController();
  TextEditingController setnameTwo_1 = TextEditingController();
  TextEditingController setnameTwo_2 = TextEditingController();
  int setwinscore = 1,
      setdrawscore = 1,
      setwinscoreTwo = 1,
      setdrawscoreTwo = 1,
      setAvatartid = 0,
      setAvatartidTwo_1 = 0,
      setAvatartidTwo_2 = 0,
      setwinplayerXcount = 0,
      setwinplayerTwocount_1 = 0,
      setwinplayerTwocount_2 = 0,
      setwinplayerOcount = 0,
      setdrawcount = 0,
      setdrawcountTwo = 0;
  bool setAudioIsPlayed = true;
  bool isXChosen = true,
      isXwin = false,
      isOwin = false,
      isDraw = false,
      isStillInGame = true;
  bool onePlayerGameisXChosen = true;
  List onePlayerGameXList = [],
      onePlayerGameOList = [],
      winnerXO = [],
      Chart = List.generate(9, (index) => index);
  String level = 'Easy';
  bool multiTouche = true;
  bool xPlay = true;
  void setWinner() {
    if (isXwin && setwinplayerXcount < setwinscore) {
      ++setwinplayerXcount;
      print('x: $setwinplayerXcount');
    } else if (isOwin && setwinplayerOcount < setwinscore) {
      ++setwinplayerOcount;
      print('o: $setwinplayerOcount');
    } else if (isDraw && setdrawcount < setdrawscore) {
      ++setdrawcount;
      print('draw: $setdrawcount');
    }
    notifyListeners();
  }

  void setWinnerTwo() {
    if (isXwin && setwinplayerTwocount_1 < setwinscoreTwo) {
      ++setwinplayerTwocount_1;
      print('x: $setwinplayerXcount');
    } else if (isOwin && setwinplayerTwocount_2 < setwinscoreTwo) {
      ++setwinplayerTwocount_2;
      print('o: $setwinplayerTwocount_2');
    } else if (isDraw && setdrawcountTwo < setdrawscoreTwo) {
      ++setdrawcountTwo;
      print('draw: $setdrawcountTwo');
    }
    notifyListeners();
  }

  void onePlayerGameEASY(int Index) {
    if (onePlayerGameisXChosen) {
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length == 1) {
        onePlayerGameXList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
      }
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length > 1) {
        onePlayerGameXList.add(Index);
        onePlayerGameStateLogic();
        if (isStillInGame == false) return;
        Chart.remove(Index);
        Chart.shuffle();
        onePlayerGameOList.add(Chart.first);
        Chart.remove(Chart.first);
      }
    }
    if (!onePlayerGameisXChosen) {
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length == 1) {
        if (Chart.length == 9) {
          Chart.shuffle();
          onePlayerGameXList.add(Chart.first);
          Chart.remove(Chart.first);
          return;
        }
        onePlayerGameOList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
      }
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length > 1) {
        onePlayerGameOList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
        if (isStillInGame == false) return;
        Chart.remove(Index);
        Chart.shuffle();
        onePlayerGameXList.add(Chart.first);
        Chart.remove(Chart.first);
      }
    }
    notifyListeners();
  }

  void twoPlayerGame(int Index) {
    print(xPlay);
    if (!onePlayerGameOList.contains(Index) &&
        !onePlayerGameXList.contains(Index)) {
      if (xPlay) {
        onePlayerGameXList.add(Index);
        notifyListeners();
      }
      // onePlayerGameStateLogic();
      if (isStillInGame == false) return;
      if (!xPlay) {
        onePlayerGameOList.add(Index);
        notifyListeners();
      }
      xPlay = xPlay == true ? false : true;
    }

    notifyListeners();
  }

  void onePlayerGameMEDIUM(int Index) {
    if (onePlayerGameisXChosen) {
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length == 1) {
        onePlayerGameXList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
      }
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length > 1) {
        onePlayerGameXList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
        if (isStillInGame == false) return;
        Chart.remove(Index);

//_______________________
        if ((onePlayerGameOList.containAll(0, 4)) &&
            !onePlayerGameXList.contains(8)) {
          onePlayerGameOList.add(8);
          Chart.remove(8);
          return;
        } else if ((onePlayerGameOList.containAll(0, 8)) &&
            !onePlayerGameXList.contains(4)) {
          onePlayerGameOList.add(4);
          Chart.remove(4);
          return;
        } else if ((onePlayerGameOList.containAll(4, 8)) &&
            !onePlayerGameXList.contains(0)) {
          onePlayerGameOList.add(0);
          Chart.remove(0);
          return;
        }
        if ((onePlayerGameOList.containAll(2, 4)) &&
            !onePlayerGameXList.contains(6)) {
          onePlayerGameOList.add(6);
          Chart.remove(6);
          return;
        } else if ((onePlayerGameOList.containAll(4, 6)) &&
            !onePlayerGameXList.contains(2)) {
          onePlayerGameOList.add(2);
          Chart.remove(2);
          return;
        } else if ((onePlayerGameOList.containAll(2, 6)) &&
            !onePlayerGameXList.contains(4)) {
          onePlayerGameOList.add(4);
          Chart.remove(4);
          return;
        }

        for (int i = 0; i <= 6; i += 3) {
          if (onePlayerGameOList.containAll(i, i + 1) &&
              !onePlayerGameXList.contains(i + 2)) {
            onePlayerGameOList.add(i + 2);
            Chart.remove(i + 2);
            return;
          } else if (onePlayerGameOList.containAll(i, i + 2) &&
              !onePlayerGameXList.contains(i + 1)) {
            onePlayerGameOList.add(i + 1);
            Chart.remove(i + 1);
            return;
          } else if (onePlayerGameOList.containAll(i + 1, i + 2) &&
              !onePlayerGameXList.contains(i)) {
            onePlayerGameOList.add(i);
            Chart.remove(i);
            return;
          }
        }
        for (int i = 0; i < 3; i++) {
          if (onePlayerGameOList.containAll(i, i + 3) &&
              !onePlayerGameXList.contains(i + 6)) {
            onePlayerGameOList.add(i + 6);
            Chart.remove(i + 6);
            return;
          } else if (onePlayerGameOList.containAll(i, i + 6) &&
              !onePlayerGameXList.contains(i + 3)) {
            onePlayerGameOList.add(i + 3);
            Chart.remove(i + 3);
            return;
          } else if (onePlayerGameOList.containAll(i + 3, i + 6) &&
              !onePlayerGameXList.contains(i)) {
            onePlayerGameOList.add(i);
            Chart.remove(i);
            return;
          }
        }

//_______________________

        Chart.shuffle();
        onePlayerGameOList.add(Chart.first);
        Chart.remove(Chart.first);
      }
    }
    if (!onePlayerGameisXChosen) {
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length == 1) {
        onePlayerGameOList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
      }
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length > 1) {
        if (Chart.length == 9) {
          Chart.shuffle();
          onePlayerGameXList.add(Chart.first);
          Chart.remove(Chart.first);
          return;
        }
        onePlayerGameOList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
        if (isStillInGame == false) return;
        Chart.remove(Index);

//_______________________
        // bool add = false;
        if ((onePlayerGameXList.containAll(0, 4)) &&
            !onePlayerGameOList.contains(8)) {
          onePlayerGameXList.add(8);
          Chart.remove(8);
          return;
        } else if ((onePlayerGameXList.containAll(0, 8)) &&
            !onePlayerGameOList.contains(4)) {
          onePlayerGameXList.add(4);
          Chart.remove(4);
          return;
        } else if ((onePlayerGameXList.containAll(4, 8)) &&
            !onePlayerGameOList.contains(0)) {
          onePlayerGameXList.add(0);
          Chart.remove(0);
          return;
        }
        if ((onePlayerGameXList.containAll(2, 4)) &&
            !onePlayerGameOList.contains(6)) {
          onePlayerGameXList.add(6);
          Chart.remove(6);
          return;
        } else if ((onePlayerGameXList.containAll(4, 6)) &&
            !onePlayerGameOList.contains(2)) {
          onePlayerGameXList.add(2);
          Chart.remove(2);
          return;
        } else if ((onePlayerGameXList.containAll(2, 6)) &&
            !onePlayerGameOList.contains(4)) {
          onePlayerGameXList.add(4);
          Chart.remove(4);
          return;
        }

        for (int i = 0; i <= 6; i += 3) {
          if (onePlayerGameXList.containAll(i, i + 1) &&
              !onePlayerGameOList.contains(i + 2)) {
            onePlayerGameXList.add(i + 2);
            Chart.remove(i + 2);
            return;
          } else if (onePlayerGameXList.containAll(i, i + 2) &&
              !onePlayerGameOList.contains(i + 1)) {
            onePlayerGameXList.add(i + 1);
            Chart.remove(i + 1);
            return;
          } else if (onePlayerGameXList.containAll(i + 1, i + 2) &&
              !onePlayerGameOList.contains(i)) {
            onePlayerGameXList.add(i);
            Chart.remove(i);
            return;
          }
        }
        for (int i = 0; i < 3; i++) {
          if (onePlayerGameXList.containAll(i, i + 3) &&
              !onePlayerGameOList.contains(i + 6)) {
            onePlayerGameXList.add(i + 6);
            Chart.remove(i + 6);
            return;
          } else if (onePlayerGameXList.containAll(i, i + 6) &&
              !onePlayerGameOList.contains(i + 3)) {
            onePlayerGameXList.add(i + 3);
            Chart.remove(i + 3);
            return;
          } else if (onePlayerGameXList.containAll(i + 3, i + 6) &&
              !onePlayerGameOList.contains(i)) {
            onePlayerGameXList.add(i);
            Chart.remove(i);
            return;
          }
        }

//_______________________

        Chart.shuffle();
        onePlayerGameXList.add(Chart.first);
        Chart.remove(Chart.first);
      }
    }
    notifyListeners();
  }

  void onePlayerGameHARD(int Index) {
    if (onePlayerGameisXChosen) {
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length == 1) {
        onePlayerGameXList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
      }
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length > 1) {
        onePlayerGameXList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
        if (isStillInGame == false) return;
        Chart.remove(Index);

//_______________________Attack_____________________

        if (!onePlayerGameXList.contains(4) &&
            !onePlayerGameOList.contains(4)) {
          onePlayerGameOList.add(4);
          Chart.remove(4);
          return;
        }
        if ((onePlayerGameOList.containAll(0, 4)) &&
            !onePlayerGameXList.contains(8)) {
          onePlayerGameOList.add(8);
          Chart.remove(8);
          return;
        } else if ((onePlayerGameOList.containAll(0, 8)) &&
            !onePlayerGameXList.contains(4)) {
          onePlayerGameOList.add(4);
          Chart.remove(4);
          return;
        } else if ((onePlayerGameOList.containAll(4, 8)) &&
            !onePlayerGameXList.contains(0)) {
          onePlayerGameOList.add(0);
          Chart.remove(0);
          return;
        }
        if ((onePlayerGameOList.containAll(2, 4)) &&
            !onePlayerGameXList.contains(6)) {
          onePlayerGameOList.add(6);
          Chart.remove(6);
          return;
        } else if ((onePlayerGameOList.containAll(4, 6)) &&
            !onePlayerGameXList.contains(2)) {
          onePlayerGameOList.add(2);
          Chart.remove(2);
          return;
        } else if ((onePlayerGameOList.containAll(2, 6)) &&
            !onePlayerGameXList.contains(4)) {
          onePlayerGameOList.add(4);
          Chart.remove(4);
          return;
        }

        for (int i = 0; i <= 6; i += 3) {
          if (onePlayerGameOList.containAll(i, i + 1) &&
              !onePlayerGameXList.contains(i + 2)) {
            onePlayerGameOList.add(i + 2);
            Chart.remove(i + 2);
            return;
          } else if (onePlayerGameOList.containAll(i, i + 2) &&
              !onePlayerGameXList.contains(i + 1)) {
            onePlayerGameOList.add(i + 1);
            Chart.remove(i + 1);
            return;
          } else if (onePlayerGameOList.containAll(i + 1, i + 2) &&
              !onePlayerGameXList.contains(i)) {
            onePlayerGameOList.add(i);
            Chart.remove(i);
            return;
          }
        }
        for (int i = 0; i < 3; i++) {
          if (onePlayerGameOList.containAll(i, i + 3) &&
              !onePlayerGameXList.contains(i + 6)) {
            onePlayerGameOList.add(i + 6);
            Chart.remove(i + 6);
            return;
          } else if (onePlayerGameOList.containAll(i, i + 6) &&
              !onePlayerGameXList.contains(i + 3)) {
            onePlayerGameOList.add(i + 3);
            Chart.remove(i + 3);
            return;
          } else if (onePlayerGameOList.containAll(i + 3, i + 6) &&
              !onePlayerGameXList.contains(i)) {
            onePlayerGameOList.add(i);
            Chart.remove(i);
            return;
          }
        }

//_______________________Attack_____________________
//_______________________Defense_____________________

        if ((onePlayerGameXList.containAll(0, 4)) &&
            !onePlayerGameOList.contains(8)) {
          onePlayerGameOList.add(8);
          Chart.remove(8);
          return;
        } else if ((onePlayerGameXList.containAll(0, 8)) &&
            !onePlayerGameOList.contains(4)) {
          onePlayerGameOList.add(4);
          Chart.remove(4);
          return;
        } else if ((onePlayerGameXList.containAll(4, 8)) &&
            !onePlayerGameOList.contains(0)) {
          onePlayerGameOList.add(0);
          Chart.remove(0);
          return;
        }
        if ((onePlayerGameXList.containAll(2, 4)) &&
            !onePlayerGameOList.contains(6)) {
          onePlayerGameOList.add(6);
          Chart.remove(6);
          return;
        } else if ((onePlayerGameXList.containAll(4, 6)) &&
            !onePlayerGameOList.contains(2)) {
          onePlayerGameOList.add(2);
          Chart.remove(2);
          return;
        } else if ((onePlayerGameXList.containAll(2, 6)) &&
            !onePlayerGameOList.contains(4)) {
          onePlayerGameOList.add(4);
          Chart.remove(4);
          return;
        }

        for (int i = 0; i <= 6; i += 3) {
          if (onePlayerGameXList.containAll(i, i + 1) &&
              !onePlayerGameOList.contains(i + 2)) {
            onePlayerGameOList.add(i + 2);
            Chart.remove(i + 2);
            return;
          } else if (onePlayerGameXList.containAll(i, i + 2) &&
              !onePlayerGameOList.contains(i + 1)) {
            onePlayerGameOList.add(i + 1);
            Chart.remove(i + 1);
            return;
          } else if (onePlayerGameXList.containAll(i + 1, i + 2) &&
              !onePlayerGameOList.contains(i)) {
            onePlayerGameOList.add(i);
            Chart.remove(i);
            return;
          }
        }
        for (int i = 0; i < 3; i++) {
          if (onePlayerGameXList.containAll(i, i + 3) &&
              !onePlayerGameOList.contains(i + 6)) {
            onePlayerGameOList.add(i + 6);
            Chart.remove(i + 6);
            return;
          } else if (onePlayerGameXList.containAll(i, i + 6) &&
              !onePlayerGameOList.contains(i + 3)) {
            onePlayerGameOList.add(i + 3);
            Chart.remove(i + 3);
            return;
          } else if (onePlayerGameXList.containAll(i + 3, i + 6) &&
              !onePlayerGameOList.contains(i)) {
            onePlayerGameOList.add(i);
            Chart.remove(i);
            return;
          }
        }

//_______________________Defense_____________________

        Chart.shuffle();
        onePlayerGameOList.add(Chart.first);
        Chart.remove(Chart.first);
      }
    }
    if (!onePlayerGameisXChosen) {
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length == 1) {
        onePlayerGameOList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
      }
      if (!onePlayerGameOList.contains(Index) &&
          !onePlayerGameXList.contains(Index) &&
          Chart.length > 1) {
        if (Chart.length == 9) {
          onePlayerGameXList.add(4);
          Chart.remove(4);
          return;
        }
        onePlayerGameOList.add(Index);
        notifyListeners();
        onePlayerGameStateLogic();
        if (isStillInGame == false) return;
        Chart.remove(Index);

//_______________________Attack_____________________

        if ((onePlayerGameXList.containAll(0, 4)) &&
            !onePlayerGameOList.contains(8)) {
          onePlayerGameXList.add(8);
          Chart.remove(8);
          return;
        } else if ((onePlayerGameXList.containAll(0, 8)) &&
            !onePlayerGameOList.contains(4)) {
          onePlayerGameXList.add(4);
          Chart.remove(4);
          return;
        } else if ((onePlayerGameXList.containAll(4, 8)) &&
            !onePlayerGameOList.contains(0)) {
          onePlayerGameXList.add(0);
          Chart.remove(0);
          return;
        }
        if ((onePlayerGameXList.containAll(2, 4)) &&
            !onePlayerGameOList.contains(6)) {
          onePlayerGameXList.add(6);
          Chart.remove(6);
          return;
        } else if ((onePlayerGameXList.containAll(4, 6)) &&
            !onePlayerGameOList.contains(2)) {
          onePlayerGameXList.add(2);
          Chart.remove(2);
          return;
        } else if ((onePlayerGameXList.containAll(2, 6)) &&
            !onePlayerGameOList.contains(4)) {
          onePlayerGameXList.add(4);
          Chart.remove(4);
          return;
        }

        for (int i = 0; i <= 6; i += 3) {
          if (onePlayerGameXList.containAll(i, i + 1) &&
              !onePlayerGameOList.contains(i + 2)) {
            onePlayerGameXList.add(i + 2);
            Chart.remove(i + 2);
            return;
          } else if (onePlayerGameXList.containAll(i, i + 2) &&
              !onePlayerGameOList.contains(i + 1)) {
            onePlayerGameXList.add(i + 1);
            Chart.remove(i + 1);
            return;
          } else if (onePlayerGameXList.containAll(i + 1, i + 2) &&
              !onePlayerGameOList.contains(i)) {
            onePlayerGameXList.add(i);
            Chart.remove(i);
            return;
          }
        }
        for (int i = 0; i < 3; i++) {
          if (onePlayerGameXList.containAll(i, i + 3) &&
              !onePlayerGameOList.contains(i + 6)) {
            onePlayerGameXList.add(i + 6);
            Chart.remove(i + 6);
            return;
          } else if (onePlayerGameXList.containAll(i, i + 6) &&
              !onePlayerGameOList.contains(i + 3)) {
            onePlayerGameXList.add(i + 3);
            Chart.remove(i + 3);
            return;
          } else if (onePlayerGameXList.containAll(i + 3, i + 6) &&
              !onePlayerGameOList.contains(i)) {
            onePlayerGameXList.add(i);
            Chart.remove(i);
            return;
          }
        }

//_______________________Attack_____________________

//_______________________Defense_____________________

        if ((onePlayerGameOList.containAll(0, 4)) &&
            !onePlayerGameXList.contains(8)) {
          onePlayerGameXList.add(8);
          Chart.remove(8);
          return;
        } else if ((onePlayerGameOList.containAll(0, 8)) &&
            !onePlayerGameXList.contains(4)) {
          onePlayerGameXList.add(4);
          Chart.remove(4);
          return;
        } else if ((onePlayerGameOList.containAll(4, 8)) &&
            !onePlayerGameXList.contains(0)) {
          onePlayerGameXList.add(0);
          Chart.remove(0);
          return;
        }
        if ((onePlayerGameOList.containAll(2, 4)) &&
            !onePlayerGameXList.contains(6)) {
          onePlayerGameXList.add(6);
          Chart.remove(6);
          return;
        } else if ((onePlayerGameOList.containAll(4, 6)) &&
            !onePlayerGameXList.contains(2)) {
          onePlayerGameXList.add(2);
          Chart.remove(2);
          return;
        } else if ((onePlayerGameOList.containAll(2, 6)) &&
            !onePlayerGameXList.contains(4)) {
          onePlayerGameXList.add(4);
          Chart.remove(4);
          return;
        }

        for (int i = 0; i <= 6; i += 3) {
          if (onePlayerGameOList.containAll(i, i + 1) &&
              !onePlayerGameXList.contains(i + 2)) {
            onePlayerGameXList.add(i + 2);
            Chart.remove(i + 2);
            return;
          } else if (onePlayerGameOList.containAll(i, i + 2) &&
              !onePlayerGameXList.contains(i + 1)) {
            onePlayerGameXList.add(i + 1);
            Chart.remove(i + 1);
            return;
          } else if (onePlayerGameOList.containAll(i + 1, i + 2) &&
              !onePlayerGameXList.contains(i)) {
            onePlayerGameXList.add(i);
            Chart.remove(i);
            return;
          }
        }
        for (int i = 0; i < 3; i++) {
          if (onePlayerGameOList.containAll(i, i + 3) &&
              !onePlayerGameXList.contains(i + 6)) {
            onePlayerGameXList.add(i + 6);
            Chart.remove(i + 6);
            return;
          } else if (onePlayerGameOList.containAll(i, i + 6) &&
              !onePlayerGameXList.contains(i + 3)) {
            onePlayerGameXList.add(i + 3);
            Chart.remove(i + 3);
            return;
          } else if (onePlayerGameOList.containAll(i + 3, i + 6) &&
              !onePlayerGameXList.contains(i)) {
            onePlayerGameXList.add(i);
            Chart.remove(i);
            return;
          }
        }

//_______________________Defense_____________________

        Chart.shuffle();
        onePlayerGameXList.add(Chart.first);
        Chart.remove(Chart.first);
      }
    }
    notifyListeners();
  }

  void setonePlayerGameData() {
    xPlay = true;
    multiTouche = true;
    onePlayerGameisXChosen = isXChosen;
    onePlayerGameXList = [];
    onePlayerGameOList = [];
    winnerXO = [];
    isXwin = false;
    isOwin = false;
    isDraw = false;
    isStillInGame = true;
    setwinplayerXcount = 0;
    setwinplayerOcount = 0;
    setdrawcount = 0;
    setwinplayerTwocount_1 = 0;
    setwinplayerTwocount_2 = 0;
    setdrawcountTwo = 0;
    Chart = List.generate(9, (index) => index);
    notifyListeners();
  }

  void onePlayerGameRepeat() {
    multiTouche = true;
    xPlay = true;
    onePlayerGameisXChosen = isXChosen;
    onePlayerGameXList = [];
    onePlayerGameOList = [];
    winnerXO = [];
    isXwin = false;
    isOwin = false;
    isDraw = false;
    isStillInGame = true;
    Chart = List.generate(9, (index) => index);
    notifyListeners();
  }

  void onePlayerGameStateLogic() {
    // print('repeat');
    if ((onePlayerGameXList.containAll(0, 4, 8)) ||
        onePlayerGameXList.containAll(2, 4, 6)) {
      (onePlayerGameXList.containAll(0, 4, 8))
          ? winnerXO.addAll([0, 4, 8])
          : winnerXO.addAll([2, 4, 6]);

      isXwin = true;
      isOwin = false;
      isDraw = false;
      isStillInGame = false;
      notifyListeners();

      return;
    } else if ((onePlayerGameOList.containAll(0, 4, 8)) ||
        onePlayerGameOList.containAll(2, 4, 6)) {
      (onePlayerGameOList.containAll(0, 4, 8))
          ? winnerXO.addAll([0, 4, 8])
          : winnerXO.addAll([2, 4, 6]);
      isXwin = false;
      isOwin = true;
      isDraw = false;
      isStillInGame = false;
      notifyListeners();

      return;
    }
    for (int i = 0; i <= 6; i += 3) {
      if (onePlayerGameXList.containAll(i, i + 1, i + 2)) {
        winnerXO.addAll([i, i + 1, i + 2]);
        isXwin = true;
        isOwin = false;
        isDraw = false;
        isStillInGame = false;
        notifyListeners();
        return;
      } else if (onePlayerGameOList.containAll(i, i + 1, i + 2)) {
        winnerXO.addAll([i, i + 1, i + 2]);

        isXwin = false;
        isOwin = true;
        isDraw = false;
        isStillInGame = false;
        notifyListeners();

        return;
      }
    }
    for (int i = 0; i < 3; i++) {
      if (onePlayerGameXList.containAll(i, i + 3, i + 6)) {
        winnerXO.addAll([i, i + 3, i + 6]);
        isXwin = true;
        isOwin = false;
        isDraw = false;
        isStillInGame = false;
        notifyListeners();
        return;
      } else if (onePlayerGameOList.containAll(i, i + 3, i + 6)) {
        winnerXO.addAll([i, i + 3, i + 6]);
        isXwin = false;
        isOwin = true;
        isDraw = false;
        isStillInGame = false;
        notifyListeners();
        return;
      }
    }

    if (onePlayerGameXList.length + onePlayerGameOList.length == 9) {
      isStillInGame = false;
      isDraw = true;
      isXwin = false;
      isOwin = false;
      notifyListeners();

      return;
    }
    notifyListeners();
  }

  String logicOnePlayerGame(BuildContext context, int index) {
    if (onePlayerGameXList.contains(index)) {
      return 'X';
    } else if (onePlayerGameOList.contains(index)) {
      return 'O';
    } else
      return ' ';
  }

  void setPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('name', setname.text == '' ? 'Unknown' : setname.text);
    prefs.setString('level', level);
    prefs.setInt('Avatartid', setAvatartid);
    prefs.setInt('winscore', setwinscore);
    prefs.setInt('drawscore', setdrawscore);
    prefs.setBool('AudioIsPlayed', setAudioIsPlayed);

    notifyListeners();
  }

  void getPrefs() async {
    final prefs = await SharedPreferences.getInstance();

    setname.text = prefs.getString('name') ?? 'Unknown';
    setdrawscore = prefs.getInt('drawscore') ?? 1;
    setwinscore = prefs.getInt('winscore') ?? 1;
    setAvatartid = prefs.getInt('Avatartid') ?? 0;
    setAudioIsPlayed = prefs.getBool('AudioIsPlayed') ?? true;
    level = prefs.getString('level') ?? 'Easy';
    notifyListeners();
  }

  void Dialog_AvatarOnTap(int id) {
    setAvatartid = id;
    notifyListeners();
  }

  void Dialog_AvatarOnTapTwo(int id, int number) {
    number == 1 ? setAvatartidTwo_1 = id : setAvatartidTwo_2 = id;
    notifyListeners();
  }

  void choosenSideWidgetOnTap(String title) {
    isXChosen = title == 'X' ? true : false;
    notifyListeners();
  }

  void stopAudioOnPressed() {
    setAudioIsPlayed = setAudioIsPlayed ? false : true;
    notifyListeners();
  }

  void floatingactionbuttonAdd(String type, {required bool add}) {
    //tapSound(note1: true);
    if (add) {
      if (type == 'Win' && (setwinscore >= 1 && setwinscore < 5))
        setwinscore++;
      else if (type == 'Draw' && (setdrawscore >= 1 && setdrawscore < 5))
        setdrawscore++;
      notifyListeners();
    } else {
      //tapSound(note1: true);

      if (type == 'Win' && (setwinscore > 1 && setwinscore <= 5))
        setwinscore--;
      else if (type == 'Draw' && (setdrawscore > 1 && setdrawscore <= 5))
        setdrawscore--;
      notifyListeners();
    }
  }

  void floatingactionbuttonAddTwo(String type, {required bool add}) {
    //tapSound(note1: true);
    if (add) {
      if (type == 'Win' && (setwinscoreTwo >= 1 && setwinscoreTwo < 5))
        setwinscoreTwo++;
      else if (type == 'Draw' && (setdrawscoreTwo >= 1 && setdrawscoreTwo < 5))
        setdrawscoreTwo++;
      notifyListeners();
    } else {
      //tapSound(note1: true);

      if (type == 'Win' && (setwinscoreTwo > 1 && setwinscoreTwo <= 5))
        setwinscoreTwo--;
      else if (type == 'Draw' && (setdrawscoreTwo > 1 && setdrawscoreTwo <= 5))
        setdrawscoreTwo--;
      notifyListeners();
    }
  }

  void radiobuttonOnChanged(val) {
    level = val ?? 'Error';
    notifyListeners();
  }

  void tapSound({
    bool note1 = false,
    bool note2 = false,
    bool winner = false,
    bool Lose = false,
  }) async {
    final player = AudioPlayer();

    if (note1 == true && setAudioIsPlayed == true)
      await player.play(AssetSource('assets_note2.wav'));
    if (note2 == true && setAudioIsPlayed == true)
      await player.play(AssetSource('assets_note1.wav'));
    if (winner == true && setAudioIsPlayed == true)
      await player.play(AssetSource('assets_winner.wav'));
    if (Lose == true && setAudioIsPlayed == true)
      await player.play(AssetSource('assets_draw.wav'));
    notifyListeners();
  }
}
