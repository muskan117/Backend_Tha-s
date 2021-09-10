var Test = require("./require_file");  //class (To use a class, we have to create it's object first .i.e obj)
var obj = new Test();  //Object is made to use Test class (new keyword is used)
console.log(obj.print());  //this will print "I am inside require_file"