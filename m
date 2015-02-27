From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] console_codes.4: Add missing escape sequence
Date: Fri, 27 Feb 2015 08:32:27 +0100
Message-ID: <54F01D8B.6090501@gmail.com>
References: <alpine.LNX.2.11.1502270231140.723@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LNX.2.11.1502270231140.723@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Scot Doyle <lkml14-enLWO88E2pdl57MIdRCFDg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Scott,

On 02/27/2015 03:35 AM, Scot Doyle wrote:
> An undocumented escape sequence in drivers/tty/vt/vt.c brings the
> previously accessed virtual terminal to the foreground.

Thanks. Applied. Looks like this sequence appeared with ~2.6.0 or so.
Do you know if this is so?

Cheers,

Michael

> Signed-off-by: Scot Doyle <lkml14-enLWO88E2pdl57MIdRCFDg@public.gmane.org>
> ---
>  man4/console_codes.4 | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/man4/console_codes.4 b/man4/console_codes.4
> index 00b8c40..0d75149 100644
> --- a/man4/console_codes.4
> +++ b/man4/console_codes.4
> @@ -373,6 +373,7 @@ ESC [ 11 ; \fIn\fP ]	Set bell duration in msec.
>  ESC [ 12 ; \fIn\fP ]	Bring specified console to the front.
>  ESC [ 13 ]      	Unblank the screen.
>  ESC [ 14 ; \fIn\fP ]   	Set the VESA powerdown interval in minutes.
> +ESC [ 15 ]      	Bring the previous console to the front.
>  .TE
>  .SS Character sets
>  The kernel knows about 4 translations of bytes into console-screen
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
