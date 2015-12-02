From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] tty_ioctl.4: Remove TIOCTTYGSTRUCT ioctl info
Date: Wed, 02 Dec 2015 20:52:10 +0100
Message-ID: <565F4BEA.4050505@gmail.com>
References: <1447709969-26477-1-git-send-email-peter@hurleysoftware.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1447709969-26477-1-git-send-email-peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Jiri Slaby <jslaby-AlSwsSmVLrQ@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Peter,

On 11/16/2015 10:39 PM, Peter Hurley wrote:
> Thankfully, TIOCTTYGSTRUCT was removed in v2.5.67 by:
> 
>     commit b3506a09d15dc5aee6d4bb88d759b157016e1864
>     Author: Andries E. Brouwer <andries.brouwer-rh8NL+sEX9E@public.gmane.org>
>     Date:   Tue Apr 1 04:42:46 2003 -0800
> 
>     [PATCH] kill TIOCTTYGSTRUCT
> 
>     Only used for (dubious) debugging purposes, and exposes
>     internal kernel state.
> 
> [The git SHA is from Thomas Gleixner's history tree at
> https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git]

Thanks for the report/patch. Man-pages tends to take a conservative
approach about discarding stuff though, since people reading man pages
also need to know about past behavior. Therefore, I instead
just added a note that this ioctl() disappeared in Linux 2.5.67:
"This command was removed in Linux 2.5.67."

Cheers,

Michael

 
> Signed-off-by: Peter Hurley <peter-WaGBZJeGNqdsbIuE7sb01tBPR1lH4CV8@public.gmane.org>
> ---
>  man4/tty_ioctl.4 | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/man4/tty_ioctl.4 b/man4/tty_ioctl.4
> index 53645d8..c3bee35 100644
> --- a/man4/tty_ioctl.4
> +++ b/man4/tty_ioctl.4
> @@ -471,14 +471,6 @@ For the
>  .B TIOCLINUX
>  ioctl, see
>  .BR console_ioctl (4).
> -.SS Kernel debugging
> -.B "#include <linux/tty.h>"
> -.TP
> -.BI "TIOCTTYGSTRUCT	struct tty_struct *" argp
> -Get the
> -.I tty_struct
> -corresponding to
> -.IR fd .
>  .\"
>  .\" .SS Serial info
>  .\" .BR "#include <linux/serial.h>"
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
