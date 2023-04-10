pragma solidity >=0.6.0 < 0.9.0;

contract arrayStorage {
    uint [] public array = [10, 20];

    function add(uint value) public{
        array.push(value);
    }

    function pop() public{
        array.pop();
    }

    function length() public view returns (uint){
        return array.length;
    }

    function remove(uint index) public{
        delete array[index];
    }
}