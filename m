From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] sendmmsg.2: Updated fixme, added example
Date: Sat, 15 Dec 2012 19:23:20 +0100
Message-ID: <CAKgNAkjek38=5O087GQ5QCtxYtkM4ig3akR=7uucfgX8ppUnwQ@mail.gmail.com>
References: <CAKgNAkj9MaU5fHbJMEwSDgh_vhmmNxfA9fq7uJYCCXD-=NAapQ@mail.gmail.com>
 <1355593447-9170-1-git-send-email-eliedebrauwer@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355593447-9170-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Elie,

On Sat, Dec 15, 2012 at 6:44 PM, Elie De Brauwer
<eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hello all,
>
> Updated my patch with the comment from Michael (thanks for the feedback btw).
> I however did not include the shell session using netcat for the simple
> reason that the output of netcat does not illustrate that the call functions
> correctly. The output of netcat would be the same no matter how much
> UDP datagrams were created in the transmission, the only reason why I showed
> it in my previous e-mail was to avoid the generation of icmp port
> unreachable which would break my tcpdump capture. This latter one is what I
> really wanted to show, but i think that one's a bit too far fetched to be
> held in a manpage.

Fair enough.

I've applied this patch for 3.45.

Cheers,

Michael


> ---
>  man2/sendmmsg.2 |   70 +++++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 68 insertions(+), 2 deletions(-)
>
> diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
> index 12ad3ff..b426b4d 100644
> --- a/man2/sendmmsg.2
> +++ b/man2/sendmmsg.2
> @@ -23,8 +23,6 @@
>  .\" Formatted or processed versions of this manual, if unaccompanied by
>  .\" the source, must acknowledge the copyright and authors of this work.
>  .\"
> -.\" FIXME Adding an example program would improve this page
> -.\"
>  .TH SENDMMSG 2 2012-02-27 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  sendmmsg \- send multiple messages on a socket
> @@ -165,6 +163,74 @@ is capped to
>  .\"     For error handling an application using sendmmsg needs to retry at
>  .\"     the first unsent message, so capping is simpler and requires less
>  .\"     application logic than returning EINVAL.
> +.SH EXAMPLE
> +The example below uses
> +.BR sendmmsg ()
> +to send
> +.I onetwo
> +and
> +.I three
> +in two distinct UDP datagrams using one system call. The contents
> +of the first datagram originates from a pair of buffers.
> +
> +.nf
> +#define _GNU_SOURCE
> +#include <netinet/ip.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <sys/types.h>
> +#include <sys/socket.h>
> +
> +int
> +main()
> +{
> +    int sockfd;
> +    struct sockaddr_in sa;
> +    struct mmsghdr msg[2];
> +    struct iovec msg1[2], msg2;
> +    int retval;
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
> +    if (connect(sockfd, (struct sockaddr *) &sa, sizeof(sa))) {
> +        perror("connect()");
> +        exit(EXIT_FAILURE);
> +    }
> +
> +    memset(msg1, 0, sizeof(msg1));
> +    msg1[0].iov_base = "one";
> +    msg1[0].iov_len = 3;
> +    msg1[1].iov_base = "two";
> +    msg1[1].iov_len = 3;
> +
> +    memset(&msg2, 0, sizeof(msg2));
> +    msg2.iov_base = "three";
> +    msg2.iov_len = 5;
> +
> +    memset(msg, 0, sizeof(msg));
> +    msg[0].msg_hdr.msg_iov = msg1;
> +    msg[0].msg_hdr.msg_iovlen = 2;
> +
> +    msg[1].msg_hdr.msg_iov = &msg2;
> +    msg[1].msg_hdr.msg_iovlen = 1;
> +
> +    retval = sendmmsg(sockfd, msg, 2, 0);
> +    if (retval == -1)
> +        perror("sendmmsg()");
> +    else
> +        printf("%d messages sent\\n", retval);
> +
> +    exit(0);
> +}
> +.fi
>  .SH SEE ALSO
>  .BR recvmmsg (2),
>  .BR sendmsg (2),
> --
> 1.7.10.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
