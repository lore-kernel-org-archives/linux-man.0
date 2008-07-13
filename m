From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Man-page review request: math_error.7
Date: Sun, 13 Jul 2008 18:23:12 +0200
Message-ID: <487A2BF0.8010808@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

(Math is hard.  Let's go ask Andries.)

Andries (and Fabian),

Long ago, as I was just taking over maintaining man-pages, Fabian noted a
number of defects in the math man pages (see the quoted mail at the end
of this mail).  I've started revisiting some of this after someone else's
recent report caused me to start digging deeper.

I plan to address Fabian's point 4 below by adding the necessary text to
each page, but also adding a cross reference to a new page, math_error.7.
(I'll also check the math pages to see which of the pages still don't
conform to Fabian's points 1, 2, and 3 below.)

Andries, (or perhaps also Fabian), would you be willing to review this
new math_error.7 page, paying special attention to the FIXMEs that it
contains?  I'll forward it in a separate mail.

Cheers,

Michael



-------- Original Message --------
Subject: Re: Math-man-pages
Date: Wed, 3 Nov 2004 20:02:06 +0100
From: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>
To: Michael Kerrisk <mtk-manpages-hi6Y0CQ0nG0@public.gmane.org>
References: <20041102135114.GA15005-czk/hCslx6iEVqv0pETR8A@public.gmane.org> <15785.1099496943-8oEJzNbxIDZmcu3hnIyYJQ@public.gmane.org>

Hi Michael!

[...]

No problem!

I started ~2 month ago to translate the math-manpages to german
(http://www.infodrom.org/projects/manpages-de/).

During that I found some typos and a little bit of chaos. I didn't
intend to debug the english manpages, so I didn't create patches,
but just wrote down the errors that I corrected in the german version.

The list of corrections can be found in the other mail. Maybe you'll
need up to an hour (although I doubt that) to apply them, but believe
me, it took me some more time to find them.

A little discussion happend concerning the question of subjects that
should be written in alle math-pages. Andries preferred the way to
write it into each page, rather than generate a new page math.7,
explaining these facts more generally. The facts are:
   1 Math-functions need to be linked with -lm
   2 Some functions are from the C99-standard. Since gcc runs with
     c89-conformity by default, some functions need -std=c99 or een
     -D_GNU_SOURCE as compile-time argument
   3 rounding and exception handling for floating point numbers are
     done by a system explained in fenv.3
   4 most functions can raise a EDOM or ERANGE exception, which should
     be explained in the ERROR-Section

1) Andries already inserted a "link with -lm" everywhere
2) I gave you a list of functions that need c99 or _GNU_SOURCE
3) I inserted a uniform text at the beginning of the error-section,
    referring to fenv.3
4) I didn't really do that. Eerything else was enough work

The other things are minor errors.

Two last things remain, no maybe three:
  1) The functions in j0.3 are in fact not defined in C99. The Open Group
     does not know the -f and -l variants. But I'm not sure what to do.
     We should ask someone who knows about standards.
  2) I believe that infnan.3 should be deleted
  3) fma.3 and only that page refers to section 3p, which is unknown to me.
     It says something about "FLT_ROUND", which is never explained.

What shall we do about these last three points?

Bye, Fabian



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
man-pages online: http://www.kernel.org/doc/man-pages/online_pages.html
Found a bug? http://www.kernel.org/doc/man-pages/reporting_bugs.html

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
