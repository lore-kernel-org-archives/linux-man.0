From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] flock.2: describe flock on NFS filesystems
Date: Tue, 3 Oct 2017 20:42:02 +0200
Message-ID: <00967f01-27c5-00ae-7278-158f2fe836ee@gmail.com>
References: <20110915080934.GA9293@foxbat.suse.cz>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110915080934.GA9293-hLZXBWembXzjFM9bn6wA6Q@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peter,

On 09/15/2011 10:09 AM, Petr Uzel wrote:
> NFSv4 need file to be opened in RW-mode to place exclusive lock:
> http://www.spinics.net/lists/linux-nfs/msg18502.html
> 
> flock works on NFS since 2.6.12:
> http://nfs.sourceforge.net/#section_d ,section D10

Long ago, this patch fell on the floor. Sorry about that.
Someone did later fix most of this, but the detail
that NFS requires the file to be opened for writing in
order to place a LOCK_EX lock was missing. I've added it
now.

Thanks,

Michael

> Signed-off-by: Petr Uzel <petr.uzel-AlSwsSmVLrQ@public.gmane.org>
> ---
>  man2/flock.2 |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/flock.2 b/man2/flock.2
> index f0d85af..c904f6b 100644
> --- a/man2/flock.2
> +++ b/man2/flock.2
> @@ -107,7 +107,8 @@ are preserved across an
>  .BR execve (2).
>  
>  A shared or exclusive lock can be placed on a file regardless of the
> -mode in which the file was opened.
> +mode in which the file was opened. The exception is NFSv4, where
> +the file has to be opened for writing to place exclusive lock.
>  .SH "RETURN VALUE"
>  On success, zero is returned.
>  On error, \-1 is returned, and
> @@ -146,7 +147,8 @@ possibly implemented in terms of
>  appears on most UNIX systems.
>  .SH NOTES
>  .BR flock ()
> -does not lock files over NFS.
> +does not lock files over NFS before kernel 2.6.12. Since
> +2.6.12, kernel emulates flock () using fcntl(2).
>  Use
>  .BR fcntl (2)
>  instead: that does work over NFS, given a sufficiently recent version of
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
