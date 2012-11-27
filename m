From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] exec(3): fix indentation of execvpe args
Date: Tue, 27 Nov 2012 08:35:51 +0100
Message-ID: <CAKgNAkiP00SHp3rupo=ErPC0q6TQHzMvR+GVPVTuZQWzN=9hZQ@mail.gmail.com>
References: <1353921241-28068-1-git-send-email-vapier@gentoo.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353921241-28068-1-git-send-email-vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks Mike. Applied.

On Mon, Nov 26, 2012 at 10:14 AM, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org> wrote:
> Signed-off-by: Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>
> ---
>  man3/exec.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/man3/exec.3 b/man3/exec.3
> index e997807..617ec5c 100644
> --- a/man3/exec.3
> +++ b/man3/exec.3
> @@ -58,7 +58,7 @@ execl, execlp, execle, execv, execvp, execvpe \- execute a file
>  .br
>  .BI "int execvpe(const char *" file ", char *const " argv "[],"
>  .br
> -.BI "           char *const " envp "[]);"
> +.BI "            char *const " envp "[]);"
>  .sp
>  .in -4n
>  Feature Test Macro Requirements for glibc (see
> --
> 1.7.12.4
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
