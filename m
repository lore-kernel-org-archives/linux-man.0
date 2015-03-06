From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/6] intro.1: ffix
Date: Fri, 06 Mar 2015 14:46:36 +0100
Message-ID: <54F9AFBC.5080905@gmail.com>
References: <1425646053-7294-1-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425646053-7294-1-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:47 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> User input in bold
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man1/intro.1 | 30 +++++++++++++++---------------
>  1 file changed, 15 insertions(+), 15 deletions(-)
>=20
> diff --git a/man1/intro.1 b/man1/intro.1
> index 20d36d7..c554884 100644
> --- a/man1/intro.1
> +++ b/man1/intro.1
> @@ -93,11 +93,11 @@ A session might go like
> =20
>  .RS
>  .nf
> -.BI "knuth login: " aeb
> -.BI "Password: " ********
> -.BI "% " date
> +.RB "knuth login: " aeb
> +.RB "Password: " ********
> +.RB "% " date
>  Tue Aug  6 23:50:44 CEST 2002
> -.BI "% " cal
> +.RB "% " cal
>       August 2002
>  Su Mo Tu We Th Fr Sa
>               1  2  3
> @@ -106,32 +106,32 @@ Su Mo Tu We Th Fr Sa
>  18 19 20 21 22 23 24
>  25 26 27 28 29 30 31
> =20
> -.BI "% " ls
> +.RB "% " ls
>  bin  tel
> -.BI "% " "ls \-l"
> +.RB "% " "ls \-l"
>  total 2
>  drwxrwxr\-x   2 aeb       1024 Aug  6 23:51 bin
>  \-rw\-rw\-r\-\-   1 aeb         37 Aug  6 23:52 tel
> -.BI "% " "cat tel"
> +.RB "% " "cat tel"
>  maja    0501\-1136285
>  peter   0136\-7399214
> -.BI "% " "cp tel tel2"
> -.BI "% " "ls \-l"
> +.RB "% " "cp tel tel2"
> +.RB "% " "ls \-l"
>  total 3
>  drwxr\-xr\-x   2 aeb       1024 Aug  6 23:51 bin
>  \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:52 tel
>  \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:53 tel2
> -.BI "% " "mv tel tel1"
> -.BI "% " "ls \-l"
> +.RB "% " "mv tel tel1"
> +.RB "% " "ls \-l"
>  total 3
>  drwxr\-xr\-x   2 aeb       1024 Aug  6 23:51 bin
>  \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:52 tel1
>  \-rw\-r\-\-r\-\-   1 aeb         37 Aug  6 23:53 tel2
> -.BI "% " "diff tel1 tel2"
> -.BI "% " "rm tel1"
> -.BI "% " "grep maja tel2"
> +.RB "% " "diff tel1 tel2"
> +.RB "% " "rm tel1"
> +.RB "% " "grep maja tel2"
>  maja    0501\-1136285
> -.B "% "
> +%
>  .fi
>  .RE
>  and here typing Control-D ended the session.
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
