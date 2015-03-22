From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/1] socket.2: SEE ALSO close(2)
Date: Sun, 22 Mar 2015 19:09:55 +0100
Message-ID: <550F0573.4000404@gmail.com>
References: <1426341670-27668-1-git-send-email-xypron.glpk@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426341670-27668-1-git-send-email-xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/14/2015 03:01 PM, Heinrich Schuchardt wrote:
> The description mentions close(2). Hence it should also be referenced
> in the SEE ALSO section.

Thanks, Heinrich. Applied.

Cheers,

Michael



> Signed-off-by: Heinrich Schuchardt <xypron.glpk-Mmb7MZpHnFY@public.gmane.org>
> ---
>  man2/socket.2 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man2/socket.2 b/man2/socket.2
> index 448e922..86a4e98 100644
> --- a/man2/socket.2
> +++ b/man2/socket.2
> @@ -397,6 +397,7 @@ is shown in
>  .SH SEE ALSO
>  .BR accept (2),
>  .BR bind (2),
> +.BR close (2),
>  .BR connect (2),
>  .BR fcntl (2),
>  .BR getpeername (2),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
