pragma solidity >= 0.7 < 0.9;

contract Structure {

    // Creating a structure of users and followers

    struct Users{
        string name;
        address addr;
        Users[] followers; 
    }

    mapping (address => Users) user;

    // Function to set a new user.
    function setUser(string memory name) public {
        user[msg.sender].name = name;
        user[msg.sender].addr = msg.sender;
    } 

    // Function to add a new follower.
    function addFollower(address followAddress) public {
        require(user[msg.sender].addr != address(0), "Invalid user address, please provide a valid address to follow.");
        user[msg.sender].followers.push(user[followAddress]);
    }

    // Function to show the followers.
    function showFollowers() public view returns(string[] memory){
        uint numberOfFollowers = user[msg.sender].followers.length;
        string[] memory followers = new string[](numberOfFollowers);

        for(uint i = 0; i < numberOfFollowers; i++){
            followers[i] = user[msg.sender].followers[i].name;
        }

        return followers;
    }
}