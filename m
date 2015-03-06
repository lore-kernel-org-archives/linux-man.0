From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 5/6] intro.1: ffix
Date: Fri, 06 Mar 2015 14:48:59 +0100
Message-ID: <54F9B04B.9070907@gmail.com>
References: <1425646053-7294-1-git-send-email-saulery@free.fr> <1425646053-7294-5-git-send-email-saulery@free.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1425646053-7294-5-git-send-email-saulery-GANU6spQydw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: saulery-GANU6spQydw@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 03/06/2015 01:47 PM, saulery-GANU6spQydw@public.gmane.org wrote:
> From: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>


Thanks, St=C3=A9phane. Applied.

Cheers,

Michael


> Highlighting like other commands (2)
>=20
> Signed-off-by: St=C3=A9phane Aulery <saulery-GANU6spQydw@public.gmane.org>
> ---
>  man1/intro.1 | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/man1/intro.1 b/man1/intro.1
> index 3a29ff8..a87a336 100644
> --- a/man1/intro.1
> +++ b/man1/intro.1
> @@ -281,7 +281,10 @@ There are thousands of commands, each with many =
options.
>  Traditionally commands are documented on
>  .IR "man pages" ,
>  (like this one), so that the command "man kill" will document
> -the use of the command "kill" (and "man man" document the command "m=
an").
> +the use of the command
> +.I kill
> +(and "man man" document the command
> +.IR man ).
>  The program
>  .I man
>  sends the text through some
>=20


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
