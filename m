From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] console_codes(4): Add ESC [ 3 J
Date: Wed, 14 Sep 2011 08:51:51 +0200
Message-ID: <CAKgNAkjiMtfAyTD5=5gz_Q1rpG7hikg_1o_L+FQo7GsfiSyhKw@mail.gmail.com>
References: <1303479685-12475-1-git-send-email-ppisar@redhat.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1303479685-12475-1-git-send-email-ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-2?Q?Petr_P=EDsa=F8?= <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Petr,

2011/4/22 Petr P=C3=ADsa=C5=99 <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>:
> Linux is going
> (http://git.kernel.org/?p=3Dlinux/kernel/git/next/linux-next.git;a=3D=
commit;h=3Df8df13e0a901fe55631fed66562369b4dba40f8b)
> to implement \E[3J to allow scrambling content of console including
> scroll-back buffer (http://thread.gmane.org/gmane.linux.kernel/112579=
2).

In which kernel version was this patch applied?

Cheers,

Michael


> This is useful at terminal lock to disallow attacker to scroll visibl=
e
> window back and to see sensitive data. Other \E[J sequences do not
> blank history. Terminal reset (\Ec) or DECSRC are not suitable for
> extension too beacuse they reset font, keyboard locks, unicode mode
> etc. that are needed after unlocking session.
>
> \E[3J is superset of \E[2J. IOW it clears visible screen too.
>
> Signed-off-by: Petr P=C3=ADsa=C5=99 <ppisar-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> ---
> =C2=A0man4/console_codes.4 | =C2=A0 =C2=A02 ++
> =C2=A01 files changed, 2 insertions(+), 0 deletions(-)
>
> diff --git a/man4/console_codes.4 b/man4/console_codes.4
> index 2a806b7..62f2247 100644
> --- a/man4/console_codes.4
> +++ b/man4/console_codes.4
> @@ -188,6 +188,8 @@ H =C2=A0 CUP =C2=A0 =C2=A0 Move cursor to the ind=
icated row, column (origin at 1,1).
> =C2=A0J =C2=A0 =C2=A0 =C2=A0ED =C2=A0 =C2=A0 =C2=A0Erase display (def=
ault: from cursor to end of display).
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 1 J: era=
se from start to cursor.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 2 J: era=
se whole display.
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ESC [ 3 J: erase w=
hole display including scroll-back
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buffer.
> =C2=A0K =C2=A0 =C2=A0 =C2=A0EL =C2=A0 =C2=A0 =C2=A0Erase line (defaul=
t: from cursor to end of line).
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 1 K: era=
se from start of line to cursor.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ESC [ 2 K: era=
se whole line.
> --
> 1.7.4.4
>
>



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
