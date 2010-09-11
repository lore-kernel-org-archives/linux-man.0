From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Recently, the atanh implementation was changed, but the man seems
 not changed yet
Date: Sat, 11 Sep 2010 08:52:49 +0200
Message-ID: <AANLkTimrtXabyGQp6G+8NOeDr3+G_PcpCUPB1YnFv8Ed@mail.gmail.com>
References: <20100218115807.733E.A69D9226@jp.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100218115807.733E.A69D9226-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: KOSAKI Motohiro <kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Motohiro,

On Thu, Feb 18, 2010 at 5:19 AM, KOSAKI Motohiro
<kosaki.motohiro-+CUm20s59erQFUHtdCDX3A@public.gmane.org> wrote:
> Hi Michael,
>
> I recently found little mismatch between the impmentation and the man=
 in
> atanh function.
>
> current man page says
> http://www.kernel.org/doc/man-pages/online/pages/man3/atanh.3.html
>
> ---------------------------------------------------------
> BUGS
> =A0 =A0 =A0 For a pole error, errno is set to EDOM; POSIX.1 says it s=
hould be set to
> =A0 =A0 =A0 ERANGE.
> ---------------------------------------------------------
>
> but following test programs "34: Numerical result out of range".
> It mean atanh return ERANGE rightly.
>
>
> atanh_test.c
> ---------------------------------------------------------
> #include <math.h>
> #include <stdio.h>
> #include <sys/errno.h>
> #include <string.h>
>
> int main(void)
> {
> =A0 =A0 =A0 =A0double d;
>
> =A0 =A0 =A0 =A0d =3D atanh(1.0);
> =A0 =A0 =A0 =A0if (d =3D=3D HUGE_VAL)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("huge %d: %s\n", errno, strerro=
r(errno));
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printf("Oops no error\n");
>
> =A0 =A0 =A0 =A0return 0;
> }
> ---------------------------------------------------------
>
>
> I dug in glibc's ChangeLog and I found following change.
> So, can we consider to change the man too?
>
>
> ---------------------------------------------------------
> 2009-04-26 =A0Ulrich Drepper =A0<drepper-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
>
> =A0 =A0 =A0 =A0* sysdeps/ieee754/dbl-64/s_expm1.c: Set errno for over=
flow.
> =A0 =A0 =A0 =A0* sysdeps/ieee754/flt-32/s_expm1f.c: Likewise.
> =A0 =A0 =A0 =A0* sysdeps/x86_64/fpu/s_expm1l.S: Likewise.
>
> =A0 =A0 =A0 =A0* sysdeps/ieee754/k_standard.c (__kernel_standard): Po=
le errors in
> =A0 =A0 =A0 =A0atanh should set ERANGE.

Thanks for your detailed report. I applied the following change for
man-pages-2.37.

Cheers,

Michael


--- a/man3/atanh.3
+++ b/man3/atanh.3
@@ -129,16 +129,16 @@ The variant returning
 also conforms to
 SVr4, 4.3BSD, C89.
 .SH BUGS
-For a pole error,
-.\"
-.\" FIXME . this is as at glibc 2.8; check later if this bug is fixed
+In glibc 2.9 and earlier,
+.\" Bug: http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D6759
 .\" This can be seen in sysdeps/ieee754/k_standard.c
-.\" Bug raised: http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D6=
759
+when a pole error occurs,
 .I errno
-is set to
-.BR EDOM ;
-POSIX.1 says it should be set to
+as set to
+.BR EDOM
+instead of the POSIX-mandated
 .BR ERANGE .
+Since version 2.10, glibc does the right thing.
 .SH "SEE ALSO"
 .BR acosh (3),
 .BR asinh (3),




--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
