From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] open,linkat: Update AT_EMPTY_PATH and O_PATH documentation
Date: Thu, 08 May 2014 11:45:14 +0200
Message-ID: <536B522A.9050906@gmail.com>
References: <818bf4803d4c8d20fa78a485bc57f8240a4f89b8.1376074657.git.luto@amacapital.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <818bf4803d4c8d20fa78a485bc57f8240a4f89b8.1376074657.git.luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 08/09/2013 08:58 PM, Andy Lutomirski wrote:
> The current text reflects the general worry in the kernel about
> recipients of O_PATH fds being able to hardlink the referenced files.
> It turns out that it was possible to link these files regardless of
> any possible security concerns.
> 
> Linux 3.11 removes the capability chech in AT_EMPTY_PATH.  I expect
> that this functionality will be generally useful, so let's document it
> better.

Andy,

Again, long after the fact, sorry. But, I've applied this now (with 
your spelling "chech" fixed in the change log, as you mentioned in the
follow-on mail).

Nicely constructed patch by the way: I liked the way that the additions
to the linkat() text explained why capability check (and thus the man 
page text describing the need for that check) was removed.

Cheers,

Michael


> 
> Signed-off-by: Andy Lutomirski <luto-kltTT9wpgjJwATOyAt5JVQ@public.gmane.org>
> ---
>  man2/linkat.2 | 28 ++++++++++++++++++----------
>  man2/open.2   |  8 +++++++-
>  2 files changed, 25 insertions(+), 11 deletions(-)
> 
> diff --git a/man2/linkat.2 b/man2/linkat.2
> index 701d341..003204d 100644
> --- a/man2/linkat.2
> +++ b/man2/linkat.2
> @@ -110,16 +110,16 @@ is an empty string, create a link to the file referenced by
>  flag).
>  In this case,
>  .I olddirfd
> -can refer to any type of file, not just a directory.
> -The caller must have the
> +can refer to any type of file, not just a directory.  This will
> +generally not work if the file has a link count of zero (files
> +created with
> +.BR O_TMPFILE
> +and without
> +.BR O_EXCL
> +are an exception).  Prior to
> +Linux 3.11, the caller must have the
>  .BR CAP_DAC_READ_SEARCH
> -capability in order to use this flag;
> -this prevents arbitrary users from creating hard links
> -using file descriptors received via a UNIX domain socket
> -(see the discussion of
> -.BR SCM_RIGHTS
> -in
> -.BR unix (7)).
> +capability in order to use this flag.
>  .TP
>  .BR AT_SYMLINK_FOLLOW " (since Linux 2.6.18)"
>  By default,
> @@ -134,7 +134,15 @@ can be specified in
>  .I flags
>  to cause
>  .I oldpath
> -to be dereferenced if it is a symbolic link.
> +to be dereferenced if it is a symbolic link.  If procfs is mounted,
> +this can be used as an alternative to AT_EMPTY_PATH, even by
> +unprivileged processes on Linux versions before 3.11, like this:
> +.RS
> +.PP
> +.EX
> +linkat(AT_FDCWD, "/proc/self/fd/<fd>", newdirfd, newname, AT_SYMLINK_FOLLOW);
> +.EE
> +.RE
>  .PP
>  Before kernel 2.6.18, the
>  .I flags
> diff --git a/man2/open.2 b/man2/open.2
> index 9ebc0a0..cb5d489 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -499,7 +499,13 @@ Passing the file descriptor as the
>  .IR dirfd
>  argument of
>  .BR openat (2)
> -and the other "*at()" system calls.
> +and the other "*at()" system calls.  This includes
> +.BR linkat (2)
> +with
> +.BR AT_EMPTY_PATH
> +(or via procfs using
> +.BR AT_SYMLINK_FOLLOW )
> +even if the file is not a directory.
>  .IP *
>  Passing the file descriptor to another process via a UNIX domain socket
>  (see
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
