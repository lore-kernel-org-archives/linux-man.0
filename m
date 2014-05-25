From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] inotify.7: munmap does not lead to inotify events
Date: Sun, 25 May 2014 19:51:03 +0200
Message-ID: <53822D87.5080002@gmail.com>
References: <1400963027-17857-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1400963027-17857-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Heinrich. Patch applied.

Cheers,

Michael

On 05/24/2014 10:23 PM, Heinrich Schuchardt wrote:
> mmap and msync were already described as not leading to inotify
> events.
> 
> This patch adds munmap.
> I created and executed a test to verify this.
> 
> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man7/inotify.7 | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/man7/inotify.7 b/man7/inotify.7
> index 55e5cab..f719614 100644
> --- a/man7/inotify.7
> +++ b/man7/inotify.7
> @@ -633,9 +633,10 @@ are not monitorable with inotify.
>  
>  The inotify API does not report file accesses and modifications that
>  may occur because of
> -.BR mmap (2)
> +.BR mmap (2),
> +.BR msync (2),
>  and
> -.BR msync (2).
> +.BR munmap (2).
>  
>  The inotify API identifies affected files by filename.
>  However, by the time an application processes an inotify event,
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
