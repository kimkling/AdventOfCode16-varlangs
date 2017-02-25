#include<stdio.h>
#include<stdlib.h>
#include<string.h>


// Inspired (alot) by the StackOverflow question at
// http://stackoverflow.com/questions/3463426/in-c-how-should-i-read-a-text-file-and-print-all-strings
char* ReadFile(char* filename){
    char* buffer = NULL;
    int stringSize, readSize;

    FILE* fp = fopen(filename, "r");

    if(fp){
        fseek(fp, 0, SEEK_END);
        stringSize = ftell(fp);
        rewind(fp);

        buffer = (char*) malloc(sizeof(char) * (stringSize+1));
        readSize = fread(buffer, sizeof(char), stringSize, fp);
        buffer[stringSize] = '\0';
        if(stringSize != readSize){
            free(buffer);
            buffer = NULL;
        }
        fclose(fp);
    }
    return buffer;
}

int main() {
    int a = 0, b = 0, c = 0, d = 0;
    char* token;
    char* instruction;
    char* commands = ReadFile("input.txt");
    char* string = commands;
    char* endString;

    token = strtok_r(string, "\n", &endString);
    while(token){
        char* op = "";
        char* reg = "";

        char* endToken;
        int i = 0;
        char* token2 = strtok_r(token, " ", &endToken);
        while(token2){
            if(i == 0){
                op = token2;
            } else if () {
                
            }
            
            i++;
            token2 = strtok_r(NULL, " ", &endToken);
        }

        if(strcmp(op, "inc")){
            a++;
        }
        printf("OP: %s\n", op);

        token = strtok_r(NULL, "\n", &endString);
    }
    printf("%i\n", a);
}
