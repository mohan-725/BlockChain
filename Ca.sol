// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimplifiedVoting {

    address public owner;
    bool public isPaused;

    struct Candidate {
        string name;
        uint voteCount;
        uint fundsRaised;
    }

    Candidate[] public candidates;
    mapping(address => bool) public hasVoted;
    mapping(address => uint) public voterEtherSpent;

    event Voted(address indexed voter, uint candidateIndex, uint amount);
    event CandidateAdded(uint candidateIndex, string candidateName);
    event ContractPaused(bool isPaused);
    event FundsWithdrawn(uint candidateIndex, uint amount);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    modifier whenNotPaused() {
        require(!isPaused, "Contract is paused");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function addCandidate(string calldata _name) external onlyOwner whenNotPaused {
        candidates.push(Candidate(_name, 0, 0));
        emit CandidateAdded(candidates.length - 1, _name);
    }

    function vote(uint _candidateIndex) external payable whenNotPaused {
        require(!hasVoted[msg.sender], "Already voted");
        require(_candidateIndex < candidates.length && msg.value > 0, "Invalid vote");

        Candidate storage candidate = candidates[_candidateIndex];
        candidate.voteCount++;
        candidate.fundsRaised += msg.value;
        hasVoted[msg.sender] = true;
        voterEtherSpent[msg.sender] = msg.value;

        emit Voted(msg.sender, _candidateIndex, msg.value);
    }

    function togglePause() external onlyOwner {
        isPaused = !isPaused;
        emit ContractPaused(isPaused);
    }

    function withdrawFunds(uint _candidateIndex) external onlyOwner whenNotPaused {
        Candidate storage candidate = candidates[_candidateIndex];
        uint amount = candidate.fundsRaised;
        candidate.fundsRaised = 0;
        payable(owner).transfer(amount);
        emit FundsWithdrawn(_candidateIndex, amount);
    }

    function getCandidate(uint _candidateIndex) external view returns (string memory, uint, uint) {
        Candidate storage candidate = candidates[_candidateIndex];
        return (candidate.name, candidate.voteCount, candidate.fundsRaised);
    }
}
