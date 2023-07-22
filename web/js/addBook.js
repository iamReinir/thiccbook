/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/javascript.js to edit this template
 */

function validateForm()
{
    let book_name = document.getElementById("book_name");
    let book_author = document.getElementById("book_author");
    if(book_name.value == "" || book_author.value == "")
    {
        alert("You need to fill all fields");
        return false;
    }
    return confirm("Do you want to add/update this book?");
}

