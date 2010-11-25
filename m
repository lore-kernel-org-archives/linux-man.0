From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: stat(2) off by one
Date: Thu, 25 Nov 2010 06:32:52 +0100
Message-ID: <AANLkTin1-g6vVN3B7UBUzmqwCU7dRVzCQ-5aps70ckd9@mail.gmail.com>
References: <AANLkTim=JUmVVv+kfh-MX4H_zsitAgnOHiooxFRuYBNn@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTim=JUmVVv+kfh-MX4H_zsitAgnOHiooxFRuYBNn-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Emil Mikulic <emikulic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Emil,

On Thu, Nov 25, 2010 at 1:58 AM, Emil Mikulic <emikulic-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrot=
e:
> As seen on http://www.kernel.org/doc/man-pages/online/pages/man2/stat=
=2E2.html:
>
> =A0 =A0 =A0 EOVERFLOW
> =A0 =A0 =A0 =A0 =A0 =A0 =A0(stat()) path refers to a file whose size =
cannot be
> represented in the
> =A0 =A0 =A0 =A0 =A0 =A0 =A0type off_t. =A0This can occur when an appl=
ication compiled
> on a 32-bit
> =A0 =A0 =A0 =A0 =A0 =A0 =A0platform without -D_FILE_OFFSET_BITS=3D64 =
calls stat() on
> a file whose
> =A0 =A0 =A0 =A0 =A0 =A0 =A0size exceeds (2<<31)-1 bits.
>
> I believe 2<<31 should read 1<<31 (which equals 2^31).
>
> I've tested this on an Ubuntu 10.04 system and the largest file I can
> successfully stat [without the #define] is 2147483647 bytes.

Thanks for the report. You are of course right, and I made the change
you suggest for man-[ages-3.32.

Thanks,

Michael




--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
