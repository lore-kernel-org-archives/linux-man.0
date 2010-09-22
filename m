From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for lookup_dcookie.2
Date: Wed, 22 Sep 2010 15:46:00 +0200
Message-ID: <AANLkTimRegZGfO0vNdzdaYzvZDnOp7=C7ageagsv0UY7@mail.gmail.com>
References: <20100919220147.01103e22@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100919220147.01103e22-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Sep 19, 2010 at 8:01 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote=
:
> Hello.
>
> --- man-pages-git/man2/lookup_dcookie.2 2010-03-26 17:46:41.000000000=
 +0300
> +++ /tmp/lookup_dcookie.2 =9A =9A =9A 2010-09-19 22:00:02.000000000 +=
0400
> @@ -31,8 +31,7 @@
> =9A.BI "int lookup_dcookie(u64 " cookie ", char *" buffer ", size_t "=
 len );
> =9A.SH DESCRIPTION
> =9ALook up the full path of the directory entry specified by the valu=
e
> -.I cookie
> -.
> +.IR cookie .
> =9AThe cookie is an opaque identifier uniquely identifying a particul=
ar
> =9Adirectory entry.
> =9AThe buffer given is filled in with the full path of the directory =
entry.

Thanks Yuri. Fixed for 3.27.

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
