From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] namespaces(7): minor tweaks
Date: Sat, 08 Nov 2014 14:29:32 +0100
Message-ID: <545E1ABC.9090901@gmail.com>
References: <1414956235-26135-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1414956235-26135-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Mike. Applied.

Cheers,

Michael


On 11/02/2014 08:23 PM, Mike Frysinger wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man7/namespaces.7 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/man7/namespaces.7 b/man7/namespaces.7
> index d14d258..0eeaf89 100644
> --- a/man7/namespaces.7
> +++ b/man7/namespaces.7
> @@ -36,7 +36,6 @@ that are members of the namespace, but are invisible to other processes.
>  One use of namespaces is to implement containers.
>  
>  Linux provides the following namespaces:
> -
>  .TS
>  lB lB lB
>  l lB l.
> @@ -196,7 +195,7 @@ and (since Linux 2.6.30)
>  .\" commit 7eafd7c74c3f2e67c27621b987b28397110d643f
>  .\" https://lwn.net/Articles/312232/
>  POSIX message queues (see
> -.BR mq_overview (7).
> +.BR mq_overview (7)).
>  The common characteristic of these IPC mechanisms is that IPC
>  objects are identified by mechanisms other than filesystem
>  pathnames.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
