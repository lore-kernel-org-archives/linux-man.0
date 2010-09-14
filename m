From: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Subject: Re: Recently, the atanh implementation was changed, but the man seems not changed yet
Date: Tue, 14 Sep 2010 10:14:53 +0900 (JST)
Message-ID: <20100914100715.C984.A69D9226@jp.fujitsu.com>
References: <20100218115807.733E.A69D9226@jp.fujitsu.com> <AANLkTimrtXabyGQp6G+8NOeDr3+G_PcpCUPB1YnFv8Ed@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimrtXabyGQp6G+8NOeDr3+G_PcpCUPB1YnFv8Ed-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

> > ---------------------------------------------------------
> > 2009-04-26 =A0Ulrich Drepper =A0<drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> >
> > =A0 =A0 =A0 =A0* sysdeps/ieee754/dbl-64/s_expm1.c: Set errno for ov=
erflow.
> > =A0 =A0 =A0 =A0* sysdeps/ieee754/flt-32/s_expm1f.c: Likewise.
> > =A0 =A0 =A0 =A0* sysdeps/x86_64/fpu/s_expm1l.S: Likewise.
> >
> > =A0 =A0 =A0 =A0* sysdeps/ieee754/k_standard.c (__kernel_standard): =
Pole errors in
> > =A0 =A0 =A0 =A0atanh should set ERANGE.
>=20
> Thanks for your detailed report. I applied the following change for
> man-pages-2.37.
>
> --- a/man3/atanh.3
> +++ b/man3/atanh.3
> @@ -129,16 +129,16 @@ The variant returning
>  also conforms to
>  SVr4, 4.3BSD, C89.
>  .SH BUGS
> -For a pole error,
> -.\"
> -.\" FIXME . this is as at glibc 2.8; check later if this bug is fixe=
d
> +In glibc 2.9 and earlier,
> +.\" Bug: http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D6759
>  .\" This can be seen in sysdeps/ieee754/k_standard.c
> -.\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D=
6759
> +when a pole error occurs,
>  .I errno
> -is set to
> -.BR EDOM ;
> -POSIX.1 says it should be set to
> +as set to
> +.BR EDOM
> +instead of the POSIX-mandated
>  .BR ERANGE .
> +Since version 2.10, glibc does the right thing.
>  .SH "SEE ALSO"
>  .BR acosh (3),
>  .BR asinh (3),

Great! This looks goo to me :)

Thanks.




--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
