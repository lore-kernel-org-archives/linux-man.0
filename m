From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] various typos
Date: Mon, 29 Sep 2008 14:21:40 +0200
Message-ID: <cfd18e0f0809290521w155942e8h5c6ee99f3b36ac1e@mail.gmail.com>
References: <20080928163529.GA7009@nekral.nekral.homelinux.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20080928163529.GA7009-pDMkYksm/NDBVznEOA0nCqMXiC8k1aZu0e7PPNI6Mm0@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Nicolas_Fran=E7ois?= <nicolas.francois-Fa7rcPG4DJn7nK0/Xc0eeg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Nicolas,

> Please find attached a patch against 3.10 that fix some typos (but also
> contains some proposals).

Thanks for your patch.

However, I have to ask, would you as the upstream maintainer of a
project (as I believe you are for a few) like to receive a single
patch like this, which

* piles a group of unrelated changes into a single patch (it would
have been okay
to put all of the typo and wordo fixes into one patch, but you
included several other things besides)
* provides a single line of vague explanation that gives no assistance
with the non-trivial parts of the patch

?

Providing a patch like this may make life easier for you, but it
certainly doesn't make life easier for me.  I have to:

* pull it to pieces, in order to assess whether each of the
non-trivial parts are correct,
* assess (or fail to assess) the intentions behind your non-trivial patches, and
* then write individual change log entries for the parts that I commit.

Your monolithic patch resulted in 16 separate commits...

But, anyway, thanks: almost everything you sent was correct AFAICS and
has been applied.  Thanks for catching so many things!  Comments on a
few pieces:

===

> diff -rauN ../man-pages-3.10.orig/man3/atan2.3 ./man3/atan2.3
> --- ../man-pages-3.10.orig/man3/atan2.3       2008-09-23 15:52:29.000000000 +0200
> +++ ./man3/atan2.3    2008-09-28 17:39:19.204893061 +0200
> @@ -65,7 +65,7 @@
> .SH "RETURN VALUE"
> On success, these functions return the principal value of the arc tangent of
> .IR y/x
> -in radians; the return value is in the range [\-pi/2,\ pi/2].
> +in radians; the return value is in the range [\-pi,\ pi].

Thanks for catching that!  It must have been a cut-and-paste error on my
part during the wide-ranging 3.06 changes to math pages, I think.

> diff -rauN ../man-pages-3.10.orig/man3/floor.3 ./man3/floor.3
> --- ../man-pages-3.10.orig/man3/floor.3       2008-09-23 15:52:33.000000000 +0200
> +++ ./man3/floor.3    2008-09-28 17:46:25.180882020 +0200
> @@ -50,7 +50,7 @@
>  .I cc\ -std=c99
>  .ad b
>  .SH DESCRIPTION
> -These functions return the smallest integral value that is not greater than
> +These functions return the greatest integral value that is not greater than

Thanks.  Another error I injected.  I made it "largest".

> --- ../man-pages-3.10.orig/man3/fma.3 2008-09-23 15:52:33.000000000 +0200
> +++ ./man3/fma.3      2008-09-28 17:48:35.976873034 +0200
> @@ -62,6 +62,8 @@
>  a domain error occurs,
>  and a NaN is returned.
>
> +.\" The following 2 paragraphs could be merged (z being a NaN or not is
> +.\" not relevant)

Here's some text from the commit that I made against this page (which
didn't change the content, just added some source comments):

[[
Two of the "domain error" cases described on this page are treated in
the same way on Linux, but POSIX.1 specifies some optional differences
for the two cases.  Make life easier for future page reviewers/editors
by adding some comments explaining that POSIX.1-2001 distinguishes
the two cases.
]]

(I want to maintain the existing text structure to mirror the cases
described in the POSIX.1 text.)

> diff -rauN ../man-pages-3.10.orig/man3/matherr.3 ./man3/matherr.3
> --- ../man-pages-3.10.orig/man3/matherr.3     2008-09-23 15:52:37.000000000 +0200
> +++ ./man3/matherr.3  2008-09-28 17:53:30.865312828 +0200
> @@ -112,6 +112,7 @@
>  In most cases,
>  .I errno
>  is set to
> +.\" In case of a pole error, isn't it ERANGE?
>  .BR EDOM .
> .TP
> .B OVERFLOW

You might expect so, but take a look at the "SING" cases in glibc's
sysdeps/ieee754/k_standard.c: it's all a horrible mess of inconsistencies
(I suppose for historical reasons).
> diff -rauN ../man-pages-3.10.orig/man3/nextafter.3 ./man3/nextafter.3
> --- ../man-pages-3.10.orig/man3/nextafter.3   2008-09-23 15:52:38.000000000 +0200
> +++ ./man3/nextafter.3        2008-09-28 17:55:07.774838202 +0200
> @@ -56,7 +56,7 @@
>  .I y
>  is less than
>  .IR x ,
> -these functions will return the next representable number less than
> +these functions will return the greatest representable number less than

Thanks.  Again, I made this "largest".

> --- ../man-pages-3.10.orig/man7/udplite.7     2008-09-23 15:52:46.000000000 +0200
> +++ ./man7/udplite.7  2008-09-28 18:24:33.840872902 +0200
> @@ -94,7 +94,7 @@
>  .BR getsockopt (2).
>
>  When the value of
>  .B UDPLITE_RECV_CSCOV
> -exceeds the actual packet coverage, incoming packets are silently dropped,
> +exceeds the actual packet coverage, the incoming packet is silently dropped,

The existing text is grammatically correct.  Were you meaning there was
some other sort of error?

===

The changes will be in 3.11 and are visible now via git.

I'll be very happy to get more patches from you in the future, but
please could you do a bit more work on the pieces to make things
easier for me next time.  (And, please send patches inline.  It makes
review easier.)

Thanks,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
git://git.kernel.org/pub/scm/docs/man-pages/man-pages.git
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
