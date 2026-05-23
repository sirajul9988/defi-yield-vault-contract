# DeFi Yield Vault (ERC-4626)

This repository provides an expert-level implementation of the **ERC-4626 Tokenized Vault Standard**. It is designed for developers building yield aggregators, lending markets, or asset management protocols that require a unified interface for depositing and withdrawing assets in exchange for yield-bearing "shares."

## Key Features
- **Standardized Interface:** Fully compliant with EIP-4626 for seamless integration with other DeFi apps.
- **Pure Solidity 0.8.x:** Leverages built-in overflow checks and modern security features.
- **Minimalistic & Secure:** Uses OpenZeppelin's production-ready libraries to handle core ERC-20 logic.
- **Flat Layout:** All necessary contract logic resides in the root for rapid auditing and deployment.

## Deployment Strategy
1. Install dependencies: `npm install @openzeppelin/contracts`
2. Configure the `asset` address (e.g., USDC or DAI) in the constructor.
3. Deploy to an EVM-compatible chain (Ethereum, Base, Optimism).

## Technical Specs
- **Standard:** ERC-4626
- **License:** MIT
- **Security:** OpenZeppelin v5.0
