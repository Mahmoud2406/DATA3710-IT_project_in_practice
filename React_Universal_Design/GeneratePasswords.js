const bcrypt = require('bcrypt');

let pswrd = bcrypt.hashSync('oslomet',9);

console.log(pswrd);