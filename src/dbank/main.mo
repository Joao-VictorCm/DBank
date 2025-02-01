// links uteis 
// https://internetcomputer.org/docs/current/motoko/main/reference/style#style
// https://internetcomputer.org/docs/current/motoko/main/reference/style#style

import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300; //stable faz a variavel ficar com o valor meesmo apos recarregar a pagina 
  // currentValue := 100;  //o := altera o valor de 300 para 100
  
  let id = 16;

  Debug.print("hello"); //é o console.log()
 // Debug.print(debug_show(currentValue, id))  //para variaveis 

  public func topUp(amount: Float){
    currentValue += amount;

     Debug.print(debug_show (currentValue));
  };

   //topUp();
   //chamando funções publicas no **terminar** dfx canister call dbank topUp 

   public func downUp(amount: Float){
    let tempvalue: Float =currentValue - amount;
    
    if(tempvalue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue))
  
    }else{
      Debug.print("Saldo insuficiente");
    }
   };

//https://internetcomputer.org/docs/current/developer-docs/smart-contracts/overview/introduction
   public query func checkbalance(): async Float {
    return currentValue
   };

   var time = Time.now();
   Debug.print(debug_show(time));

public func compound(){
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - time;
  let timeElapsedS =timeElapsedNS / 1000000000;//transformando nanosegundos em segundos
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
  time := currentTime
};
}