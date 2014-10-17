From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] pow.3: Add note on performance characteristics of pow
Date: Fri, 17 Oct 2014 07:24:38 +0200
Message-ID: <5440A816.8000002@gmail.com>
References: <CAESRpQDx5TfgfRp1q69NiuCB5ve8+fR1NC2up9h5LOkogMKkqQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAESRpQDx5TfgfRp1q69NiuCB5ve8+fR1NC2up9h5LOkogMKkqQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?windows-1252?Q?Manuel_L=F3pez-Ib=E1=F1ez?= <lopezibanez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Manuel,


On 10/17/2014 01:51 AM, Manuel L=F3pez-Ib=E1=F1ez wrote:
> Hello,
>=20
> This patch documents
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D13932 as requested =
in
> https://sourceware.org/bugzilla/show_bug.cgi?id=3D15267. It would be
> nice to add more details, but it seems the behavior and its
> consequences is not well understood. The purpose of the note is to
> warn users of this behavior and thus avoid frustration
> (http://entropymine.com/imageworsener/slowpow/).
>=20
> This is my first patch. I followed (hopefully correctly) the instruct=
ions here:
> https://www.kernel.org/doc/man-pages/patches.html


Thanks for this patch. It looks good. But inline patches are easier to =
review.
One small question below.

> diff --git a/man3/pow.3 b/man3/pow.3
> index d0a2ea8..3d2151a 100644
> --- a/man3/pow.3
> +++ b/man3/pow.3
> @@ -320,6 +320,17 @@ The variant returning
>  also conforms to
>  SVr4, 4.3BSD, C89.
>  .SH BUGS
> +On 64-bits,
> +.\"
> +.\" https://sourceware.org/bugzilla/show_bug.cgi?id=3D13932
> +.BR pow ()
> +may be more than 10,000 times slower for some inputs than for other =
nearby

I plan to change "some" to "some (rare)". Sound okay? The point is not =
to
worry people that this is a problem that is commonly encountered. (Or i=
s it?)

Thanks,

Michael

> +inputs. The inputs that produce such behavior are different for
> +.BR powf (),
> +.BR pow ()
> +and
> +.BR powl ().
> +
>  In glibc 2.9 and earlier,
>  .\"
>  .\" http://sources.redhat.com/bugzilla/show_bug.cgi?id=3D6776


--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
