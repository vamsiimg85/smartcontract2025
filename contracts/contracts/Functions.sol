// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title A Simple Bank Contract
/// @author You
/// @notice This contract allows deposits, withdrawals, and administrative controls
contract Bank {
    // State Variables
    address public owner;  // Address of the contract owner
    mapping(address => uint256) private balances;  // Mapping to track user balances
    bool public paused;  // Pause flag for emergency stop

    // Events - for logging actions
    event Deposited(address indexed user, uint256 amount);
    event Withdrawn(address indexed user, uint256 amount);
    event Paused(address indexed owner);
    event Unpaused(address indexed owner);

    // Custom Errors (more gas efficient than require(...))
    error InsufficientBalance(uint256 requested, uint256 available);
    error ContractPaused();
    error NotOwner();

    // Modifier to restrict access to the owner
    modifier onlyOwner() {
        if (msg.sender != owner) revert NotOwner();
        _;
    }

    // Modifier to prevent function execution when paused
    modifier whenNotPaused() {
        if (paused) revert ContractPaused();
        _;
    }

    // Constructor - executed once at deployment
    constructor() {
        owner = msg.sender;  // Set the deployer as the owner
        paused = false;      // Start in unpaused state
    }

    /// @notice Deposit Ether into the bank
    /// @dev Requires the contract not to be paused and msg.value > 0
    function deposit() public payable whenNotPaused {
        if (msg.value == 0) {
            revert("Deposit amount must be greater than zero");
        }
        balances[msg.sender] += msg.value;  // Update user balance
        emit Deposited(msg.sender, msg.value);  // Log event
    }

    /// @notice Withdraw Ether from your balance
    /// @param amount The amount of Ether to withdraw
    function withdraw(uint256 amount) public whenNotPaused {
        if (amount > balances[msg.sender]) {
            revert InsufficientBalance(amount, balances[msg.sender]);
        }
        balances[msg.sender] -= amount;  // Subtract first to prevent reentrancy
        payable(msg.sender).transfer(amount);  // Transfer Ether to user
        emit Withdrawn(msg.sender, amount);  // Log event
    }

    /// @notice View your current balance
    /// @return Your Ether balance in the bank
    function getBalance() public view returns (uint256) {
        return balances[msg.sender];
    }

    /// @notice Pause all deposit/withdraw operations
    function pause() public onlyOwner {
        paused = true;
        emit Paused(msg.sender);
    }

    /// @notice Resume operations after a pause
    function unpause() public onlyOwner {
        paused = false;
        emit Unpaused(msg.sender);
    }

    /// @notice View total Ether in the contract (admin only)
    /// @return The total balance in contract
    function getContractBalance() public view onlyOwner returns (uint256) {
        return address(this).balance;
    }

    /// @notice Transfer contract ownership to a new address
    /// @param newOwner The new owner's address
    function transferOwnership(address newOwner) public onlyOwner {
        require(newOwner != address(0), "New owner is the zero address");
        owner = newOwner;
    }

    /// @notice Withdraw all Ether in contract to owner (emergency use only)
    function emergencyWithdraw() public onlyOwner {
        payable(owner).transfer(address(this).balance);
    }

    /// @notice Allow ETH deposits directly to contract
    receive() external payable {
        deposit();  // Redirect to deposit logic
    }

    /// @notice Fallback in case of unknown function call
    fallback() external payable {
        deposit();  // Redirect to deposit logic
    }
}
