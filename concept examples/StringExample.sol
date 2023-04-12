pragma solidity >=0.7.0 <=0.9.0;

// contract StringGenerator {
//     string public str = "";
//     mapping (address => bool) userWritten;
//     function addCharacter(string memory character) public {
//         // Write your code here
//         require(userWritten[msg.sender]  == false, "You have already added a character");
//         require(bytes(character).length == 1, "You can only add 1 character at a time.");
//         require(bytes(str).length <=5 , "You string limit reached 5 characters");
//         string memory str2 = string.concat(character, "s");
//         userWritten[msg.sender] = true;
//     }

//     function getString() public view returns (string memory) {
//         // Write your code here
//         return str;
//     }
// }

contract Strings {
    string public str = "string";

    function testString(string memory str2) public pure returns (string memory){
        string memory str3 = string.concat(str2, "1");
        return str3; 
    }
}