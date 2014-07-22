From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Possible Manpage bug for bind(2)
Date: Tue, 22 Jul 2014 07:40:15 +0200
Message-ID: <53CDF93F.70202@gmail.com>
References: <CA+D=RwhXRWwfVoxKwEaqviET0bOGJ2wOE8qMbmZH7a3-Bd6xYg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CA+D=RwhXRWwfVoxKwEaqviET0bOGJ2wOE8qMbmZH7a3-Bd6xYg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ryan Hammonds <rhammonds-AMWTPT7kBHDQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Ryan,

On 07/17/2014 07:39 PM, Ryan Hammonds wrote:
> Greetings,
> I'd like to point out an issue in the manpage for bind(2). My
> application is trying to bind an IPV4 UDP socket to an address. I've
> found that passing an invalid address length to bind() causes bind to
> return EINVAL. According to the bind(2) manpage, this should only
> occur when using unix domain sockets (which I am not). 

Yes, your report looks right to me. I applied the patch below.
Thanks for the report.


> This also
> makes me wonder if the current description (EINVAL = "the socket is
> already bound to an address") is correct in the first place.

A bit of light testing suggests that it is (still) correct.

Cheers,

Michael

--- a/man2/bind.2
+++ b/man2/bind.2
@@ -183,6 +183,12 @@ The socket is already bound to an address.
 .\" This may change in the future: see
 .\" .I linux/unix/sock.c for details.
 .TP
+.B EINVAL
+.I addrlen
+is wrong, or
+.I addr
+is not a valid address for this socket's domain.
+.TP
 .B ENOTSOCK
 .I sockfd
 is a descriptor for a file, not a socket.
@@ -204,13 +210,6 @@ address was not local.
 .I addr
 points outside the user's accessible address space.
 .TP
-.B EINVAL
-The
-.I addrlen
-is wrong, or the socket was not in the
-.B AF_UNIX
-family.
-.TP
 .B ELOOP
 Too many symbolic links were encountered in resolving
 .IR addr .

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
