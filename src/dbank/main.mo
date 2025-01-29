// links uteis 
// https://internetcomputer.org/docs/current/motoko/main/reference/style#style
// https://internetcomputer.org/docs/current/motoko/main/reference/style#style

import Debug "mo:base/Debug";

actor DBank {
  var currentValue = 300;
  currentValue := 100;  //o := altera o valor de 300 para 100
  
  let id = 16;

  // Debug.print("hello") //é o console.log()
  // Debug.print(debug_show(currentValue, id))  //pata variaveis 

  func topUp(){
    currentValue += 1 ;

    Debug.print(debug_show (currentValue));
  };

  topUp();
 
}