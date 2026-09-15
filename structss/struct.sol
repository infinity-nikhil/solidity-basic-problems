//The concept of structs exists in many high level programming languages. 
//They are used to define your own data types which group together related data.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//There is a difference in struct and enum they might sound similar but still
//struct is like object in js you can define it as student car with different data types 
//while enums are like ek hi var ke different options

contract Structs {
    //How to declare a struct 
    struct TodoItems {
        string text;
        bool isCompleted;
    }

    //create an array of todo item stucts 
    TodoItems[] public todos;

    //Now to use this one
    function createTodo(string memory _text) public {
        //the thing is there are multiple ways to initialize structs 

        //this one is to call it like a function 
        todos.push(TodoItems(_text, false));
        //I don't know why this is called as a fxn but 
        //simple understand it like push kar do 

        //and this method is you can pass in the spefic key you want to push
        todos.push(TodoItems({ text: _text, isCompleted: false}));

        //3rd one is a bit unique ..... you make the array and then push it 
        TodoItems memory todo;
        todo.text = _text;
        todo.isCompleted = false;
        todos.push(todo);
        //Got the idea like make a pre build todo temproraryly in memory and then push it
        //sounds like a lot of work but this is the way 
    }

    //if you have to update the function then just pass the index and the new twxt 
    function updateTodo(uint _index, string memory _newText) public {
        todos[_index].text = _newText; // this thing is weird ki index dene ki baad bhi we have todo a:
        // .text to tell what we want to change 
    }
}