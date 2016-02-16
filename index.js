var express = require('express');
var app = express();
var Sequelize = require('sequelize');

var redditDb = new Sequelize('redditDb', 'nicjo', '', {
  dialect: 'mysql'
  });
  
var User = redditDb.define('user', {
    email: Sequelize.STRING,
    username: Sequelize.STRING,
    password: Sequelize.STRING // TODO: make the passwords more secure!
});

// Even though the content belongs to users, we will setup the userId relationship later
var Content = redditDb.define('content', {
    url: Sequelize.STRING,
    title: Sequelize.STRING
});

// Even though a vote has a link to user and content, we will setup the relationship later
var Vote = redditDb.define('vote', {
    upVote: Sequelize.BOOLEAN
});

// User <-> Content relationship
Content.belongsTo(User); // This will add a `setUser` function on content objects
User.hasMany(Content); // This will add an `addContent` function on user objects

// User <-> Vote <-> Content relationship
User.belongsToMany(Content, {through: Vote, as: 'Upvotes'}); // This will add an `add`
Content.belongsToMany(User, {through: Vote});

redditDb.sync().then(function() {
  console.log('Success!')
}).catch(function(error) {
  console.log(error)
}); // Only needs to be used once!




// EXERCISE #1
app.get('/hello', function (req, res) {
  res.send('<h1>Hello World!</h1>');
});


// EXERCISE #2
app.get('/hello/:firstName', function (req, res) {
  
  var name = req.params.firstName;
  res.send('<h1>Hello </h1>' + name + '<h3>, nice to meet you!</h3>');
});


// EXERCISE #3
app.get('/op/:operation/:number1/:number2', function (req, res) {
  
  // This is what Ziad wrote in the in-class example
  // var result = calculator(req.params.operation, req.params.number1, req.params.number2)
  // res.json(
  // operation: req.params.operation,
  // firstOperand: req.params.number1,
  // secondOperand: req.params.number2,
  // solution: result
  // )
  
  
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
  
  // here we can use 'Throw' to generate an error and then pas that message into the res.status().send()
  }
}


// EXERCISE #4

// function buildHtmlList(resultayOfContents) {
    
// }

// function retrieveTopFiveContents(callback) {
    
// }

// app.get('/contents', function(request, response) {
//     retrieveTopFiveContents(function(contents) {
//         var html = buildHtmlList(contents);
        
//         response.send(html);
//     });


// <div id="contents">
//   <h1>List of contents</h1>
//   <ul class="contents-list">
//     <li class="content-item">
//       <h2 class="content-item__title">
//         <a href="http://the.post.url.value/">The content title</a>
//       </h2>
//       <p>Created by CONTENT AUTHOR USERNAME</p>
//     </li>
//     ... one <li> per content that your Sequelize query found
//   </ul>
// </div>

function topFive(callback) {
  
  Content.findAll({
    // attributes: ['url', 'title', 'userId', 'username'],
    where: {
      userId: 1
    },
    order: [['createdAt', 'DESC']],
    limit: 5,
    include: User
  }).then(function(result) {
    // console.log(result);
    // res.json(result);
    callback(result);
  });
}


function buildHtml(array) {

    var html = '<div id="contents"><h1>List of contents</h1><ul class="contents-list">'
    array.forEach(function(item) {
    // html += '<li class="content-item">' +
    //           '<h2 class="content-item__title">' +
    //             '<a href="' + item.url + '">' + item.title + '</a>' +
    //           '</h2>' + '<p>Created by ' + item.user.username + '</p>' +
    //         '</li>'
    html += '<li class="content-item"><h2 class="content-item__title"><a href="' + item.url + '">' + item.title + '</a></h2><p>Created by ' + item.user.username + '</p></li>'
            
      });
      
      html += '</ul></div>';
      return html;
}
  


app.get('/contents', function(req, res) {
  
  // topFive(function(result){
  //   res.send(result);
  // });
  
  topFive(function(result){
  var html = buildHtml(result)
    res.send(html);
  });
});



// EXERCISE #5

// app.get('/file/:name', function (req, res, next) {

//   var options = {
//     root: '/public/',
//     dotfiles: 'deny',
//     headers: {
//         'x-timestamp': Date.now(),
//         'x-sent': true
//     }
//   };

//   var fileName = req.params.name;
//   res.sendFile(fileName, options, function (err) {
//     if (err) {
//       console.log(err);
//       res.status(err.status).end();
//     }
//     else {
//       console.log('Sent:', fileName);
//     }
//   });

// });

app.get('/createContent', function(req, res, next) {
var options = {
    root: __dirname
}
var fileName = 'form.html'

res.sendFile(fileName, options, function (err){
  if (err) {
      console.log(err);
      res.status(err.status).end();
    }
    else {
      console.log('Sent:', fileName);
    }
})

});



// EXERCISE #6






/* YOU DON'T HAVE TO CHANGE ANYTHING BELOW THIS LINE :) */

// Boilerplate code to start up the web server
var server = app.listen(process.env.PORT, process.env.IP, function () {
  var host = server.address().address;
  var port = server.address().port;

  console.log('Example app listening at http://%s:%s', host, port);
});
