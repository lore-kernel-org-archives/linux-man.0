From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1 v2] unix.7: add example
Date: Fri, 8 Jan 2016 20:53:16 +0100
Message-ID: <569013AC.6030203@gmail.com>
References: <1452121052-17103-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1452121052-17103-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/06/2016 11:57 PM, Heinrich Schuchardt wrote:
> A complete example demonstrating the usage of sockets for local interprocess
> communication is added.
> 
> v2:
> 	Add missing [] for argv.
> 	Use meaningful variable names.
> 	Use AF_UNIX instead of PF_LOCAL.
> 	memset name structure to 0.
> 	Use read, write instead of recv, send.
> 	Thx to Michael for reviewing.

Thanks, Heinrich. Applied. (I made a few tweaks afterwards. Nothing
major, but let me know if I messed anything up.

Cheers,

Michael

> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/unix.7 | 280 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 276 insertions(+), 4 deletions(-)
> 
> diff --git a/man7/unix.7 b/man7/unix.7
> index e6e311f..5a4ad63 100644
> --- a/man7/unix.7
> +++ b/man7/unix.7
> @@ -1,5 +1,6 @@
> -.\" This man page is Copyright (C) 1999 Andi Kleen <ak-h9bWGtP8wOw@public.gmane.org>.
> -.\" and Copyright (C) 2008-2014, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> +.\" This man page is Copyright (C) 1999 Andi Kleen <ak-h9bWGtP8wOw@public.gmane.org>,
> +.\" Copyright (C) 2008-2014, Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>,
> +.\" and Copyright (C) 2016, Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
>  .\"
>  .\" %%%LICENSE_START(VERBATIM_ONE_PARA)
>  .\" and Copyright (C) 2008, 2012 Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> @@ -618,9 +619,280 @@ that the applications that
>  pathname sockets follow the rules outlined above under
>  .IR "Pathname sockets" .
>  .SH EXAMPLE
> -See
> -.BR bind (2).
> +The following code demonstrates the usage of sockets for local interprocess
> +communication.
> +It comprises two programs.
> +The server program waits for a connection from the client program.
> +The client sends all of its command line arguments.
> +The server treats them as integers and adds them up.
> +The client sends the command string END.
> +The server returns the result.
> +The client prints the sum of the received integers and exits.
> +The server waits for the next client to connect.
> +To stop the server the client is called with the command line argument
> +DOWN.
> +.PP
> +The following output was recorded while running the server in the background
> +and repeatedly calling the client.
> +Execution of the server program ended when receiving the DOWN command.
> +.SS Example output
> +.in +4n
> +.nf
> +$ ./server &
> +[1] 25887
> +$ ./client 3 4
> +Result = 7
> +$ ./client 11 \-5
> +Result = 6
> +$ ./client DOWN
> +Result = 0
> +[1]+  Done                    ./server
> +$
> +.fi
> +.in
> +.SS Program source
> +.nf
> +/*
> + * File connection.h
> + */
> +
> +#define SOCKET_NAME "/tmp/9Lq7BNBnBycd6nxy.socket"
> +#define BUFFER_SIZE 12
> +
> +/*
> + * File server.c
> + */
> +
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/socket.h>
> +#include <sys/un.h>
> +#include <unistd.h>
> +#include "connection.h"
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    struct sockaddr_un name;
> +    int down_flag = 0;
> +    int ret;
> +    int connection_socket;
> +    int data_socket;
> +    int result;
> +    char buffer[BUFFER_SIZE];
> +
> +    /*
> +     * In case the program exited inadvertently on the last run
> +     * remove the socket.
> +     */
> +
> +    unlink(SOCKET_NAME);
> +
> +    /* Create local socket. */
> +
> +    connection_socket = socket(AF_UNIX, SOCK_SEQPACKET, 0);
> +    if (connection_socket == \-1) {
> +        perror("socket");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * For portability clear the whole structure, since some implementations
> +     * have additional (nonstandard) fields in the structure.
> +     */
> +
> +    memset(&name, 0, sizeof(struct sockaddr_un));
> +
> +    /* Bind socket to socket name. */
> +
> +    name.sun_family = AF_UNIX;
> +    strncpy(name.sun_path, SOCKET_NAME, sizeof(name.sun_path) \- 1);
> +
> +    ret = bind(connection_socket, (const struct sockaddr *) &name,
> +               sizeof(struct sockaddr_un));
> +    if (ret == \-1) {
> +        perror("bind");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * Prepare for accepting connections. The backlog size is set to 20. So
> +     * while one request is being processed other requests can be waiting.
> +     */
> +
> +    ret = listen(connection_socket, 20);
> +    if (ret == \-1) {
> +        perror("listen");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* This is the main loop for handling connections. */
> +
> +    for (;;) {
> +
> +
> +        /* Wait for incoming connection. */
> +
> +        data_socket = accept(connection_socket, NULL, NULL);
> +        if (ret == \-1) {
> +            perror("accept");
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        result = 0;
> +        for(;;) {
> +
> +            /* Wait for next data packet. */
> +
> +            ret = read(data_socket, buffer, BUFFER_SIZE);
> +            if (ret == \-1) {
> +                perror("recv");
> +                exit(EXIT_FAILURE);
> +            }
> +
> +            /* Ensure buffer is 0\-terminated. */
> +
> +            buffer[BUFFER_SIZE \- 1] = 0;
> +
> +            /* Handle commands. */
> +
> +            if (!strncmp(buffer, "DOWN", BUFFER_SIZE)) {
> +                down_flag = 1;
> +                break;
> +            }
> +
> +            if (!strncmp(buffer, "END", BUFFER_SIZE)) {
> +                break;
> +            }
> +
> +            /* Add received summand. */
> +
> +            result += atoi(buffer);
> +        }
>  
> +        /* Send result. */
> +
> +        sprintf(buffer, "%d", result);
> +        ret = write(data_socket, buffer, BUFFER_SIZE);
> +
> +        if (ret == \-1) {
> +            perror("send");
> +            exit(EXIT_FAILURE);
> +        }
> +
> +        /* Close socket. */
> +
> +        close(data_socket);
> +
> +        /* Quit on DOWN command. */
> +
> +        if (down_flag) {
> +            break;
> +        }
> +    }
> +
> +    close(connection_socket);
> +
> +    /* Unlink the socket. */
> +
> +    unlink(SOCKET_NAME);
> +
> +    exit(EXIT_SUCCESS);
> +}
> +
> +/*
> + * File client.c
> + */
> +
> +#include <errno.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/socket.h>
> +#include <sys/un.h>
> +#include <unistd.h>
> +#include "connection.h"
> +
> +int
> +main(int argc, char *argv[])
> +{
> +    struct sockaddr_un name;
> +    int i;
> +    int ret;
> +    int data_socket;
> +    char buffer[BUFFER_SIZE];
> +
> +    /* Create local socket. */
> +
> +    data_socket = socket(AF_UNIX, SOCK_SEQPACKET, 0);
> +    if (data_socket == \-1) {
> +        perror("socket");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /*
> +     * For portability clear the whole structure, since some implementations
> +     * have additional (nonstandard) fields in the structure.
> +     */
> +
> +    memset(&name, 0, sizeof(struct sockaddr_un));
> +
> +    /* Connect socket to socket name. */
> +
> +    name.sun_family = AF_UNIX;
> +    strncpy(name.sun_path, SOCKET_NAME, sizeof(name.sun_path) \- 1);
> +
> +    ret = connect (data_socket, (const struct sockaddr *) &name,
> +                   sizeof(struct sockaddr_un));
> +    if (ret == \-1) {
> +        fprintf(stderr, "The server is down.\\n");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* Send arguments. */
> +
> +    for (i = 1; i < argc; ++i) {
> +        ret = write(data_socket, argv[i], strlen(argv[i]) + 1);
> +        if (ret == \-1) {
> +            perror("send");
> +            break;
> +        }
> +    }
> +
> +    /* Request result. */
> +
> +    strcpy (buffer, "END");
> +    ret = write(data_socket, buffer, strlen(buffer) + 1);
> +    if (ret == \-1) {
> +        perror("send");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +
> +    /* Receive result. */
> +
> +    ret = read(data_socket, buffer, BUFFER_SIZE);
> +    if (ret == \-1) {
> +        perror("recv");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    /* Ensure buffer is 0\-terminated. */
> +
> +    buffer[BUFFER_SIZE \- 1] = 0;
> +
> +    printf("Result = %s\\n", buffer);
> +
> +    /* Close socket. */
> +
> +    close(data_socket);
> +
> +    exit(EXIT_SUCCESS);
> +}
> +
> +.fi
> +.PP
>  For an example of the use of
>  .BR SCM_RIGHTS
>  see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
