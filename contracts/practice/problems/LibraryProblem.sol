/*Array Library
Write a library named Array that provides some helpful array functions as defined below.

indexOf(int[] numbers, int target): a function that returns an int representing the index of
the first occurrence of the passed target in the numbers array. This function should return -1 
if the target does not exist in the numbers array.
count(int[] numbers, int target): a function that returns the count/frequency of the passed target 
in the numbers array. This function should return the count as a uint.
sum(int[] numbers): a function that returns the sum of the values in the numbers array. 
If the array is empty this function should return 0.
All of the above functions should be marked as public.
*/

pragma solidity >= 0.7.0 < 0.9.0;

// Array library with some functions below

library Array {
    
    // Function to find the first occurent of the element and returning the index
    function indexOf(int[] memory numbers, int target) public pure returns (int){
        int found = -1;
        for(uint i; i < numbers.length; i++){
            if(numbers[i] == target){
                found = int(i);
                break;
            }
        }
        return found;
    }

    // Function to count the number of occurence of the element
    function count (int[] memory numbers, int target) public pure returns (uint){
        uint counter;
        for(uint i; i < numbers.length; i++){
            if(numbers[i] == target){
                counter++;
            }
        }
        return counter;
    }

    // Function to return the sum of values of the array
    function sum(int[] memory numbers) public pure returns (int) {
        int totalSum;

        for(uint i; i < numbers.length; i++){
            totalSum += numbers[i];
        }
        return totalSum;
    }
}