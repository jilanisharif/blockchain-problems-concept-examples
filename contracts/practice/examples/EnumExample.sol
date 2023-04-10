pragma solidity >=0.7 < 0.9;

contract Enums {

    
    enum Environment {
         Sandbox,   //0
         Staging,   //1
         Production //2
     }

     Environment public env;

     function pushToStaging () public {
        env = Environment.Staging;
     }

     function pushToProduction () public {
         env = Environment.Production;
     }

     function isLive () public view returns (bool) {
         return env == Environment.Production;
     }

     function rollbackToSandbox () public {
         delete env;
     }
}