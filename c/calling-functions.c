void caller_function() {
    callee_function(0xbaba);
}

int callee_function(int my_var) {
    return my_var;
}