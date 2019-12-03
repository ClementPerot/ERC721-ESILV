var HDWalletProvider = require("truffle-hdwallet-provider");

var mnemonic = "again quote armor turkey lock cross congress tooth cage head trade walnut";

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic,"https://rinkeby.infura.io/v3/a73a0889e35e49a8864cc3928bb7dd81");
      },
      network_id: 4
    }
  }
};
