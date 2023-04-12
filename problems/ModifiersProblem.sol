pragma solidity >=0.7.0 < 0.9.0;

// Contract to restict the total count to less than or equal to 100 and greater than or equal to -100
contract RestrictedCount {
    address owner;
    int count;

    constructor() {
        owner = msg.sender;
    }

    // Modifier only used by the owner
    modifier isOwner {
        require(msg.sender == owner, "You are not a owner of this function.");
        _;
    }

    // Modifier to check the count not more than 100
    modifier maxCount(int value){
        require(count+value <= 100 ,  "Count is greater than 100");
        _;
    }

    // Modifier to check the count not less than 100

    modifier minCount(int value){
        require(count-value >= -100 ,  "Count is less than -100");
        _;
    }

    // Function to get the current count
    function getCount() public view returns(int value){
        return count;
    }

    // Function to add value to the current count
    function add(int value) public isOwner maxCount(value){
        count += value;
    }

    //Function to subtract the value from the current count
    function subtract(int value) public isOwner minCount(value){
        count -= value;
    }

}