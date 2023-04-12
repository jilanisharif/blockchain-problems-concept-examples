pragma solidity >= 0.7.0 < 0.9.0;

contract SelfDestruct {

    address owner;

    constructor() {
        owner = msg.sender;
    }

    receive () external payable {}

    function destruct() external{
        require(owner == msg.sender, "Access restricted.");
        selfdestruct(payable(owner));

    }

    function checkOwner() public view returns (address) {
        return msg.sender;
    }
}