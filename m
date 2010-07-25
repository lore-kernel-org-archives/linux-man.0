From: =?iso-8859-1?q?L=E9na=EFc_Huard?= <lenaic.huard-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Subject: return type of mqueue functions are wrong
Date: Sun, 25 Jul 2010 11:59:30 +0200
Message-ID: <201007251159.30470.lenaic.huard@laposte.net>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello,

I think I've found a little error in the manpages of the mqueue functio=
ns=20
(mq_close, mq_getattr, mq_setattr, mq_unlink, mq_notify, mq_send and=20
mq_timedsend). In the linux manpages, all these functions are documente=
d as=20
returning an mqd_t whereas in the mqueue.h shipped with the glibc, thes=
e=20
functions are returning an int.

This is not a big matter in Linux where mqd_t is a typedef for int, but=
 the=20
problem is that a programmer worried about the portability of his code =
might=20
be tempted to write things like

  if( mq_getattr( _mqdes, &aMqAttr ) =3D=3D (mqd_t)-1 )
    ...

And this is not portable. (For example, it won't compile on Solaris whe=
re=20
mqd_t is a typedef for void * but where mq_getattr returns an int like =
on=20
Linux.)

If the functions were documented as returning an int, one won't put the=
 cast,=20
and the code would be portable.

Kind regards,
L=E9na=EFc.
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
