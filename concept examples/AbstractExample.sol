pragma solidity >= 0.7.0 < 0.9.0;

// Abstract contract can't be instantiate, it's constructor is always internal and can be used in the derived class.
// Abstract contracts oftenly used as base contracts
abstract contract AbstractExample {

    uint x; 
    constructor(uint _x) {
        x = _x;
    }

    function showOne() public pure returns(uint) {
        return 1;
    }

    function newValue() public virtual view returns(uint);

    function addValue() public view returns(uint){
        return newValue() + 5;
    }

}


contract NewContract is AbstractExample(10){

    function setX(uint _x) public {
        x = _x;
    }
    function newValue() public override view returns(uint){
        return x;
    }
}