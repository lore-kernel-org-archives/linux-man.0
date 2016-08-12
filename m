From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] pipe.2: mention fcntl and F_GETPIPE_SZ/F_SETPIPE_SZ
Date: Sat, 13 Aug 2016 08:18:32 +1200
Message-ID: <2253ca42-f7ee-331b-f6e0-95001954918e@gmail.com>
References: <1471016112-18025-1-git-send-email-vegard.nossum@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1471016112-18025-1-git-send-email-vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Vegard,

On 08/13/2016 03:35 AM, Vegard Nossum wrote:
> Signed-off-by: Vegard Nossum <vegard.nossum-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
> ---
>  man2/pipe.2 | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git man2/pipe.2 man2/pipe.2
> index 88835ca..e817ba9 100644
> --- man2/pipe.2
> +++ man2/pipe.2
> @@ -130,6 +130,14 @@ file status flag on the two new open file descriptions.
>  Using this flag saves extra calls to
>  .BR fcntl (2)
>  to achieve the same result.
> +.P
> +On Linux, the size of the pipe buffer can be obtained or changed using
> +.B F_GETPIPE_SZ
> +and
> +.B F_SETPIPE_SZ;
> +see
> +.BR fcntl (2)
> +for more information.

This detail is covered (with rather more context), in pipe(7), which is
referenced in the first paragraph of the pipe(2) page.

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
