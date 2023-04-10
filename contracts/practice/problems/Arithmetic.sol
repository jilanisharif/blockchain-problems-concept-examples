pragma solidity >=0.4.22 <=0.8.17;

contract MathUtils {
    function floor(int256 value) public pure returns (int256) {
        // Write your code here
        int x = value / 10;
        return (x * 10); 
    }

    function ceil(int256 value) public pure returns (int256) {
        // Write your code here
        int y;

        if(value == 0){
            return 0;
        }
        else if(value % 10 == 0){
            return(value);
        }
        else if(value < 0){
            y = (value / 10) - 1;
            return(y * 10);
        }
        else {
            y = (value / 10) + 1;
            return (y * 10);
        }
    }

    function average(int256[] memory values, bool down)
        public
        pure
        returns (int256)
    {
        // Write your code here
        int sum = 0;
        if (values.length == 0) {
            return 0;
        }
        for(uint i = 0; i < values.length; i++){
            sum += values[i];
        }
        sum = sum / int(values.length);

        if(sum == 0){
            return 0;
        }
        else if(sum % 10 == 0){
            return(sum);
        }
        else {
            if(down){
                sum = (sum / 10);
                return(sum * 10);
            }
            else {
                if(sum < 0){
                    sum = (sum / 10) - 1;
                    return(sum * 10);
                }
                else {
                    sum = (sum / 10) + 1;
                    return (sum * 10);
                }
            }
        }
        
    }
}
