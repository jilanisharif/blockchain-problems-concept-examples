pragma solidity >= 0.6.0 < 0.9.0;

contract Constructors {
    
    address public admin;

    constructor(){
        admin = msg.sender;
    } 

    receive() external payable {}

    function withdraw(uint amount) public  {
        require(msg.sender == admin, "Only admin can withdraw the amount");
        require(address(this).balance >= amount, "Insufficient balance");
        (bool sent, ) = payable(admin).call{value:amount}("");
        require(sent, "Payment failed! unable to send amount");
    }
}