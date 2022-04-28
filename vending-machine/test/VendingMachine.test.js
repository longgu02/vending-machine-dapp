const VendingMachine = artifacts.require("VendingMachine");

contract("VendingMachine", (accounts) => {
    before(async () => {
        instance = await VendingMachine.deployed()
    });

    it('ensures that the starting balance of the vending machine is 100', async () => {
        let balance = await instance.getSnackInventory()
        assert.equal(balance, 100, "The initial balance should be 100");
    })
    it('ensures that the snack balance of the vending machine can be updated', async () => {
        await instance.restock(100);
        let balance = await instance.getSnackInventory();
        assert.equal(balance, 200, "The balacne balance should be 100 after restocking");
    })
})