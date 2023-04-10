pragma solidity ^0.8.0;

interface SampleInterface {
    
    function getValue(uint value) external returns(uint);
}

contract Sample{

    SampleInterface newInterface;

    constructor(address _interfaceAddress) {
        newInterface = SampleInterface(_interfaceAddress);
    }

    function getInterface(uint value) public returns(uint){
        return newInterface.getValue(value);
    }
}