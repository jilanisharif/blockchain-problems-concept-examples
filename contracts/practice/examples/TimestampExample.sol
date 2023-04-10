pragma solidity >=0.7.0 < 0.9.0;

contract Timestamp {
    uint public currentTimestamp;

    function getTimestamp() external {
        currentTimestamp = block.timestamp;
    }
}