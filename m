From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] chroot.2: not intended for security, document attack
Date: Tue, 16 Jun 2015 10:06:44 +0200
Message-ID: <557FD914.9070109@gmail.com>
References: <1434281104-28129-1-git-send-email-jann@thejh.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1434281104-28129-1-git-send-email-jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jann Horn <jann-XZ1E9jl8jIdeoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, "Eric W. Biederman" <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Jann,

On 06/14/2015 01:25 PM, Jann Horn wrote:
> It is unfortunate that this discourages this use of chroot(2) without
> pointing out alternative solutions - for example, OpenSSH and vsftpd
> both still rely on chroot(2) for security.
> 
> Bind mounts should theoretically be usable as a replacement, but
> currently, they have a similar problem (CVE-2015-2925) that hasn't
> been fixed in ~6 months, so I'd rather not add it to the manpage as a
> solution before a fix lands.

Thanks. I've applied this. Minor comments below.

> ---
>  man2/chroot.2 | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/man2/chroot.2 b/man2/chroot.2
> index 4a70db4..357baba 100644
> --- a/man2/chroot.2
> +++ b/man2/chroot.2
> @@ -73,7 +73,30 @@ capability) may call
>  .BR chroot ().
>  
>  This call changes an ingredient in the pathname resolution process
> -and does nothing else.
> +and does nothing else. In particular, it is not intended to be used

I prefer new sentences to start on new source lines. Text changes to a 
page often work at the level of sentences, so that placing new sentences 
on new lines makes future patches easier to read.)

> +for any kind of security purpose, neither to fully sandbox a process nor
> +to restrict filesystem syscalls. In the past,

"system calls" not "syscalls".

> +.BR chroot ()
> +has been used by daemons to restrict themselves prior to passing paths
> +supplied by untrusted users into syscalls like
> +.BR open (2).
> +However, if a folder is moved out of the chroot directory, an attacker
> +can exploit that to get out of the chroot directory as well. The easiest
> +way to do that is to
> +.BR chdir (2)
> +to the to-be-moved directory, wait for it to be moved out, then open a
> +path like ../../../etc/passwd.
> +
> +
> +.\" This is how the "slightly trickier variation" works:
> +.\" https://github.com/QubesOS/qubes-secpack/blob/master/QSBs/qsb-014-2015.txt#L142
> +A slightly
> +trickier variation also works under some circumstances if
> +.BR chdir (2)
> +is not permitted. If a daemon allows a "chroot directory" to be specified,
> +that usually means that if you want to prevent remote users from accessing
> +files outside the chroot directory, you must ensure that folders are never
> +moved out of it.
>  
>  This call does not change the current working directory,
>  so that after the call \(aq\fI.\fP\(aq can
> @@ -87,6 +110,7 @@ by doing:
>  
>  This call does not close open file descriptors, and such file
>  descriptors may allow access to files outside the chroot tree.
> +

Not sure why you added the blank line here. It has no relation to
the rest of the patch (and is not needed anyway, so I removed it).

>  .SH RETURN VALUE
>  On success, zero is returned.
>  On error, \-1 is returned, and

Cheers,

Michael



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
