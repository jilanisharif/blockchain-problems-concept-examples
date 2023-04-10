pragma solidity >=0.7.0 <0.9.0;

contract SendOrRecieve {
    uint public received;
    uint public defaultReceived;
    uint public payReceived;

    function withdraw() public {
        address payable sender = payable(msg.sender);
        // bool withdrawn = sender.send(address(this).balance);
        // sender.transfer(address(this).balance);
        (bool sent, bytes memory data) = sender.call{value:address(this).balance}("");
    }
    function pay() external payable {
        payReceived += msg.value;
    }

    receive() external payable {
        received += msg.value;
    }

    fallback() external payable{
        defaultReceived += msg.value;
    }
}