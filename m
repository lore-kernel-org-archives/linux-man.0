From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: function cerf in manpage but not in <complex.h>
Date: Sun, 12 Sep 2010 08:53:25 +0200
Message-ID: <AANLkTi=gfsUWbHD1_vyN9sHu1U4RdtYjiVxYpQUs6za4@mail.gmail.com>
References: <b7b0d7b84ae39fc2c80b7efd5d04965a.squirrel@webmail-lpp.polytechnique.fr>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <b7b0d7b84ae39fc2c80b7efd5d04965a.squirrel-n3SY6/QrmYW9yqgUSJdT8BzNKWocxUEg/fObgANad5s@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: ozgur.gurcan-vcqoFEiXU/AczSlqHMVBIP3zm4ADWneb@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ozgur,

On Sun, Sep 12, 2010 at 12:06 AM,  <ozgur.gurcan-vcqoFEiXU/AczSlqHMVBIP3zm4ADWneb@public.gmane.org> wrote:
> Hi,
>
> in my system (2.6.34-gentoo-r2), "man cerf" gives me the description of a
> certain complex error function. This function however is nowhere to be
> found. I tried this on 5 other linux boxes with the same result.
>
> May be the function was taken out at some point but the documentation stayed.

Further down in the page is the line

==
.SH AVAILABILITY
Not yet in glibc, as at version 2.12.
==

I suppose you missed that, which is easy to do. I tweaked the page
(for man-pages-3.27) as below, to try to make it a little clearer.

Cheers,

Michael

--- a/man3/cerf.3
+++ b/man3/cerf.3
@@ -21,7 +21,7 @@ cerf, cerff, cerfl, cerfc, cerfcf, cerfcl \- complex
error function
 .sp
 Link with \fI\-lm\fP.
 .SH DESCRIPTION
-The function
+The (unimplemented) function
 .BR cerf ()
 is the complex version of the error function.
 erf(z) = 2/sqrt(pi) * integral from 0 to z of exp(\-t*t) dt.
@@ -32,7 +32,7 @@ is defined as cerfc(z) = 1\-cerf(z).
 .SH "CONFORMING TO"
 The function names are reserved for future use in C99.
 .SH AVAILABILITY
-Not yet in glibc, as at version 2.8.
+Not yet in glibc, as at version 2.12.
 .\" But reserved in NAMESPACE.
 .SH "SEE ALSO"
 .BR erf (3),
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
