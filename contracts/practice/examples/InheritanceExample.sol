pragma solidity >=0.7.0 < 0.9.0;

// Size of the items

enum Size {
    Small,
    Medium,
    Large
}

// Item base contract 
contract Item {
    uint price;
    constructor(uint _price){
        price = _price;
    }

    function getPrice() public view returns (uint){
        return price;
    }
}

// Trouser Item derived contract
contract Trouser is Item(15) {
    Size size;
    constructor(Size _size) {
        size = _size;
    }

}

// Shirt Item derived contract
contract Shirt is Item(10) {
    Size size;
    constructor(Size _size) {
        size = _size;
    }
}

// Shopping contract to add items

contract Shopping {
    // Type Item contract from base class
    Item[] items;
    
    // Function to add Shirt into items list
    function addShirt(Size _size) public {
        Shirt shirt = new Shirt(_size);
        items.push(shirt);
    }

    // Function to add Trouser into items list
    function addTrouser(Size _size) public {
        Trouser trouser = new Trouser(_size);
        items.push(trouser);
    }

    // Function calculating the total price of items in the items list
    function totalPriceofItems() public view returns(uint){
        uint price;

        for(uint i = 0; i < items.length; i++) {
            price += items[i].getPrice();
        }
        return price;
    }

}
