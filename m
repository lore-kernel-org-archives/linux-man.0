From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/3] rtc.4: tfix
Date: Thu, 7 Jul 2016 12:10:36 +0200
Message-ID: <67a02f14-a821-f70d-92d7-4537517573a7@gmail.com>
References: <1467885458-625-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1467885458-625-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 07/07/2016 11:57 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub! Applied.

Cheers,

Michael


> ---
>  man4/rtc.4 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/man4/rtc.4 b/man4/rtc.4
> index c4675a7..218582c 100644
> --- a/man4/rtc.4
> +++ b/man4/rtc.4
> @@ -238,9 +238,9 @@ these operations can be used to read or to set the RTC's Epoch,
>  respectively.
>  The third
>  .BR ioctl (2)
> -argument is a
> +argument is an
>  .I "unsigned long\ *"
> -or a
> +or an
>  .IR "unsigned long" ,
>  respectively, and the value returned (or assigned) is the Epoch.
>  To set the RTC's Epoch the process must be privileged (i.e., have the
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
