# Solidity Inline Assembly Practice

## Description

This project demonstrates the use of inline assembly in Solidity to optimize smart contract operations for reduced gas costs and improved performance. It includes two contracts: `BitWise` and `String`, showcasing practical applications of assembly code for bitwise operations and string manipulations. The project is implemented as a Hardhat-based environment with testing and deployment scripts.

## Features

- **Bitwise Operations:**
  - `countBitSet` implemented with inline assembly (`countBitSetAsm`) for a 25% reduction in gas costs.
- **String Manipulation:**
  - `charAt` implemented with inline assembly for a 50% reduction in gas costs.
- **Complete Hardhat Setup:**
  - Deployment and testing scripts included.
- **Comprehensive Testing:**
  - Covers edge cases to ensure robustness.

## File Structure

```bash
solidity-bitwise-string/
│
├── contracts/
│   └── inline.sol         # Main smart contract with BitWise and String implementations
│
├── scripts/
│   └── deploy.js          # Deployment script for contracts
│
├── test/
│   └── string.js          # Unit tests for String contract
│
├── hardhat.config.js      # Hardhat configuration
├── package.json           # Project dependencies and scripts
└── README.md              # Project documentation

```

## Smart Contracts

### BitWise Contract

The `BitWise` contract includes two methods to count the number of bits set in an 8-bit unsigned integer:

- **`countBitSet`**: A simple implementation using loops.
- **`countBitSetAsm`**: Optimized using inline assembly for a 25% reduction in gas costs.

#### Example Code

```solidity
function countBitSetAsm(uint8 data) public pure returns (uint8 result) {
    assembly {
        result := 0
        for { let i := 0 } lt(i, 8) { i := add(i, 1) } {
            let bit := and(shr(i, data), 1)
            if eq(bit, 1) {
                result := add(result, 1)
            }
        }
    }
}
```

## Installation

1. Clone the repository:

```bash

git clone https://github.com/your-username/solidity-inline-assembly.git
cd solidity-inline-assembly
```

2. Install dependencies:

```bash
npm install
```

3. Run tests:

```bash
npx hardhat test
```

4. Deployment:

To deploy the contracts:

```bash
npx hardhat run scripts/deploy.js
```

## Test Cases

### BitWise Contract

`countBitSetAsm` correctly counts the number of bits set in a `uint8`.

### String Contract

Test cases for `charAt`:

1. `charAt("abcdef", 2)` should return `0x6300`.
2. `charAt("", 0)` should return `0x0000`.
3. `charAt("george", 10)` should return `0x0000`.

Run the tests:

```bash
npx hardhat test
```

## Optimization Highlights

- `countBitSetAsm`: Reduced gas usage by **25%** compared to the loop-based implementation.
- `charAt`: Achieved **50%** reduction in gas costs by leveraging assembly for direct memory manipulation.
