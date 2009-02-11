From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] ascii(7) fix
Date: Thu, 12 Feb 2009 08:20:01 +1300
Message-ID: <cfd18e0f0902111120x29210768i2ec6eff12076e9f8@mail.gmail.com>
References: <49929CC2.60204@openvz.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <49929CC2.60204-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Lesya Novaselskaya <shams-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hi Kir,

On Wed, Feb 11, 2009 at 10:39 PM, Kir Kolyshkin <kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> wrote:
> Hi Michael,
>
> I just tried to print ascii(7) and found out the tables on the second page
> (compact ascii in hex and dec) are screwed because they do not use
> monospaced font. This is of course can not be seen on the terminal.
>
> Attached patch (against man-pages-3.18) fixes that by adding the proper .fn
> (code copy-pasted from the first table). I checked the result both in the
> terminal and on printer.

Thanks for the patch.  A couple of questions/comments below.

> diff -urN man-pages-3.18/man7/ascii.7 man-pages-3.18-my/man7/ascii.7
> --- man-pages-3.18/man7/ascii.7 2009-02-09 05:14:24.000000000 +0300
> +++ man-pages-3.18-my/man7/ascii.7      2009-02-11 12:34:35.000000000 +0300
> @@ -30,6 +30,7 @@
>  .\" Modified 1999-05-31 by Dimitri Papadopoulos (dpo-fBIn7JHAfCbUKx/7vDf7Bw@public.gmane.org)
>  .\" Modified 1999-08-08 by Michael Haardt (michael-8s1n8bisGiQ@public.gmane.org)
>  .\" Modified 2004-04-01 by aeb
> +.\" Modified 2009-02-11 by Kir Kolyshkin (kir-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org)

Nowadays, the in page change log usually only gets updated if there's
some major change to content.  Otherwise, it's all recorded in the git
changelog.  So I removed this line.

>  .\"
>  .TH ASCII 7 2009-02-04 "Linux" "Linux Programmer's Manual"
>  .SH NAME
> @@ -113,7 +114,7 @@
>  072    58      3A      :       172     122     7A      z
>  073    59      3B      ;       173     123     7B      {
>  074    60      3C      <       174     124     7C      |
> -075    61      3D      =       175     125     7D      }
> +075    61      3Di     =       175     125     7D      }

This piece looks to be a typo on your part?  I removed that piece of the change.

>  076    62      3E      >       176     126     7E      ~
>  077    63      3F      ?       177     127     7F      DEL
>  .TE
> @@ -125,6 +126,10 @@
>  For convenience, let us give more compact tables in hex and decimal.
>  .sp
>  .nf
> +.if t \{\
> +.in 1i
> +.ft CW
> +\}
>    2 3 4 5 6 7       30 40 50 60 70 80 90 100 110 120
>  -------------      ---------------------------------
>  0:   0 @ P \` p     0:    (  2  <  F  P  Z  d   n   x
> @@ -143,6 +148,10 @@
>  D: \- = M ] m }
>  E: . > N ^ n ~
>  F: / ? O _ o DEL
> +.if t \{\
> +.in
> +.ft P
> +\}
>  .fi
>  .SH NOTES
>  .SS History

Other than the points noted above, I have applied the patch for man-pages-3.19.

Cheers,

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
