var godot = require('../lib/godot'),
    expire = godot.reactor().expire(5000);

//
// This example shows a way to measure two separate clients on the same
// `reactor` using the power of the `by` reactor. It will create a new reactor
// pipe-chain for each different 'service' in this case to easily assess the
// expiration of two separate `producers`.
//
godot.createServer({
  type: 'tcp',
  reactors: [
    godot.reactor()
      .by('service',
        expire
        .console()
      )
  ]
}).listen(1337);
