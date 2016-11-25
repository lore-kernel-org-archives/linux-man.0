From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH draft_keys 1/7] keyctl.2: tfix
Date: Fri, 25 Nov 2016 09:35:07 +0100
Message-ID: <e98742f8-5994-7f78-c354-54158911d59e@gmail.com>
References: <51643019-bb42-4066-c824-c55b9e668ac6@man7.org>
 <20161125010050.GA32715@obsidian>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20161125010050.GA32715@obsidian>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 11/25/2016 02:00 AM, Eugene Syromyatnikov wrote:
> ---
>  man2/keyctl.2 | 1 -
>  1 file changed, 1 deletion(-)

Applied. Thanks, Eugene.

Cheers,

Michael


> diff --git a/man2/keyctl.2 b/man2/keyctl.2
> index d723b9a..cf2c991 100644
> --- a/man2/keyctl.2
> +++ b/man2/keyctl.2
> @@ -931,7 +931,6 @@ Use the process-specific keyring
>  .RB ( process-keyring (7))
>  as the new default keyring.
>  .TP
> -.TP
>  .BR KEY_REQKEY_DEFL_SESSION_KEYRING
>  Use the session-specific keyring
>  .RB ( session-keyring (7))
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
