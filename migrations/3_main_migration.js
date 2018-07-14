var OrdersHub = artifacts.require("./OrdersHub.sol");

module.exports = function(deployer) {
    deployer.deploy(OrdersHub);
};