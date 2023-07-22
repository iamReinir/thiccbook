/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */


function userlogin()
{
    const http = new XMLHttpRequest();
    const url = "./LoginController"
    http.open("post", url);
    let msg = document.getElementById("username").value + "<" +
            document.getElementById("password").value;
//    let msg = JSON.stringify({
//        username:document.getElementById("username").value,
//        password:document.getElementById("password").value        
//    });
    console.log(msg + " sending...");
    http.send(msg);
    let result;
    let notifBoard = document.getElementById("notifBoard");
    http.onreadystatechange = (a) => {
        if (http.readyState === XMLHttpRequest.DONE) {
            const status = http.status;
            if (!(status === 0 || (status >= 200 && status < 400))) {
                console.log("Something wrong with the request!");
                return;
            }
            result = http.responseText;
            if (result === "true")
            {
                window.alert("Login successfully");
                window.location.href = "./index.jsp";
            } else
                window.alert("Login failed, username or password is wrong");
        }
        console.log(result);


    };
}

function checkRepeatPassword()
{
    return document.getElementById("rePassword").value
            === document.getElementById("password").value;
}

function wrongRepeatPasswordWarn()
{
    window.alert("Password do not match!");
}

function checkEmpty()
{
    return !(document.getElementById("username").value == ""  
          && document.getElementById("email").value == ""
          && document.getElementById("password").value == "");
            
}

function userSignUp()
{
    if (!checkRepeatPassword()) {
        wrongRepeatPasswordWarn();
        return;
    }
    if(!checkEmpty())
    {
        window.alert("Please fill in all fields!");
        return;
    }
    const http = new XMLHttpRequest();
    const url = "./SignUpController"
    http.open("post", url);
    let msg = document.getElementById("username").value + "<" +
            document.getElementById("email").value + "<" +
            document.getElementById("password").value;
    console.log(msg + " sending...");
    http.send(msg);
    http.onreadystatechange = (a) => {
        if (http.readyState === XMLHttpRequest.DONE) {
            const status = http.status;
            if (!(status === 0 || (status >= 200 && status < 400))) {
                console.log("Something wrong with the request!");
                return;
            }
            result = http.responseText;
            if (result === "true")
            {
                window.alert("Signup successfully");
                window.location.href = "./login.jsp";
            } else
                window.alert("Username already existed!");
        }
        console.log(result);
    };
}


window.onkeypress = function (event) {
    if (event.key === "Enter") {
        event.preventDefault();
        document.getElementById("loginbtn").click();
    }
};
