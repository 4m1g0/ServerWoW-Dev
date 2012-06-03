/* gcc -o limpiador $(mysql_config --cflags) main.cpp $(mysql_config --libs) */
#include <my_global.h>
#include <mysql.h>
#include <stdio.h>
//#include "dataTypes.h"


int main() {
    MYSQL* conn;
    MYSQL_RES* res;
    MYSQL_ROW row;
    const char* server = "localhost";
    const char* user = "trinity";
    const char* password = "trinity";
    const char* database_auth = "trinity_auth";
    const char* database_char = "trinity_characters";
    unsigned int i, j;
    char* Account[10000][18];
    
    
    conn = mysql_init(NULL);
    // Connect to database
    if (!mysql_real_connect(conn, server, user, password, database_auth, 0, NULL, 0)) {
        fprintf(stderr, "%s\n", mysql_error(conn));
        return 1;
    }
    
    if (mysql_query(conn, "SELECT * FROM account")) {fprintf(stderr, "%s\n", mysql_error(conn));return 1;}
    res = mysql_use_result(conn);
    i = 0;
    while ((row = mysql_fetch_row(res)) != NULL)
    {
        for(j = 0; j < 18; j++)
        {
            printf("%s, ", row[j]);
            Account[i][j] = row[j];
        }
        printf("\n");
        ++i;
    }
    mysql_free_result(res);
    
    // close connection
    mysql_close(conn);
    
    printf("\n\nImprimimos! \n");
    for (i = 0; i < 2; i++)
    {
        for (j = 0; j < 18; j++)
            printf("%s, ", Account[i][j]);
        printf("\n");   
    }
    
    return 0;
}


/*
##############################
OUTPUT
##############################
1, 4m1g0, cd2357058d11cfcb6ae9cce498923f2e055fd638, , , , , 2012-04-29 07:27:02, 127.0.0.1, 0, 0, 0000-00-00 00:00:00, 0, 2, 0, 0, , 0, 


Imprimimos! 
, , cd2357058d11cfcb6ae9cce498923f2e055fd638, , , , , 2012-04-29 07:27:02, 127.0.0.1, 0, 0, 0000-00-00 00:00:00, 0, 2, 0, 0, , 0,
*/
