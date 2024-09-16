// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

contract practise{
function lo(uint max) public pure returns(uint result) {
    assembly {
        for { let i := 0 } 
        lt(i, 20)
        { i := add(i, 1) } {
        if lt(i,3) { continue }
        if gt(i, max) { break }
        result := add(result,1)
        }
    }
}}