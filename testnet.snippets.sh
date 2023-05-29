PROJECT="/Users/frank/Documents/blockchain/rust/factorial_multiversx/factorialmultiversx"
WALLET_PEM="/Users/frank/multiversx-sdk/testwallets/latest/users/alice.pem"
DEPLOY_OUTFILE="./logs/testnet/testnet-deploy-outfile.interaction.json"

deploySC() {
    mxpy --verbose contract deploy --recall-nonce \
    --project ${PROJECT} \
    --pem ${WALLET_PEM} \
    --gas-limit=60000000 \
    --outfile ${DEPLOY_OUTFILE} \
    --send || return
}

CONTRACT_ADDRESS="erd1qqqqqqqqqqqqqpgqtcq49llu69ym4ps9m7d5kxwuqlhx5lnnd8ssfa7d2j"
ADDRESS_ARGUMENT="erd14nw9pukqyqu75gj0shm8upsegjft8l0awjefp877phfx74775dsq49swp3"
FACTORIAL_OUTFILE="./logs/testnet/testnet-factorial-outfile.interaction.json"
BIGUINT_ARGUMENT=5

factorialEndpoint() {
    mxpy --verbose contract call ${CONTRACT_ADDRESS} --recall-nonce \
        --pem=${WALLET_PEM} \
        --gas-limit=6000000 \
        --function="factorial" \
        --arguments ${BIGUINT_ARGUMENT} \
        --outfile ${FACTORIAL_OUTFILE} \
        --wait-result --send || return
}

factorialEndpoint