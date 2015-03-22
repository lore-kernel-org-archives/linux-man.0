From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/5] hier.7: Specifies the optional directories from those
 mentioned.
Date: Sun, 22 Mar 2015 16:51:36 +0100
Message-ID: <550EE508.6080703@gmail.com>
References: <1426374917-11484-1-git-send-email-saulery@free.fr> <1426374917-11484-3-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1426374917-11484-3-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?UTF-8?B?U3TDqXBoYW5lIEF1bGVyeQ==?= <saulery-GANU6spQydw@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/15/2015 12:15 AM, St=C3=A9phane Aulery wrote:
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>

Thanks, St=C3=A9phane. Applied.

By the way, please don't put a period at the end of the patch title.

Cheers,

Michael

> ---
>  man7/hier.7 | 37 ++++++++++++++++++++-----------------
>  1 file changed, 20 insertions(+), 17 deletions(-)
>=20
> diff --git a/man7/hier.7 b/man7/hier.7
> index 70945b1..df98f7e 100644
> --- a/man7/hier.7
> +++ b/man7/hier.7
> @@ -89,7 +89,7 @@ Configuration files for the X11 window system (opti=
onal).
>  On machines with home directories for users, these are usually benea=
th
>  this directory, directly or not.
>  The structure of this directory
> -depends on local administration decisions.
> +depends on local administration decisions (optional).
>  .TP
>  .I /lib
>  This directory should hold those shared libraries that are necessary
> @@ -319,20 +319,21 @@ or
>  .IR /usr/man .
>  .TP
>  .I /usr/share/dict
> -Contains the word lists used by spell checkers.
> +Contains the word lists used by spell checkers (optional).
>  .TP
>  .I /usr/share/doc
> -Documentation about installed programs.
> +Documentation about installed programs (optional).
>  .TP
>  .I /usr/share/games
>  Static data files for games in
> -.IR /usr/games .
> +.I /usr/games
> +(optional).
>  .TP
>  .I /usr/share/info
> -Info pages go here.
> +Info pages go here (optional).
>  .TP
>  .I /usr/share/locale
> -Locale information goes here.
> +Locale information goes here (optional).
>  .TP
>  .I /usr/share/man
>  Manual pages go here in subdirectories according to the man page sec=
tions.
> @@ -348,25 +349,25 @@ Miscellaneous data that can be shared among dif=
ferent architectures of the
>  same OS.
>  .TP
>  .I /usr/share/nls
> -The message catalogs for native language support go here.
> +The message catalogs for native language support go here (optional).
>  .TP
>  .I /usr/share/sgml
> -Files for SGML and XML.
> +Files for SGML and XML (optional).
>  .TP
>  .I /usr/share/terminfo
> -The database for terminfo.
> +The database for terminfo (optional).
>  .TP
>  .I /usr/share/tmac
> -Troff macros that are not distributed with groff.
> +Troff macros that are not distributed with groff (optional).
>  .TP
>  .I /usr/share/zoneinfo
> -Files for timezone information.
> +Files for timezone information (optional).
>  .TP
>  .I /usr/src
>  Source files for different parts of the system, included with some p=
ackages
>  for reference purposes.
>  Don't work here with your own projects, as files
> -below /usr should be read-only except when installing software.
> +below /usr should be read-only except when installing software (opti=
onal).
>  .TP
>  .I /usr/src/linux
>  This was the traditional place for the kernel source.
> @@ -459,21 +460,22 @@ Spooled jobs for
>  .BR cron (8).
>  .TP
>  .I /var/spool/lpd
> -Spooled files for printing.
> +Spooled files for printing (optional).
>  .TP
>  .I /var/spool/mail
>  Replaced by
>  .IR /var/mail .
>  .TP
>  .I /var/spool/mqueue
> -Queued outgoing mail.
> +Queued outgoing mail (optional).
>  .TP
>  .I /var/spool/news
> -Spool directory for news.
> +Spool directory for news (optional).
>  .TP
>  .I /var/spool/rwho
>  Spooled files for
> -.BR rwhod (8).
> +.BR rwhod (8)
> +(optional).
>  .TP
>  .I /var/spool/smail
>  Spooled files for the
> @@ -482,7 +484,8 @@ mail delivery program.
>  .TP
>  .I /var/spool/uucp
>  Spooled files for
> -.BR uucp (1).
> +.BR uucp (1)
> +(optional).
>  .TP
>  .I /var/tmp
>  Like
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
