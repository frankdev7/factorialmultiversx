use multiversx_sc_scenario::*;

fn world() -> ScenarioWorld {
    let mut blockchain = ScenarioWorld::new();
    blockchain.set_current_dir_from_workspace("contracts/examples/factorial");

    blockchain.register_contract("file:output/factorialmultiversx.wasm", factorialmultiversx::ContractBuilder);
    blockchain
}

#[test]
fn factorial_rs() {
    multiversx_sc_scenario::run_rs("scenarios/factorial.scen.json", world());
}
