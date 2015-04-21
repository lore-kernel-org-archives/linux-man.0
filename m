From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] open.2: Clarify which create mode bits are relevant
Date: Tue, 21 Apr 2015 14:38:44 +0200
Message-ID: <553644D4.2050905@gmail.com>
References: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <fe89279fbad286454188b3146b311442cdb7401f.1428946673.git.andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andreas Gruenbacher <andreas.gruenbacher-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Andreas,

On 04/13/2015 07:38 PM, Andreas Gruenbacher wrote:
> Clarify that on Linux, the S_ISUID, S_ISGID, and S_IVTX bits in the create mode
> are also honored.
> 
> Instead of repeating the S_I* definitions here, incompletely, refer to stat(2).

Thanks for the patch.

I'd have preferred it in three pieces, though, I think:

1) Improve stat(2)
2) Remove mode bits from open(92)
3) Explain that open(2) honors the S_ISVTX, S_ISUID, and S_ISGID.

What I did was to:

Accept (1).

Reject (2), since I'd rather save the reader of open(3) the trouble of 
consulting another page (and open(2) is likely a more often used man page 
than stat(2)).

Do (3) in a rather different way, that captures your intent. The changes are
already pushed to Git, in case you want to take a look.

Cheers,

Michael

> Signed-off-by: Andreas Gruenbacher <agruenba-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/open.2 | 51 +++++++++++----------------------------------------
>  man2/stat.2 |  6 +++---
>  2 files changed, 14 insertions(+), 43 deletions(-)
> 
> diff --git a/man2/open.2 b/man2/open.2
> index 053bab1..96ee576 100644
> --- a/man2/open.2
> +++ b/man2/open.2
> @@ -258,7 +258,12 @@ described in
>  .RS
>  .PP
>  .I mode
> -specifies the permissions to use in case a new file is created.
> +specifies the permissions to use in case a new file is created; see
> +the definition of the file permission mask values in
> +.BR stat (2).
> +When bits other than the file permission bits are set in
> +.IR mode ,
> +the effect is unspecified; for Linux, see below.
>  This argument must be supplied when
>  .B O_CREAT
>  or
> @@ -282,45 +287,6 @@ newly created file; the
>  .BR open ()
>  call that creates a read-only file may well return a read/write
>  file descriptor.
> -.PP
> -The following symbolic constants are provided for
> -.IR mode :
> -.TP 9
> -.B S_IRWXU
> -00700 user (file owner) has read, write and execute permission
> -.TP
> -.B S_IRUSR
> -00400 user has read permission
> -.TP
> -.B S_IWUSR
> -00200 user has write permission
> -.TP
> -.B S_IXUSR
> -00100 user has execute permission
> -.TP
> -.B S_IRWXG
> -00070 group has read, write and execute permission
> -.TP
> -.B S_IRGRP
> -00040 group has read permission
> -.TP
> -.B S_IWGRP
> -00020 group has write permission
> -.TP
> -.B S_IXGRP
> -00010 group has execute permission
> -.TP
> -.B S_IRWXO
> -00007 others have read, write and execute permission
> -.TP
> -.B S_IROTH
> -00004 others have read permission
> -.TP
> -.B S_IWOTH
> -00002 others have write permission
> -.TP
> -.B S_IXOTH
> -00001 others have execute permission
>  .RE
>  .TP
>  .BR O_DIRECT " (since Linux 2.4.10)"
> @@ -1489,6 +1455,11 @@ as a performance option which is disabled by default.
>  interface is just stupid, and was probably designed by a deranged monkey
>  on some serious mind-controlling substances."\(emLinus
>  .RE
> +.SH NOTES
> +Under Linux, apart from the permission bits, the
> +.BR S_ISUID ", " S_ISGID ", and " S_ISVTX
> +.I mode
> +bits are also honored.
>  .SH BUGS
>  Currently, it is not possible to enable signal-driven
>  I/O by specifying
> diff --git a/man2/stat.2 b/man2/stat.2
> index a78ffaf..aa9494f 100644
> --- a/man2/stat.2
> +++ b/man2/stat.2
> @@ -381,18 +381,18 @@ S_ISUID	0004000	set-user-ID bit
>  S_ISGID	0002000	set-group-ID bit (see below)
>  S_ISVTX	0001000	sticky bit (see below)
>  
> -S_IRWXU	  00700	mask for file owner permissions
> +S_IRWXU	  00700	owner has read, write and execute permission
>  S_IRUSR	  00400	owner has read permission
>  S_IWUSR	  00200	owner has write permission
>  S_IXUSR	  00100	owner has execute permission
>  
> -S_IRWXG	  00070	mask for group permissions
> +S_IRWXG	  00070	group has read, write and execute permission
>  S_IRGRP	  00040	group has read permission
>  S_IWGRP	  00020	group has write permission
>  S_IXGRP	  00010	group has execute permission
>  
>  S_IRWXO	  00007	T{
> -mask for permissions for others (not in group)
> +others (not in group) have read, write and execute permission
>  T}
>  S_IROTH	  00004	others have read permission
>  S_IWOTH	  00002	others have write permission
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
