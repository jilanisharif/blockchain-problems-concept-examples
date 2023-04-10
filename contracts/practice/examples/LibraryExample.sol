pragma solidity >= 0.7.0 < 0.9.0;

library Math {

    function findMax(int[] memory numbers) public pure returns(int){
        if(numbers.length == 0) {
            return 0;
        }
        else{
            int max = numbers[0];
            for(uint i = 1; i < numbers.length; i++){
                if(numbers[i] > max){
                    max = numbers[i];
                }
            }
            return max;
        }
    }

    function findMax(uint[] memory numbers) public pure returns(uint){
        if(numbers.length == 0) {
            return 0;
        }
        else{
            uint max = numbers[0];
            for(uint i = 1; i < numbers.length; i++){
                if(numbers[i] > max){
                    max = numbers[i];
                }
            }
            return max;
        }
    }
}

contract Example {
    using Math for int[];
    using Math for uint[];


    function getMax(int[] memory numbers, uint[] memory uNumbers) external pure returns (int, uint){
        return (numbers.findMax(), uNumbers.findMax());
    }
}