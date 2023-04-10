pragma solidity >= 0.7.0 < 0.9.0;

contract modifiers {

    uint modifierCount;
    uint amount;

    modifier transactionValue(uint value){
        require(msg.value >= value, "Less transaction value.");
        _;
    }

    function setAmount(uint value) public payable transactionValue(1 ether){
        amount = value;
        modifierCount++;
    }
}