From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] clone.2, execve.2: Document interaction of execve(2)
 with CLONE_FILES
Date: Thu, 05 Feb 2015 13:40:22 +0100
Message-ID: <54D364B6.1050708@gmail.com>
References: <20130506061441.GA9249@chicago.guarana.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130506061441.GA9249-Qr0l8DEfScZEV+tojptmR0B+6BGkLq7r@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kevin Easton <kevin-RFfraI6bZkdAfugRpC6u6w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/06/2013 08:14 AM, Kevin Easton wrote:
> Hi Michael,
> 
> This patch is against man-pages-3.51.  It documents the fact that a
> successful execve(2) in a process that is sharing a file descriptor table
> results in unsharing the table.
> 
> I discovered this through testing and verified it by source inspection - 
> there is a call to unshare_files() early in do_execve_common().

Thanks, Kevin. Applied.

Cheers,

Michael


> diff -ur man-pages-3.51.orig/man2/clone.2 man-pages-3.51/man2/clone.2
> --- man-pages-3.51.orig/man2/clone.2    2013-04-19 21:57:19.000000000 +1000
> +++ man-pages-3.51/man2/clone.2 2013-05-06 15:42:06.841539649 +1000
> @@ -206,6 +206,9 @@
>  .BR fcntl (2)
>  .B F_SETFD
>  operation), the other process is also affected.
> +If a process sharing a file descriptor table calls
> +.BR execve (2),
> +its file descriptor table is duplicated (unshared).
> 
>  If
>  .B CLONE_FILES
> Only in man-pages-3.51/man2: clone.2.orig
> diff -ur man-pages-3.51.orig/man2/execve.2 man-pages-3.51/man2/execve.2
> --- man-pages-3.51.orig/man2/execve.2   2013-04-19 21:57:19.000000000 +1000
> +++ man-pages-3.51/man2/execve.2        2013-05-06 15:42:06.841539649 +1000
> @@ -204,6 +204,11 @@
>  .B SIGCHLD
>  (see
>  .BR clone (2)).
> +.IP *
> +The file descriptor table is unshared, undoing the effect of the
> +.B CLONE_FILES
> +flag of
> +.BR clone (2).
>  .PP
>  Note the following further points:
>  .IP * 3
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
