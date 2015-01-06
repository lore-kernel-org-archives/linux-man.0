From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: recvmmsg.2: ffix
Date: Tue, 06 Jan 2015 08:05:21 +0100
Message-ID: <54AB8931.3020100@gmail.com>
References: <CALhU9tmF4yLQs_uSYqN7UGk2_aN5aV-2Dakg6PO_vr9FQFnqfg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CALhU9tmF4yLQs_uSYqN7UGk2_aN5aV-2Dakg6PO_vr9FQFnqfg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Akihiro Motoki <amotoki-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Akihiro Motoki,

Patch applied. Thank you!

Cheers,

Michael

On 01/04/2015 10:27 PM, Akihiro Motoki wrote:
> diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
> index c902d51..a2b1f43 100644
> --- a/man2/recvmmsg.2
> +++ b/man2/recvmmsg.2
> @@ -33,7 +33,7 @@
>  recvmmsg \- receive multiple messages on a socket
>  .SH SYNOPSIS
>  .nf
> -.B "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
> +.BR "#define _GNU_SOURCE" "         /* See feature_test_macros(7) */"
>  .BI "#include <sys/socket.h>"
> 
>  .BI "int recvmmsg(int " sockfd ", struct mmsghdr *" msgvec \
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
