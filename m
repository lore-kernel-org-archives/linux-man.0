From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: sendmmsg.2: ffix
Date: Tue, 06 Jan 2015 08:06:27 +0100
Message-ID: <54AB8973.5000003@gmail.com>
References: <CALhU9tmJcPyPG7OftU1r1uh9VysGEnNCyihtG+LRpM1RG9HVdg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tmJcPyPG7OftU1r1uh9VysGEnNCyihtG+LRpM1RG9HVdg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael

On 01/04/2015 10:30 PM, Akihiro Motoki wrote:
> diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
> index 7ae1c3e..cd5ce66 100644
> --- a/man2/sendmmsg.2
> +++ b/man2/sendmmsg.2
> @@ -30,7 +30,7 @@
>  sendmmsg \- send multiple messages on a socket
>  .SH SYNOPSIS
>  .nf
> -.B "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
> +.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
>  .BI "#include <sys/socket.h>"
> 
>  .BI "int sendmmsg(int " sockfd ", struct mmsghdr *" msgvec \
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
