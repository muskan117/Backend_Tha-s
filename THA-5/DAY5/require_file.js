class Test {  //Class Test which will be used by another file
    print() {  //object
        console.log("I am inside require_file");  //this data/code will be used in require.js file
    }
}

class Test2 { // another class made for internal working
    print() {  // object
        console.log("I am a private class which will not be used by require untill i am exported"); //Made for internal working
    }
}

module.exports = Test;  //Exporting only Test class and it's code will be used in require.js     
