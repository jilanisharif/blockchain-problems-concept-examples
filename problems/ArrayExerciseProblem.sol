pragma solidity >=0.4.22 <=0.8.17;

contract GridMaker {
    function make2DIntGrid(
        uint256 rows,
        uint256 cols,
        int256 value
    ) public pure returns (int256[][] memory) {
        // Write your code here
        int[][] memory array;
        for(uint x = 0; x < rows; x++){
            for(uint y = 0; y < cols; y++){
                array[x][y] = value;
            }
        }
        return array;
    }

    function make2DAddressGrid(uint256 rows, uint256 cols)
        public
        view
        returns (address[][] memory)
    {
        // Write your code here
        address[][] memory array;
        for(uint x = 0; x < rows; x++){
            for(uint y = 0; y < cols; y++){
                array[x][y] = msg.sender;
            }
        }
        return array;
    }
}
