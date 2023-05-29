PROJECT="/Users/frank/Documents/blockchain/rust/factorial_multiversx/factorialmultiversx"
WALLET_PEM="/Users/frank/multiversx-sdk/testwallets/latest/users/alice.pem"
DEPLOY_OUTFILE="./logs/local-testnet/local-testnet-deploy-outfile.interaction.json"

deploySC() {
    mxpy --verbose contract deploy --recall-nonce \
    --project ${PROJECT} \
    --pem ${WALLET_PEM} \
    --gas-limit=60000000 \
    --outfile ${DEPLOY_OUTFILE} \
    --send || return
}

# deploySC

CONTRACT_ADDRESS="erd1qqqqqqqqqqqqqpgqfzydqmdw7m2vazsp6u5p95yxz76t2p9rd8ss0zp9ts"
FACTORIAL_OUTFILE="./logs/local-testnet/local-testnet-factorial-outfile.interaction.json"
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