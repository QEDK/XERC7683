// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.30;

/// @title IXDestinationSettler
/// @notice Standard interface for settlement contracts on the destination chain
/// @dev Since this is functionally similar to the ERC-7683 standard, developers should defer to the base implementation, the extended version is provided for developers only using the extended standard
interface IXDestinationSettler {
    /// @notice Fills a single leg of a particular order on the destination chain
    /// @param orderId Unique order identifier for this order
    /// @param originData Data emitted on the origin to parameterize the fill
    /// @param fillerData Data provided by the filler to inform the fill or express their preferences
    function fill(bytes32 orderId, bytes calldata originData, bytes calldata fillerData) external;
}
