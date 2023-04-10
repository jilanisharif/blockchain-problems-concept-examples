pragma solidity >=0.7.0 < 0.9.0;

    // Shopping lists contract

contract ShoppingList {

    // Users and their shopping lists
    mapping(address => User) users;

    // User and their shopping lists struct
    struct User {
        mapping(string => ShoppingLists) shoppingLists;
        string[] shoppingListNames;
    }

    // Shopping Lists struct with items
    struct ShoppingLists {
        string name;
        ShoppingListItems[] items;
    }

    // Shopping List Items Struct
    struct ShoppingListItems  {
        string name;
        uint quantity;
    }

    // Function to create a shopping list with name and check if it already exists
    function createList(string memory name) public {
        require (bytes(users[msg.sender].shoppingLists[name].name).length == 0, "Shopping list exists on this name.");
        require(bytes(name).length > 0, "Shopping list name cannot be empty.");
        users[msg.sender].shoppingListNames.push(name);
        users[msg.sender].shoppingLists[name].name = name;

    }

    // Function to return the list of shopping list names of a user
    function getListNames() public view returns (string[] memory) {
        return users[msg.sender].shoppingListNames;
    }

    //Function to return the list of items under a shopping list
    function getItemNames(string memory listName)
        public
        view
        returns (string[] memory)
    {
        uint len = users[msg.sender].shoppingLists[listName].items.length;
        string[] memory names = new string[](len);

        for(uint i = 0; i < len; i++){
            names[i] = (users[msg.sender].shoppingLists[listName].items[i].name);
        }
        return names;

    }

    // Function to add a item to a specific shopping list
    function addItem(
        string memory listName,
        string memory itemName,
        uint256 quantity
    ) public {
        require (bytes(users[msg.sender].shoppingLists[listName].name).length != 0, "Shopping list doesn't exists.");
        users[msg.sender].shoppingLists[listName].items.push(ShoppingListItems(itemName,quantity));
    }
}
