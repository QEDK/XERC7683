// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.30;


import {IXERC7683} from "./IXERC7683.sol";

/// @title IXOriginSettler
/// @notice An extended interface for settlement contracts on the origin chain based on ERC-7683
/// @dev Functions are overloaded to support the eXtended interface
interface IXOriginSettler is IXERC7683 {
    /// @notice Opens a gasless cross-chain order on behalf of a user.
    /// @dev To be called by the filler.
    /// @dev This method must emit the Open event
    /// @param order The GaslessCrossChainOrder definition
    /// @param signature The user's signature over the order
    /// @param originFillerData Any filler-defined data required by the settler
    function openFor(XGaslessCrossChainOrder calldata order, bytes calldata signature, bytes calldata originFillerData)
        external;

    /// @notice Resolves a specific GaslessCrossChainOrder into a generic ResolvedCrossChainOrder
    /// @dev Intended to improve standardized integration of various order types and settlement contracts
    /// @param order The GaslessCrossChainOrder definition
    /// @param originFillerData Any filler-defined data required by the settler
    /// @return ResolvedCrossChainOrder hydrated order data including the inputs and outputs of the order
    function resolveFor(XGaslessCrossChainOrder calldata order, bytes calldata originFillerData)
        external
        view
        returns (XResolvedCrossChainOrder memory);

    /// @notice Resolves a specific OnchainCrossChainOrder into a generic ResolvedCrossChainOrder
    /// @dev Intended to improve standardized integration of various order types and settlement contracts. The function identifier differs from the base interface to avoid overload collisions since the parameter types are identical
    /// @param order The OnchainCrossChainOrder definition
    /// @return XResolvedCrossChainOrder hydrated order data including the inputs and outputs of the order
    function xresolve(XOnchainCrossChainOrder calldata order) external view returns (XResolvedCrossChainOrder memory);
}
