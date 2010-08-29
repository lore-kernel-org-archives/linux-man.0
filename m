From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: return type of mqueue functions are wrong
Date: Sun, 29 Aug 2010 07:29:19 +0200
Message-ID: <AANLkTim=YvAy1fZwR0Rv5L53OBEpTXZ_S7owU7_mUpvh@mail.gmail.com>
References: <201007251159.30470.lenaic.huard@laposte.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201007251159.30470.lenaic.huard-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?B?TOluYe9jIEh1YXJk?= <lenaic.huard-QFKgK+z4sOrR7s880joybQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello  L=E9na=EFc

On Sun, Jul 25, 2010 at 11:59 AM, L=E9na=EFc Huard <lenaic.huard@lapost=
e.net> wrote:
> Hello,
>
> I think I've found a little error in the manpages of the mqueue funct=
ions
> (mq_close, mq_getattr, mq_setattr, mq_unlink, mq_notify, mq_send and
> mq_timedsend). In the linux manpages, all these functions are documen=
ted as
> returning an mqd_t whereas in the mqueue.h shipped with the glibc, th=
ese
> functions are returning an int.
>
> This is not a big matter in Linux where mqd_t is a typedef for int, b=
ut the
> problem is that a programmer worried about the portability of his cod=
e might
> be tempted to write things like
>
> =A0if( mq_getattr( _mqdes, &aMqAttr ) =3D=3D (mqd_t)-1 )
> =A0 =A0...
>
> And this is not portable. (For example, it won't compile on Solaris w=
here
> mqd_t is a typedef for void * but where mq_getattr returns an int lik=
e on
> Linux.)
>
> If the functions were documented as returning an int, one won't put t=
he cast,
> and the code would be portable.

(Thanks for the careful explanation!) Of course, you are correct. I've
fixed all of these pages for release 3.26.

thanks,

Michael


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface" http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
