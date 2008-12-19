From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] printf.3: Add a note about sprintf(s, "%s", s)
Date: Fri, 19 Dec 2008 11:57:05 -0500
Message-ID: <cfd18e0f0812190857k187ca48ct9ee6da3b0c5a9e06@mail.gmail.com>
References: <20081207233721.GN10491@machine.or.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081207233721.GN10491-DDGJ70k9y3lX+M3pkMnKjw@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Petr,

On Sun, Dec 7, 2008 at 6:37 PM, Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org> wrote:
> The result of this operation is undefined as specified in C99, see
>
>        http://sourceware.org/bugzilla/show_bug.cgi?id=7075
>
> Signed-off-by: Petr Baudis <pasky-AlSwsSmVLrQ@public.gmane.org>
>
> diff --git a/man3/printf.3 b/man3/printf.3
> index b2ed86a..f8377a7 100644
> --- a/man3/printf.3
> +++ b/man3/printf.3
> @@ -750,6 +750,9 @@ or
>  The array must contain a terminating null wide character, unless a
>  precision is given and it is so small that the number of bytes written
>  exceeds it before the end of the array is reached.
> +
> +If the source array and the target buffer of the function overlap,
> +results are undefined.
>  .TP
>  .B C
>  (Not in C99, but in SUSv2.)

Thanks for the report.

I agree that there's a problem with the page, but I don't think this
patch is sufficient, nor does is it made in quite the right place.
(This isn't a point that relates specifically to "%s", but rather to
the *s*printf() functions.)

I made a much bigger change that goes into more detail.  The patch,
destined for 3.16, is shown below.  Does it look okay to you?

Cheers,

Michael

--- a/man3/printf.3
+++ b/man3/printf.3
@@ -133,6 +133,17 @@ string that specifies how subsequent arguments
(or arguments accessed via
 the variable-length argument facilities of
 .BR stdarg (3))
 are converted for output.
+
+C99 and POSIX.1-2001 specify that the results are undefined if a call to
+.BR sprintf (),
+.BR snprintf (),
+.BR vsprintf (),
+or
+.BR vsnprintf ()
+would cause to copying to take place between objects that overlap
+(e.g., if the target string array and one of the supplied input arguments
+refer to the same buffer).
+See NOTES.
 .SS "Return value"
 Upon successful return, these functions return the number of characters
 printed (not including the
@@ -851,6 +862,26 @@ and conversion characters \fBa\fP and \fBA\fP.
 glibc 2.2 adds the conversion character \fBF\fP with C99 semantics,
 and the flag character \fBI\fP.
 .SH NOTES
+Some programs imprudently rely on code such as the following
+
+    sprintf(buf, "%s some further text", buf);
+
+to append text to
+.IR buf .
+However, the standards explicitly note that the results are undefined
+if source and destination buffers overlap when calling
+.BR sprintf (),
+.BR snprintf (),
+.BR vsprintf (),
+and
+.BR vsnprintf ().
+.\" http://sourceware.org/bugzilla/show_bug.cgi?id=7075
+Depending on the version of
+.BR gcc (1)
+used, and the compiler options employed, calls such as the above will
+.B not
+produce the expected results.
+
 The glibc implementation of the functions
 .BR snprintf ()
 and
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
