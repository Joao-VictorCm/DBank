// links uteis 
// https://internetcomputer.org/docs/current/motoko/main/reference/style#style
// https://internetcomputer.org/docs/current/motoko/main/reference/style#style

import Debug "mo:base/Debug";
import Nat "mo:base/Nat";

actor DBank {
  var currentValue = 300;
  currentValue := 100;  //o := altera o valor de 300 para 100
  
  let id = 16;

  // Debug.print("hello") //é o console.log()
 // Debug.print(debug_show(currentValue, id))  //para variaveis 

  public func topUp(amount: Nat){
    currentValue += amount;

     Debug.print(debug_show (currentValue));
  };

   //topUp();
   //chamando funções publicas no **terminar** dfx canister call dbank topUp 

   public func downUp(amount: Nat){
    currentValue -= amount;

    Debug.print(debug_show(currentValue))
   }
 
}