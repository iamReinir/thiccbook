/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function deleteBook(id,name,author,year)
{
    const http = new XMLHttpRequest();
    const url = "./DeleteController";
    http.open("post", url);
    let msg = id + "<" + name + "<" + author + "<" + year;            
    console.log(msg + " sending...");
    http.send(msg);
    let result;    
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
                window.alert("Delete successfully");                
            } else
                window.alert("Delete failed, Something is wrong with the server!");
            window.location.href = "./index.jsp";
        }
        console.log(result);
    };
}


function updateBook(bid,bname,bauthor,byear)
{
    document.getElementById("updatePlaceholder").innerHTML = 
            "<form action='./updateBook.jsp' id='updateForm'>\n\
                <input type='hidden' name='book_id' value='" + bid + "'/>\n\
                <input type='text' name='book_name' value='" + bname +"'/>\n\
                <input type='text' name='book_author' value='"+bauthor + "'/>\n\
                <input type='text' name='book_year' value='"+byear + "'/>\n\
            </form>";
    document.getElementById("updateForm").submit();
    
}
