# SimplifiedVoting Smart Contract

A simplified voting system built on the Ethereum blockchain, allowing users to vote for candidates by sending Ether and enabling the contract owner to manage candidates and control voting functionalities such as pausing/resuming the contract.

## Contract Overview

The `SimplifiedVoting` smart contract is designed to handle basic decentralized voting functionality:

- The contract owner can add candidates.
- Users can vote for a candidate by sending Ether.
- The owner can pause or resume voting activities.
- The contract owner can withdraw funds raised for each candidate.

## Features

- **Candidate Management**: The owner can add new candidates to the system.
- **Voting**: Users can vote for candidates by sending Ether to the contract.
- **Contract Control**: The owner can pause and resume voting functions.
- **Funds Withdrawal**: The owner can withdraw funds raised for each candidate.

## Installation

To test and deploy this contract, you can use [Remix IDE](https://remix.ethereum.org/).

### Steps:

1. **Open Remix**: Go to [Remix IDE](https://remix.ethereum.org/).
2. **Create New File**: Add a new file named `SimplifiedVoting.sol`.
3. **Paste Contract Code**: Copy the Solidity code into the new file.
4. **Compile**: Use the Solidity compiler version `0.8.x` to compile the contract.
5. **Deploy**: Deploy the contract using **JavaScript VM** or another environment in the **Deploy & Run Transactions** tab.

## Contract Functions

### Owner-Only Functions

- **addCandidate(string calldata _name)**
  - Adds a new candidate to the voting system. Only the owner can execute this function, and the contract must be unpaused.

- **togglePause()**
  - Toggles the contract's paused state, which disables/enables voting and fund withdrawal. Only the owner can call this function.

- **withdrawFunds(uint _candidateIndex)**
  - Withdraws funds raised for the candidate at the given index. Only the owner can execute this function, and the contract must be unpaused.

### Public Functions

- **vote(uint _candidateIndex)**
  - Allows users to vote for a candidate by specifying their index and sending Ether.
  - **Requirements**:
    - The caller must not have voted before.
    - A valid candidate index must be provided.
    - Ether value greater than 0 must be sent.

- **getCandidate(uint _candidateIndex)**
  - Returns the details (name, vote count, funds raised) of the candidate at the specified index.

## Modifiers

- **onlyOwner**: Restricts access to functions that only the contract owner can call.
- **whenNotPaused**: Allows function execution only when the contract is unpaused.

## Events

- **Voted(address indexed voter, uint candidateIndex, uint amount)**: Emitted when a vote is cast.
- **CandidateAdded(uint candidateIndex, string candidateName)**: Emitted when a new candidate is added.
- **ContractPaused(bool isPaused)**: Emitted when the contract's paused state is toggled.
- **FundsWithdrawn(uint candidateIndex, uint amount)**: Emitted when funds are withdrawn for a candidate.

## Usage

- **Add Candidate**: Use `addCandidate` with a candidate name to add a new candidate.
- **Vote**: Call `vote` with a candidate index and send Ether to vote for that candidate.
- **Pause/Resume**: Use `togglePause` to pause or resume voting and fund withdrawal.
- **Withdraw Funds**: Use `withdrawFunds` to transfer a candidate's funds to the owner's address.
- **View Candidate Info**: Use `getCandidate` with a candidate's index to view their current vote count and funds raised.

## Example Usage in Remix

1. **Deploy the Contract**: Use Remix’s JavaScript VM environment to deploy the contract.
2. **Add a Candidate**: Call `addCandidate("Alice")` to add a candidate named Alice.
3. **Vote**: Specify an Ether amount in the **Value** field (e.g., 1 Ether) and call `vote` with `_candidateIndex = 0`.
4. **Toggle Pause**: Call `togglePause` to enable or disable voting.
5. **Withdraw Funds**: Call `withdrawFunds` with `_candidateIndex = 0` to transfer raised funds.

## License

This project is licensed under the MIT License.
