pragma solidity >= 0.7.0 < 0.9.0;

contract FancyShirts {

    enum Size{
        Small,
        Medium,
        Large
    }

    enum Color{
        Red,
        Green,
        Blue
    }

    Size public sizes;
    Color public colors;

    struct Shirt{
        Size size;
        Color color;
    }

    mapping(address => Shirt[]) shirts;

    modifier checkPrice(Size size, Color color) {
        uint cost = getShirtPrice(size, color);

        require(msg.value == cost, "Please pay the exact amount to make this purchase.");
        _;
    }

    function getShirtPrice(Size size, Color color) public view returns(uint){
        uint cost;
        if(size == Size.Small){
            cost = 10 wei;
        }
        else if(size == Size.Medium){
            cost = 15 wei;
        }
        else if(size == Size.Large){
            cost = 20 wei;
        }

        if(color == Color.Green || color == Color.Blue){
            cost += 5 wei;
        }
        return cost;
    }

    function buyShirt(Size size, Color color) external payable checkPrice(size, color) {
        shirts[msg.sender].push(Shirt(size, color));
    }

    function getShirts(Size size, Color color) public view returns (uint){
        uint count;
        for (uint i = 0; i < shirts[msg.sender].length; i++){
            if(shirts[msg.sender][i].size == size && shirts[msg.sender][i].color == color){
                count++;
            }
        }
        return count;
    }
}