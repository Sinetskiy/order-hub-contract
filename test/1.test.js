var AddressBook = artifacts.require("./AddressBook.sol");

contract('AddressBook', accounts => { // truffle

    let contract;

    before(async() => {
        contract = await AddressBook.deployed();
        console.log(contract.address);
    });

    it('Set my name to Address Book', async() => {
        await contract.set('Andrey', {
            value: '100000000000000000', // web3.js
            from: accounts[0],
            //gas:
        });
    });

    it('Incorrect value must throw', async() => {

        let ok = false;
        try {
            await contract.set('Andrey', {
                value: '1000000000000', // web3.js
                from: accounts[1],
                //gas:
            });
        } catch (error) {
            ok = true;
        }

        assert.equal(ok, true);

    });

    it('Check my name', async() => {
        let name = await contract.records(accounts[0]);
        // console.log(name);
        assert.equal(name, 'Andrey');
    });

})