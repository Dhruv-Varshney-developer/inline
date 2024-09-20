// SPDX-License-Identifier: MIT

import "solidity-bytes-utils/contracts/BytesLib.sol";

pragma solidity ^0.8.4;

contract BitWise {
    // count the number of bit set in data.  i.e. data = 7, result = 3
    function countBitSet(uint8 data) public pure returns (uint8 result) {
        for (uint256 i = 0; i < 8; i += 1) {
            if (((data >> i) & 1) == 1) {
                result += 1;
            }
        }
    }

    function countBitSetAsm(uint8 data) public pure returns (uint8 result) {
        assembly {
            // Initialize result to 0
            result := 0

            // Loop 8 times (for each bit in uint8)
            for {
                let i := 0
            } lt(i, 8) {
                i := add(i, 1)
            } {
                // Perform (data >> i) & 1
                let bit := and(shr(i, data), 1)

                // Check if the bit is 1
                if eq(bit, 1) {
                    // If it is, increment the result
                    result := add(result, 1)
                }
            }
        }
    }
}

/*
Add following test cases for String contract: 
charAt("abcdef", 2) should return 0x6300
charAt("", 0) should return 0x0000
charAt("george", 10) should return 0x0000
*/

contract String {
    function charAt(string memory input, uint256 index)
        public
        pure
        returns (bytes2)
    {
        bytes memory inputBytes = bytes(input);
        
        assembly {
            // Check if index is out of bounds
            let length := mload(inputBytes) // Get length of the bytes array
            if gt(index, length) {
                // If index is out of bounds, return 0x0000
                mstore(0x0, 0x0000)
                return(0x0, 0x20)
            }
            
            // Calculate the byte offset for the character
            let byteOffset := add(add(inputBytes, 0x20), index)
            let char := mload(byteOffset) // Load the byte at the given index
            
            // Create the bytes2 return value
            mstore(0x0, shl(0x10, char)) // Shift the byte to the upper byte of bytes2
            return(0x0, 0x20) // Return the result
        }
    }
}

contract Stringfortest {
    using BytesLib for bytes;

    function charAt(string memory input, uint index) public pure returns (bytes2) {
        // Convert the string to bytes
        bytes memory inputBytes = bytes(input);
        
        // Check if the index is out of bounds
        if (index >= inputBytes.length) {
            return bytes2(0x0000);
        }
        
        // Get the character at the specified index
        bytes memory charBytes = inputBytes.slice(index, 1);
        
        // Convert the byte to bytes2, padding with a zero byte
        return bytes2(abi.encodePacked(charBytes[0], bytes1(0)));
    }
}