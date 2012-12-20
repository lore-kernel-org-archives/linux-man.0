From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] recvmmsg.2: Updated fixme, added example
Date: Thu, 20 Dec 2012 17:51:49 +0100
Message-ID: <CAKgNAkgDE3yyLOjdaAjWgpS2iPMmcr3njAWik20nMiX=ZQYUHg@mail.gmail.com>
References: <1355944722-21572-1-git-send-email-eliedebrauwer@gmail.com> <1355952504-4728-1-git-send-email-eliedebrauwer@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355952504-4728-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elie,

Can you please resubmit with fixes as below.

On Wed, Dec 19, 2012 at 10:28 PM, Elie De Brauwer
<eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi all,
>
> Same patch as before but I spotted a typo I made applicatoin -> application.
>
> my 2 cents
> E.
>
> ---
>  man2/recvmmsg.2 |   94 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 92 insertions(+), 2 deletions(-)
>
> diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
> index a7b00d4..3252be7 100644
> --- a/man2/recvmmsg.2
> +++ b/man2/recvmmsg.2
> @@ -21,8 +21,6 @@
>  .\" Formatted or processed versions of this manual, if unaccompanied by
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\"
> -.\" FIXME: This page could be improved with an example program.
> -.\"
>  .TH RECVMMSG 2 2012-05-02 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  recvmmsg \- receive multiple messages on a socket
> @@ -165,6 +163,98 @@ Support in glibc was added in version 2.12.
>  .SH CONFORMING TO
>  .BR recvmmsg ()
>  is Linux-specific.
> +.SH EXAMPLE
> +.PP
> +The following program uses
> +.BR recvmmsg ()
> +to receive multiple messages on a socket and stores
> +them in multiple buffers. The call returns of all buffers

Start new sentences on new source lines.

> +are filled or if the timeout specified is expired.
> +
> +The following
> +.BR bash (1)

change to "The following shell snippet..." (We don't really care that it's bash)

> +snippet periodically generates UDP datagrams containing a
> +a random number:
> +.in +4n
> +.nf
> +.RB "$" " while true; do echo $RANDOM > /dev/udp/127.0.0.1/1234; sleep 0.25; done"
> +.fi
> +.in
> +
> +These datagrams are read by the example application which
> +can give the following output:
> +.in +4n
> +.nf
> +.RB "$" " ./a.out"
> +5 messages received
> +1 11782
> +2 11345
> +3 304
> +4 13514
> +5 28421
> +.fi
> +.in
> +.SS Program source
> +\&
> +.nf
> +#define _GNU_SOURCE
> +#include <netinet/ip.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/socket.h>
> +
> +int
> +main()
> +{
> +#define VLEN 10
> +#define BUFSIZE 200
> +#define TIMEOUT 1
> +    int sockfd, retval, i;
> +    struct sockaddr_in sa;
> +    struct mmsghdr msgs[VLEN];
> +    struct iovec iovecs[VLEN];
> +    char bufs[VLEN][BUFSIZE+1];
> +    struct timespec timeout;
> +
> +    sockfd = socket(AF_INET, SOCK_DGRAM, 0);
> +    if (sockfd == \-1) {
> +        perror("socket()");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    sa.sin_family = AF_INET;
> +    sa.sin_addr.s_addr = htonl(INADDR_LOOPBACK);
> +    sa.sin_port = htons(1234);
> +    if (bind(sockfd, (struct sockaddr *) &sa, sizeof(sa))) {

Add "== \-1" here please.

> +        perror("bind()");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    memset(msgs, 0, sizeof(msgs));
> +    for (i = 0; i < VLEN; i++) {
> +        iovecs[i].iov_base         = bufs[i];
> +        iovecs[i].iov_len          = BUFSIZE;
> +        msgs[i].msg_hdr.msg_iov    = &iovecs[i];
> +        msgs[i].msg_hdr.msg_iovlen = 1;
> +    }
> +
> +    timeout.tv_sec = TIMEOUT;
> +    timeout.tv_nsec = 0;
> +
> +    retval = recvmmsg(sockfd, msgs, VLEN, 0, &timeout);
> +    if (retval == -1)
> +        perror("recvmmsg()");
> +    else {

Make the preceding (and note the addition of the backslash).

if (retval == \-1)
    perror()
    exit(EXIT_FAILURE);
}

And then the following part does not need to sit in an 'else' branch.

> +        printf("%d messages received\n", retval);

\n should be \\n

> +        for (i = 0; i < retval; i++) {
> +            bufs[i][msgs[i].msg_len] = 0;
> +            printf("%d %s", i+1, bufs[i]);
> +        }
> +    }
> +    exit(EXIT_SUCCESS);
> +}
> +.fi
>  .SH SEE ALSO
>  .BR clock_gettime (2),
>  .BR recvmsg (2),

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
