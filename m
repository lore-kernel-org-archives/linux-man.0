From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/2] reboot.2: Mention RB_POWER_OFF
Date: Sun, 29 Dec 2013 02:16:17 +1300
Message-ID: <52BECF21.1090104@gmail.com>
References: <1380566504-9669-1-git-send-email-eliedebrauwer@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1380566504-9669-1-git-send-email-eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 10/01/13 07:41, Elie De Brauwer wrote:
> The manpage did not mention RB_POWER_OFF which is the glibc symbolic name
> for LINUX_REBOOT_CMD_POWER_OFF.

Thanks, Elie. Applied.

Cheers,

Michael


> edb@lapedb:/usr/include$ cat x86_64-linux-gnu/sys/reboot.h  | grep POWER_OFF
>  define RB_POWER_OFF	0x4321fedc
> 
> Signed-off-by: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>  man2/reboot.2 |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/reboot.2 b/man2/reboot.2
> index b25d62c..0ed6355 100644
> --- a/man2/reboot.2
> +++ b/man2/reboot.2
> @@ -115,7 +115,7 @@ This option is available only if the kernel was configured with
>  .BR CONFIG_KEXEC .
>  .TP
>  .B LINUX_REBOOT_CMD_POWER_OFF
> -(0x4321fedc; since 2.1.30).
> +(RB_POWER_OFF, 0x4321fedc; since 2.1.30).
>  The message "Power down." is printed, the system is stopped,
>  and all power is removed from the system, if possible.
>  If not preceded by a
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
