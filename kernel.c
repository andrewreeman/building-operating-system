
void some_function() {

}


void main() {
    char* video_memory = (char*)0xb8000;

    // Make the first Char an X
    *video_memory = 'X';
    some_function();
}