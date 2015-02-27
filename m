From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] man-pages.7: improve the definition of sections in accordance
 with intro pages
Date: Fri, 27 Feb 2015 08:36:00 +0100
Message-ID: <54F01E60.2080407@gmail.com>
References: <1424996777-10600-1-git-send-email-saulery@free.fr> <1424996777-10600-3-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1424996777-10600-3-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/27/2015 01:26 AM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man7/man-pages.7 | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/man7/man-pages.7 b/man7/man-pages.7
> index ceead84..e17434e 100644
> --- a/man7/man-pages.7
> +++ b/man7/man-pages.7
> @@ -48,32 +48,34 @@ for authors writing man pages for other projects.
>  .PP
>  The manual Sections are traditionally defined as follows:
>  .TP 10
> -.B 1 Commands (Programs)
> +.B 1 User commands (Programs)
>  Those commands that can be executed by the user from within
>  a shell.
>  .TP
>  .B 2 System calls
> -Those functions which must be performed by the kernel.
> +Those functions which wrap operations performed by the kernel.
>  .TP
>  .B 3 Library calls
> -Most of the
> +All library functions excluding the system call wrappers
> +(Most of the
>  .I libc
> -functions.
> +functions).
>  .TP
>  .B 4 Special files (devices)
>  Files found in
> -.IR /dev .
> +.I /dev
> +which allow to access to devices through the kernel.
>  .TP
> -.B 5 File formats and conventions
> -The format for
> -.I /etc/passwd
> -and other human-readable files.
> +.B 5 File formats and configuration
> +Describes various human-readable file formats and configuration file=
s.
>  .TP
>  .B 6 Games
> +Games and funny little programs available on the system.
>  .TP
>  .B 7 Overview, conventions, and miscellaneous
> -Overviews of various topics, conventions and protocols,
> -character set standards, and miscellaneous other things.
> +Overviews or descriptions of various topics, conventions and protoco=
ls,
> +character set standards, the standard filesystem layout, and miscell=
aneous
> +other things.
>  .TP
>  .B 8 System management commands
>  Commands like
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
