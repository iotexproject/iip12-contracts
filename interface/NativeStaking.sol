interface NativeStakingContract {
    function candidateRegister(string memory name,
        address operatorAddress,
        address rewardAddress,
        address ownerAddress,
        uint256 amount,
        uint32 duration,
        bool autoStake,
        uint8[] memory data
    ) external;

    function candidateUpdate(string memory name,
        address operatorAddress,
        address rewardAddress
    ) external;

    function changeCandidate(string memory candName,
        uint64 bucketIndex,
        uint8[] memory data
    ) external;

    function createStake(string memory candName,
        uint256 amount,
        uint32 duration,
        bool autoStake,
        uint8[] memory data
    ) external;

    function depositToStake(uint64 bucketIndex,
        uint256 amount,
        uint8[] memory data
    ) external;

    function restake(uint64 bucketIndex,
        uint32 duration,
        bool autoStake,
        uint8[] memory data
    ) external;

    function transferStake(address voterAddress,
        uint64 bucketIndex,
        uint8[] memory data
    ) external;

    function unstake(uint64 bucketIndex, uint8[] memory data) external;

    function withdrawStake(uint64 bucketIndex, uint8[] memory data) external;

    function buckets(uint32 offset, uint32 limit)
        external view returns (IStaking.VoteBucket[] memory);

    function bucketsByCandidate(string memory candName,
        uint32 offset,
        uint32 limit
    ) external view returns (IStaking.VoteBucket[] memory);

    function bucketsByIndexes(uint64[] memory indexes)
        external view returns (IStaking.VoteBucket[] memory);

    function bucketsByVoter(address voter,
        uint32 offset,
        uint32 limit
    ) external view returns (IStaking.VoteBucket[] memory);

    function bucketsCount() external view returns (uint64 total, uint64 active);

    function candidateByAddress(address ownerAddress)
        externalviewreturns (IStaking.Candidate memory);

    function candidateByName(string memory candName)
        externalviewreturns (IStaking.Candidate memory);

    function candidates(uint32 offset, uint32 limit)
        externalviewreturns (IStaking.Candidate[] memory);

    function compositeBuckets(uint32 offset, uint32 limit)
        externalviewreturns (IStaking.CompositeVoteBucket[] memory);

    function compositeBucketsByCandidate(string memory candName,
        uint32 offset,
        uint32 limit
    ) external view returns (IStaking.CompositeVoteBucket[] memory);

    function compositeBucketsByIndexes(uint64[] memory indexes)
        externalviewreturns (IStaking.CompositeVoteBucket[] memory);

    function compositeBucketsByVoter(address voter,
        uint32 offset,
        uint32 limit
    ) external view returns (IStaking.CompositeVoteBucket[] memory);

    function compositeBucketsCount()
        externalviewreturns (uint64 total, uint64 active);

    function compositeTotalStakingAmount() external view returns (uint256);

    function contractStakeBucketTypes(address contractAddress)
        external view returns (IStaking.BucketType[] memory);

    function totalStakingAmount() external view returns (uint256);
}

interface IStaking {
    struct VoteBucket {
        uint64 index;
        address candidateAddress;
        uint256 stakedAmount;
        uint32 stakedDuration;
        int64 createTime;
        int64 stakeStartTime;
        int64 unstakeStartTime;
        bool autoStake;
        address owner;
    }

    struct Candidate {
        address ownerAddress;
        address operatorAddress;
        address rewardAddress;
        string name;
        uint256 totalWeightedVotes;
        uint64 selfStakeBucketIdx;
        uint256 selfStakingTokens;
    }
    
    struct CompositeVoteBucket {
        uint64 index;
        address candidateAddress;
        uint256 stakedAmount;
        uint32 stakedDuration;
        int64 createTime;
        int64 stakeStartTime;
        int64 unstakeStartTime;
        bool autoStake;
        address owner;
        address contractAddress;
        uint64 stakedDurationBlockNumber;
        uint64 createBlockHeight;
        uint64 stakeStartBlockHeight;
        uint64 unstakeStartBlockHeight;
    }
    
    struct BucketType {
        uint256 stakedAmount;
        uint32 stakedDuration;
    }
}
