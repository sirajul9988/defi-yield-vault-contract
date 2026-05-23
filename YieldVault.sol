// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/extensions/ERC4626.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

/**
 * @title YieldVault
 * @dev A simple ERC-4626 vault that tokenizes deposits of an underlying asset.
 * This implementation is the standard for DeFi yield strategies.
 */
contract YieldVault is ERC4626 {
    
    /**
     * @param asset The underlying token address (e.g., WETH, USDC)
     * @param name The name of the Vault Token (e.g., "Vaulted WETH")
     * @param symbol The symbol of the Vault Token (e.g., "vWETH")
     */
    constructor(
        IERC20 asset,
        string memory name,
        string memory symbol
    ) ERC4626(asset) ERC20(name, symbol) {}

    /**
     * @dev Function to simulate yield generation for testing.
     * In a real scenario, this would be replaced by strategy logic.
     */
    function totalAssets() public view override returns (uint256) {
        // Returns the actual balance of the underlying asset held by this contract.
        return IERC20(asset()).balanceOf(address(this));
    }

    /**
     * @dev Returns decimal count from underlying asset for consistency.
     */
    function decimals() public view override(ERC4626, ERC20) returns (uint8) {
        return super.decimals();
    }
}
