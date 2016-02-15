var express = require('express');
var app = express();




// EXERCISE #1
app.get('/hello', function (req, res) {
  res.send('<h1>Hello World!</h1>');
});


// EXERCISE #2
app.get('/hello/:firstName', function (req, res) {
  
  var name = req.params.firstName;
  res.send('<h1>Hello ' + name + '!</h1>');
});


// EXERCISE #3
app.get('/op/:operation/:number1/:number2', function (req, res) {
  
  var operator = req.params.operation;
  var firstOperand = req.params.number1;
  var secondOperand = req.params.number2;
  var solution = calculator(operator, firstOperand, secondOperand);
  
  if (operator === "add" || operator === "sub" || operator === "mult" || operator === "div") {
    res.send({
      operator: operator,
      firstOperand: firstOperand,
      secondOperand: secondOperand,
      solution: solution
    });
  } else {
    res.status(400).send("<h2>I'm sorry Dave, I'm afraid I can't do that.</h2>");
  }
});

var calculator = function(str, num1, num2) {
  
  if (str === "add") {
    return parseInt(num1) + parseInt(num2);
  } else if (str === "sub") {
    return num1 - num2;
  } else if (str === "mult") {
    return num1 * num2;
  } else if (str === "div") {
    return num1/num2;
  // } else {
  //   return "Not a valid operation";
  }
}


// EXERCISE #4





/* YOU DON'T HAVE TO CHANGE ANYTHING BELOW THIS LINE :) */

// Boilerplate code to start up the web server
var server = app.listen(process.env.PORT, process.env.IP, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
