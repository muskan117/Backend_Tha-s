var Test  = class Test{  //this will reduce the readability of code also difficult to use in other files too.
    print() {
        console.log("I am inside without_require file");
    }
}
var obj = new Test();  //Object is made to use Test class
console.log(obj.print());  //This will print "I am inside without_require file"