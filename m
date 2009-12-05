From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: man page bug report hcreate(3) and hcreate_r(3)
Date: Sat, 5 Dec 2009 07:55:39 +0100
Message-ID: <cfd18e0f0912042255w40ff0d39u2b76da5d40651540@mail.gmail.com>
References: <tencent_01E440483D07FECE098E4A65@qq.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=GB2312
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <tencent_01E440483D07FECE098E4A65-9uewiaClKEY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?GB2312?B?sK62+8C8v6e3yA==?= <mailch-9uewiaClKEY@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

2009/11/30 =B0=AE=B6=FB=C0=BC=BF=A7=B7=C8 <mailch-9uewiaClKEY@public.gmane.org>:
> I find two errors in the EXAMPLE section:
>
> e.data =3D (void *) i;
>        //should be
>       e.data =3D (void *) &i;
>
> printf("%9.9s -> %9.9s:%d\n", e.key,
>                       ep ? ep->key : "NULL", ep ? (int)(ep->data) : 0=
);
>      //should be
>     printf("%9.9s -> %9.9s:%d\n", e.key,
>                       ep ? ep->key : "NULL", ep ? *(int*)(ep->data) :=
 0);
>
> They are also in the online man pages
> http://www.kernel.org/doc/man-pages/online/pages/man3/hcreate.3.html
> http://www.kernel.org/doc/man-pages/online/pages/man3/hcreate_r.3.htm=
l

As far as I can see, these changes are not correct. If, after
reviewing, you disagree, could you please explain further.

Thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
