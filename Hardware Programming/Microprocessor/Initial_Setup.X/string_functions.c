#include <string.h>
#include <stdio.h>
#include "string_functions.h"

void clear_data_buffer(char * buffer, int * counter)
{
    int loop;
    
    for(loop = 0; loop <= *counter; loop++)
    {
        buffer[loop] = '\0';
    }
        
    *counter = -1;
}

