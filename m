From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] reboot.2: tfix (double word) and minor format issue
Date: Sat, 11 Jan 2014 05:48:30 +1300
Message-ID: <52D0245E.5060003@gmail.com>
References: <1389221668-25712-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1389221668-25712-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks,Simon. Applied.

Cheers,

Michael


On 01/09/2014 11:54 AM, Simon Paillard wrote:
> ---
>  man2/reboot.2 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/reboot.2 b/man2/reboot.2
> index aa55cae..152f346 100644
> --- a/man2/reboot.2
> +++ b/man2/reboot.2
> @@ -113,7 +113,7 @@ data will be lost.
>  .TP
>  .BR LINUX_REBOOT_CMD_KEXEC
>  .RB ( RB_KEXEC ,
> -0x45584543, since Linux Linux 2.6.13)
> +0x45584543, since Linux 2.6.13).
>  Execute a kernel that has been loaded earlier with
>  .BR kexec_load (2).
>  This option is available only if the kernel was configured with



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
