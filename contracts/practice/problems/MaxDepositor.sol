pragma solidity >=0.4.22 <=0.8.17;

contract Competitors {
    // Write your code here
    address user1;
    address user2;
    address public owner;
    address winner;

    uint amount;
    uint user1amount;
    uint user2amount;

    bool amountWithdrawn;
    constructor() {
        owner = msg.sender;
    }

    function deposit() external payable {
        require(msg.value == 1 ether, "You can send only 1 Ether at a moment");
        require(amount < 3 ether, "Sorry! this contract has limit reached you cant send the amount");
        amount += 1;

        if(user1 == address(0)){
            user1 = msg.sender;
            user1amount++;
        }
        else if(user2 == address(0)){
            user2 = msg.sender;
            user2amount++;
        }
        else if(user1 == msg.sender){
            user1amount++;
        }
        else if(user2 == msg.sender){
            user2amount++;
        }
        else {   
            revert("First two users are deposited.");
        }


    }

    function withdraw() public payable {
        require(amount == 3 ether, "You can't withdraw the amount");
        if(user1amount > user2amount){
            winner = user1;
        }
        else {
            winner = user2;
        }
        
        (bool sent, ) = payable(winner).call{value:3 ether}("");
        amountWithdrawn = true;
        require(sent, "Payment failed");
    }

    function destory() public {
        if(amountWithdrawn && owner == msg.sender){
            selfdestruct(payable(owner));
        }
        else {
            revert("You can't destroy this.");
        }
    }
}
