pragma solidity >=0.6.0 < 0.9.0;

contract EventAuction {
    address owner;
    uint highestBidAmount;
    address highestBidderAddress;
    mapping (address => uint) bidders;

    constructor () {
        owner= msg.sender;
    }

    event Bid(address indexed bidder, uint amount);
    event AuctionCompleted( address indexed highestBidderAddress, uint amount);

    function bid() external payable {

        require(msg.sender != owner, "Owner can't bid in this Auction.");
        require(msg.value > highestBidAmount, "You can't bid this amount this is very low.");
        bidders[highestBidderAddress] = highestBidAmount;
        highestBidAmount = msg.value;
        highestBidderAddress = msg.sender;
        emit Bid(msg.sender, msg.value);
    }

    function withdraw() external {
        require(msg.sender != owner, "Owner can't withdraw.");
        uint amount = bidders[msg.sender];
        bidders[msg.sender] = 0;
        (bool success,) = payable(msg.sender).call{value:amount}("");
        require(success, "Payment failed!");
    }

    function finishAuction() external{
        require(msg.sender == owner, "Only owner can stop the auction");
        emit AuctionCompleted(highestBidderAddress, highestBidAmount);
        selfdestruct(payable(owner));
    }
}