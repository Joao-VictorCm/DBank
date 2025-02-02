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

   stable var starTime = Time.now();
  //  starTime := Time.now();
   Debug.print(debug_show(starTime));

public func compound(){ //Essa é uma função que calcula juros composto a cada segundo que passa 
  let currentTime = Time.now();
  let timeElapsedNS = currentTime - starTime;
  let timeElapsedS = timeElapsedNS / 1000000000;//transformando nanosegundos em segundos
  currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS)); // o ** é o numero do expoente e isso é uma formula de juros composto, utilizado o Float para poder user cadas decimais ex:  32.25
  starTime := currentTime
};
}