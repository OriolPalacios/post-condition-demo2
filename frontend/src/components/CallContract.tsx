"use client";

import { useEffect, useState } from "react";
import { useConnect } from "@stacks/connect-react";
import { devnet } from "./NetworkConnect";
import { Pc, PostConditionMode, uintCV } from "@stacks/transactions";
import { userSession } from "./ConnectWallet";

const CallContract = () => {
    const [mounted, setMounted] = useState(false);
    useEffect(() => setMounted(true), []);
    if (!mounted || !userSession.isUserSignedIn()) {
        return null;
    }
    const { doContractCall } = useConnect();

    // PRINCIPAL -> [Amount] -> Code -> asset
    const postcondition_1 = Pc
        .principal(userSession.loadUserData().profile.stxAddress.testnet)
        .willSendEq(1000000)
        .ustx();

    const postcondition_2 = Pc
        .principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.purcharse-token")
        .willSendEq(777)
        .ft("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.safe-token", "safe-token");

    const postcondition_3 = Pc
        .principal("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.purcharse-token")
        .willSendAsset()
        .nft("ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM.safe-token", "NFT 1", uintCV(1));

    const purcharse = () => {
        doContractCall({
            network: devnet,
            contractAddress: "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM",
            contractName: "purcharse-token",
            functionName: "purcharse-token",
            functionArgs: [],
            postConditions: [postcondition_1, postcondition_2],
            postConditionMode: PostConditionMode.Allow,
        });
    };

    const purcharse_nft = () => {
        doContractCall({
            network: devnet,
            contractAddress: "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM",
            contractName: "purcharse-token",
            functionName: "purcharse-token",
            functionArgs: [],
            postConditions: [postcondition_1, postcondition_3],
            postConditionMode: PostConditionMode.Allow,
        });
    };

    // openContractCall({
    //     contractAddress: "ST1PQHQKV0RJXZFY1DGX8MNSNYVE3VGZJSRTPGZGM",
    //     contractName: "purcharse-token",
    //     functionName: "purcharse-token",
    //     functionArgs: [],
    //     network: devnet,
    // });



    return (
        <>
            <div style={{ marginTop: "30px" }}>
                <p>
                    Purchare 777 safe tokens for 1 STX
                </p>
                <div>
                    <button onClick={purcharse}>Call Contract to test post condition on ft</button>
                </div>
                <div>
                    <button onClick={purcharse_nft}>Call Contract to test post condition on nft</button>
                </div>

            </div>
        </>
    )

};

export default CallContract;