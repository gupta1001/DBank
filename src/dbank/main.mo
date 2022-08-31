import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  stable var currentValue: Float = 300;
  //currentValue := 100;
  stable var startTime = Time.now();

  let id = 137604701;

  Debug.print(debug_show(id));

  public func topUp(amount: Float){
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };
  
  public func withdrawl(amount: Float){
    let amountRemain: Float= currentValue - amount;
    if(amountRemain >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("You do not have sufficient funds!");
    }
  };

  public query func checkBalance(): async Float{
    Debug.print(debug_show(currentValue));
    return currentValue;
  };

  public func compound(){
    let currentTime = Time.now();
    let lapsedSeconds = (currentTime - startTime) / 1000000000;
    currentValue := currentValue * (1.01**Float.fromInt(lapsedSeconds));
    startTime := currentTime;
    Debug.print(debug_show(currentValue));
  }
  //topUp();
  //Debug.print(debug_show(currentValue));
}
 