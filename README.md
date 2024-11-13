SimplifiedVoting Smart Contract
A simplified voting system built on the Ethereum blockchain, allowing users to vote for candidates by sending Ether and enabling the owner to manage candidates and pause/resume voting.

Contract Overview
The SimplifiedVoting smart contract is designed to handle basic voting functionality:

The owner can add candidates.
Users can vote for a candidate by sending Ether.
The owner can pause or resume the contract.
Candidates' funds raised can be withdrawn by the contract owner.
Features
Candidate Management: The owner can add new candidates.
Voting: Users can vote for candidates by sending Ether.
Contract Control: The owner can pause/resume the contract.
Funds Withdrawal: The owner can withdraw funds raised for each candidate.
Installation
To test and deploy this contract, use Remix IDE.

Open Remix: Go to Remix IDE.
Create New File: Add a new file named SimplifiedVoting.sol.
Paste Contract Code: Copy the Solidity code into the new file.
Compile: Use the Solidity compiler version 0.8.x to compile the contract.
Deploy: Deploy the contract using JavaScript VM (or another environment) in the Deploy & Run Transactions tab.
Contract Functions
Owner-Only Functions
addCandidate(string calldata _name): Adds a new candidate. Only the owner can execute this function, and it requires the contract to be unpaused.

togglePause(): Toggles the contract's paused state. Only the owner can call this function. When paused, voting and fund withdrawal are disabled.

withdrawFunds(uint _candidateIndex): Withdraws funds raised for the candidate at the given index. Only the owner can execute this function, and the contract must be unpaused.

Public Functions
vote(uint _candidateIndex): Allows users to vote for a candidate by specifying their index and sending Ether. Requirements:

The caller must not have voted before.
A valid candidate index.
Ether value greater than 0.
getCandidate(uint _candidateIndex): Returns the details (name, vote count, funds raised) of a candidate at the specified index.

Modifiers
onlyOwner: Restricts access to functions only the owner can call.
whenNotPaused: Allows function execution only when the contract is unpaused.
Events
Voted(address indexed voter, uint candidateIndex, uint amount): Emitted when a vote is cast.
CandidateAdded(uint candidateIndex, string candidateName): Emitted when a new candidate is added.
ContractPaused(bool isPaused): Emitted when the contract's paused state is toggled.
FundsWithdrawn(uint candidateIndex, uint amount): Emitted when funds are withdrawn for a candidate.
Usage
Add Candidate: Use addCandidate with a candidate name to add them to the contract.
Vote: Call vote with a candidate index and send Ether to vote for that candidate.
Pause/Resume: Use togglePause to pause or resume voting and fund withdrawal.
Withdraw Funds: Use withdrawFunds to transfer a candidate's funds to the owner's address.
View Candidate Info: Use getCandidate with a candidate's index to view their current vote count and funds raised.
Example Usage in Remix
Deploy the contract in Remix's JavaScript VM.
Add a Candidate: Call addCandidate("Alice").
Vote: Enter an Ether amount in the Value field (e.g., 1 Ether), then call vote with _candidateIndex = 0.
Toggle Pause: Call togglePause to enable or disable voting.
Withdraw Funds: Call withdrawFunds with _candidateIndex = 0 to transfer raised funds.
License
This project is licensed under the MIT License.

