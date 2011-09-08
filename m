From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] truncate.2: remove redundant EINTR description
Date: Thu, 8 Sep 2011 17:03:03 +0200
Message-ID: <CAKgNAkgUL9GCMqYBCrQfQ8q8tBs9dJB5-2iSF-mh4J5DL2MW2A@mail.gmail.com>
References: <4E5E53F3.2050600@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E53F3.2050600-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: There are two EINTR items in the errno list.
> The first one is the older one, so was removed.
> Then the newer one (which was added in the commit
> 3ade1aa9) was moved upward according to the
> alphabetical order.

Thanks Seonghun. Applied for 3.33.

Cheers,

Michael


> diff --git a/man2/truncate.2 b/man2/truncate.2
> --- a/man2/truncate.2
> +++ b/man2/truncate.2
> @@ -130,7 +130,11 @@ The argument
> is larger than the maximum file size. (XSI)
> .TP
> .B EINTR
> -A signal was caught during execution.
> +While blocked waiting to complete,
> +the call was interrupted by a signal handler; see
> +.BR fcntl (2)
> +and
> +.BR signal (7).
> .TP
> .B EINVAL
> The argument
> @@ -140,13 +144,6 @@ is negative or larger than the maximum file size.
> .B EIO
> An I/O error occurred updating the inode.
> .TP
> -.B EINTR
> -While blocked waiting to complete,
> -the call was interrupted by a signal handler; see
> -.BR fcntl (2)
> -and
> -.BR signal (7).
> -.TP
> .B EISDIR
> The named file is a directory.
> .TP
>
>
> And the batch is finished.
> Thanks for your maintaining of the invaluable documents.
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
