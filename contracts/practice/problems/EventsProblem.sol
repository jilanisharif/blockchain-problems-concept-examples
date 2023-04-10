pragma solidity >=0.4.22 <=0.8.17;

contract EventEmitter {
    // Write your code here
    uint public value ;

    event Called(address indexed sender, uint value);

    function count() public {
        value += 1;
        emit Called(msg.sender, value);
    }
}
