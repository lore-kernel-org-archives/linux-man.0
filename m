From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: Addition to memcmp(3)
Date: Tue, 30 Dec 2014 22:13:14 +0100
Message-ID: <CAKgNAkjb4Kp+KmYj1uL9qXSJBj0JKWz8G0+eyD6UFJKFbGGPzQ@mail.gmail.com>
References: <E1XqHLn-00041P-MO@fangorn.moria.de>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <E1XqHLn-00041P-MO-zeUDcrRnZRzyzWfxuKwaJA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org>
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Michael,

On Mon, Nov 17, 2014 at 9:07 AM, Michael Haardt <michael-8s1n8bisGiQ@public.gmane.org> wrote:
> Hello,
>
> memcmp(3) does not document the return value for length 0 and the
> CPU time depending on the number of compared bytes.  While both
> is obvious, it should still be documented.

Thanks for this patch. I applied, but see notes below.

Note 1: this patch covers two unrelated points, so I manually split it.

> --- memcmp.3.orig       2014-11-17 08:53:53.848805576 +0100
> +++ memcmp.3    2014-11-17 08:58:39.699005856 +0100
> @@ -27,6 +27,7 @@
>  .\"     Lewine's _POSIX Programmer's Guide_ (O'Reilly & Associates, 1991)
>  .\"     386BSD man pages
>  .\" Modified Sat Jul 24 18:55:27 1993 by Rik Faith (faith-+5Oa3zvhR2o3uPMLIKxrzw@public.gmane.org)
> +.\" Modified Mon Nov 17 07:45:13 2014 by Michael Haardt (michael-8s1n8bisGiQ@public.gmane.org)
>  .TH MEMCMP 3  2014-03-14 "" "Linux Programmer's Manual"
>  .SH NAME
>  memcmp \- compare memory areas
> @@ -42,6 +43,11 @@
>  function compares the first \fIn\fP bytes (each interpreted as
>  .IR "unsigned char" )
>  of the memory areas \fIs1\fP and \fIs2\fP.
> +.PP
> +Do not use
> +.BR memcmp ()
> +to compare security critical data, such as cryptographic secrets,
> +because the required CPU time depends on the amount of equal bytes.

I placed this piece in a new NOTES section.

Some text here about what one should do instead of using memcmp()
might be helpful. Do you have any suggestions?

>  .SH RETURN VALUE
>  The
>  .BR memcmp ()
> @@ -57,6 +63,8 @@
>  .I s1
>  and
>  .IR s2 .
> +.PP
> +If \fIn\fP is zero, the return value is zero.

Good call to add this piece Thanks.

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
