From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for migrate_pages.2
Date: Tue, 19 Oct 2010 12:35:55 +0200
Message-ID: <AANLkTi=a0um9Q_k72aNH2-PyUVC2rw-G6gLSOJE1289M@mail.gmail.com>
References: <20101019142134.4742bc00@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101019142134.4742bc00-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Tue, Oct 19, 2010 at 12:21 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrot=
e:
> Hello.
> --- man-pages-git/man2/migrate_pages.2 =9A2010-07-17 09:02:09.0000000=
00 +0400
> +++ /tmp/migrate_pages.2 =9A =9A =9A =9A2010-10-19 13:36:07.000000000=
 +0400
> @@ -34,7 +34,7 @@
> =9Athat are in memory nodes
> =9A.I old_nodes
> =9Ato the memory nodes in
> -.I new_nodes.
> +.IR new_nodes .
> =9APages not located in any node in
> =9A.I old_nodes
> =9Awill not be migrated.
> @@ -64,7 +64,7 @@
> =9Aas in
> =9A.BR mbind (2),
> =9Abut different from
> -.BR select (2))
> +.BR select (2)).
>
> =9AThe
> =9A.I pid

Thanks. Applied for man-pages-3.29.

Cheers,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
