pragma solidity >=0.4.22 <=0.8.17;

contract Voting {
    // Write your code here
    mapping(uint => uint) votes;
    mapping(address => bool) userVoted; 

    function getVotes(uint number) public view returns(uint){
        require(number < 0 && number > 6, "Invalid number!");
        return votes[number];
    }

    function vote(uint number)

}
