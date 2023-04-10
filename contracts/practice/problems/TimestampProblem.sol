pragma solidity >=0.4.22 <=0.8.17;

contract TimedAuction {
    // Declare your event(s) here
    address owner;
    uint bidStartingTimestamp;

    uint highestBidAmount;
    address currentHigestBidder;

    uint amountLeftToWithdraw;
    mapping (address => uint) bidders;

    event Bid(address indexed bidderAddress, uint biddingAmount, uint timestamp);

    constructor() {
        owner = msg.sender;
        bidStartingTimestamp = block.timestamp;

    }

    function bid() external payable {
        // Write your code here
        require(block.timestamp - bidStartingTimestamp < 5 minutes, "You can't bid auction is completed.");
        require(msg.value > highestBidAmount, "Your bidding amount is low.");
        bidders[currentHigestBidder] += highestBidAmount;
        amountLeftToWithdraw += highestBidAmount;
        
        currentHigestBidder = msg.sender;
        highestBidAmount = msg.value;
        emit Bid(msg.sender, msg.value, block.timestamp);

        
    }

    function withdraw() public {
        // Write your code here
        uint amount = bidders[msg.sender];
        bidders[msg.sender] = 0;
        amountLeftToWithdraw -= amount;
        (bool success,) = payable(msg.sender).call{value:amount}("");
        require(success, "Payment Failed");
    }

    function claim() public {
        // Write your code here
        require(owner == msg.sender, "You cannot claim this bid");
        require(block.timestamp - bidStartingTimestamp >= 5 minutes, "Bidding is not yet completed.");
        require(amountLeftToWithdraw == 0, "Still bidders have some money in the contract.");
        selfdestruct(payable(owner));
    }

    function getHighestBidder() public view returns (address) {
        // Write your code here
        return currentHigestBidder;
    }
}
