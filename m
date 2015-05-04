From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] proc.5: Document /proc/PID/exe behaviour on unlinked
 pathnames
Date: Mon, 04 May 2015 11:25:41 +0200
Message-ID: <55473B15.1090608@gmail.com>
References: <20120101064056.GA23360@gaara.hadrons.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120101064056.GA23360-v62vTE6/wQGgM1MOaoewpti2O/JbrIOy@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Guillem,

On 01/01/2012 07:40 AM, Guillem Jover wrote:
> Signed-off-by: Guillem Jover <guillem-+FW4gsLVM0RAfugRpC6u6w@public.gmane.org>

Long ago, this patch fell of the table. I just found it again,
and applied.

Cheers,

Michael

> ---
>  man5/proc.5 |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)
> 
> diff --git a/man5/proc.5 b/man5/proc.5
> index 5aca38a..8aa8798 100644
> --- a/man5/proc.5
> +++ b/man5/proc.5
> @@ -58,7 +58,7 @@
>  .\" to see what information could be imported from that file
>  .\" into this file.
>  .\"
> -.TH PROC 5 2011-10-04 "Linux" "Linux Programmer's Manual"
> +.TH PROC 5 2011-12-29 "Linux" "Linux Programmer's Manual"
>  .SH NAME
>  proc \- process information pseudo-file system
>  .SH DESCRIPTION
> @@ -174,6 +174,8 @@ You can even type
>  .I /proc/[pid]/exe
>  to run another copy of the same executable as is being run by
>  process [pid].
> +If the pathname has been unlinked, the symbolic link will contain the
> +string \(aq (deleted)\(aq appended to the original pathname.
>  .\" The following was still true as at kernel 2.6.13
>  In a multithreaded process, the contents of this symbolic link
>  are not available if the main thread has already terminated
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
