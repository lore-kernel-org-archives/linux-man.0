From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] reboot.2: add return value description for behavior
 inside PID namespace
Date: Tue, 22 Nov 2016 09:54:34 +0100
Message-ID: <0b9cad69-2ec2-375b-45d8-66ab59643114@gmail.com>
References: <1479803957-1962-1-git-send-email-long.wanglong@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1479803957-1962-1-git-send-email-long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, std.liu-hv44wF8Li93QT0dZR+AlfA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/22/2016 09:39 AM, Wang Long wrote:
> Signed-off-by: Wang Long <long.wanglong-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>

Thank you, Wang Long. Patch applied.

Cheers,

Michael

> ---
>  man2/reboot.2 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man2/reboot.2 b/man2/reboot.2
> index db0806c..2dfaeb7 100644
> --- a/man2/reboot.2
> +++ b/man2/reboot.2
> @@ -185,6 +185,12 @@ and
>  cause a
>  .B SIGINT
>  signal to be sent.
> +For the other
> +.I cmd
> +values, \-1 is returned and
> +.I errno
> +is set to
> +.BR EINVAL .
>  .SH RETURN VALUE
>  For the values of
>  .I cmd
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
