pragma solidity >=0.7.0 <=0.8.17;

contract AdvancedCounter {

    mapping(address => mapping(string => int)) counters;
    mapping(address => mapping(string => bool)) isCounterExist;
    mapping(address => uint) userCounters;

    function createCounter(string memory id, int256 value) public {
        // Write your code here
        require(!isCounterExist[msg.sender][id], "User already has a same counter.");
        require(userCounters[msg.sender] < 3, "Three counters reached for this user.");
        counters[msg.sender][id] = value;
        isCounterExist[msg.sender][id] = true;
        userCounters[msg.sender]++;
        // require(users[msg.sender][id]);
    }

    function deleteCounter(string memory id) public {
        // Write your code here
        require(isCounterExist[msg.sender][id], "Counter does not exist.");
        isCounterExist[msg.sender][id] = false;
        counters[msg.sender][id] = 0;
        userCounters[msg.sender]--;
    }

    function incrementCounter(string memory id) public {
        // Write your code here
        require(isCounterExist[msg.sender][id], "Counter does not exist.");
        counters[msg.sender][id] += 1;
    }

    function decrementCounter(string memory id) public {
        // Write your code here
        require(isCounterExist[msg.sender][id], "Counter does not exist.");
        counters[msg.sender][id] -= 1;
    }

    function getCount(string memory id) public view returns (int256) {
        // Write your code here
        require(isCounterExist[msg.sender][id], "Counter does not exist.");
        return counters[msg.sender][id];
    }
}
