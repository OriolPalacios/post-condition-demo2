import {StacksDevnet, StacksTestnet} from '@stacks/network';

export const devnet = new StacksDevnet({
    url: "https://api.platform.hiro.so/v1/ext/a47b272570534618bb4247a1880f9554/stacks-blockchain-api"
});

export const testnet = new StacksTestnet();