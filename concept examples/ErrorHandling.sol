pragma solidity >=0.7.0 < 0.9.0;

// errors TransactionErrors(uint balance, uint amount)

contract ErrorHandling {

    mapping(address => uint) userBalances;

    function depositEtherium() external payable {
        userBalances[msg.sender] += msg.value;
    } 

    function withdrawEtherium(uint amount) public {
        uint balance = userBalances[msg.sender];

        // if(balance < amount){
        //     revert TransactionErrors(balance, amount);
        // }
        require(balance > amount, "You have insufficient balance.");
        userBalances[msg.sender] -= amount;
        (bool sent, ) = payable(msg.sender).call{value:amount}("");
        // assert(sent, "Transaction failed!");
    }
}