From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] fallocate.2, unix.7: add section number
Date: Thu, 8 Sep 2011 17:32:24 +0200
Message-ID: <CAKgNAkiWU9G9J2AQ8t7ON-XE8JKVSacHYcaurF5mn9KSYuamNA@mail.gmail.com>
References: <4E5E46D0.7080800@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E46D0.7080800-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: Add section number to references to functions documented in other pages

Applied for 3.33.

Thanks,

Michael


> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -17,7 +17,7 @@ fallocate \- manipulate file space
> This is a nonportable, Linux-specific system call.
> For the portable, POSIX.1-specified method of ensuring that space
> is allocated for a file, see
> -.BR posix_fallocate ().
> +.BR posix_fallocate (3).
>
> .BR fallocate ()
> allows the caller to directly manipulate the allocated disk space
> diff --git a/man7/unix.7 b/man7/unix.7
> --- a/man7/unix.7
> +++ b/man7/unix.7
> @@ -346,7 +346,7 @@ specified on a connected socket.
> .TP
> .B ENOENT
> The pathname in the remote address specified to
> -.BR connect ()
> +.BR connect (2)
> did not exist.
> .TP
> .B ENOMEM
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
