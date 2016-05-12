From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] inet_pton.3: Mention byte order
Date: Thu, 12 May 2016 10:23:30 +0300
Message-ID: <CACKs7VAa+v_0q1JOWOka=g0UiTzyMv-hSKYZZKebm04U5Z1_Jw@mail.gmail.com>
References: <CACKs7VAgKPUOp7+_0NzWujruw0fsMF0L+UnsNqV=zsfmF+tqrw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CACKs7VAgKPUOp7+_0NzWujruw0fsMF0L+UnsNqV=zsfmF+tqrw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Come to think of it, this probably applies to IPv6 as well. Moving to
the paragraph before:

diff --git a/man3/inet_pton.3 b/man3/inet_pton.3
index 4ff16b9..2c487c5 100644
--- a/man3/inet_pton.3
+++ b/man3/inet_pton.3
@@ -48,6 +48,8 @@ argument must be either
 .B AF_INET
 or
 .BR AF_INET6 .
+.IR dst
+is written in network byte order.
 .PP
 The following address families are currently supported:
 .TP

On Thu, May 12, 2016 at 10:16 AM, Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> Hi,
>
> I was a bit stumped recently to realize that both inet_ntop() and
> inet_pton() work with addresses in network byte order. inet_ntop.3
> mentions that, and the example from inet_pton(), as far as I can tell,
> implies that you can call inet_ntop() on the result of inet_pton(), so
> the byte order needs to match, but I think it's better to mention this
> explicitly in the man page text. How about this (patch against git)?
>
> diff --git a/man3/inet_pton.3 b/man3/inet_pton.3
> index 4ff16b9..8b1017e 100644
> --- a/man3/inet_pton.3
> +++ b/man3/inet_pton.3
> @@ -64,6 +64,8 @@ and copied to
>  which must be
>  .I sizeof(struct in_addr)
>  (4) bytes (32 bits) long.
> +.IR dst
> +is written in network byte order.
>  .TP
>  .B AF_INET6
>  .I src
>
> Thanks,
> Stefan.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
