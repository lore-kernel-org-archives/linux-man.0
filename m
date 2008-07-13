From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Example of changes to math function page (log.3)
Date: Sun, 13 Jul 2008 18:25:05 +0200
Message-ID: <487A2C61.1080108@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andries Brouwer <Andries.Brouwer-rh8NL+sEX9E@public.gmane.org>
Cc: Fabian Kreutz <kreutz-WMH0Fc3rTAP1qYPpFx2fzhvVK+yQ3ZXh@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Andries, (and Fabian, et al.)

Just by way of background, below are the kinds of changes I plan to
make to the math pages to address:

a) The poor discussion of return values for various special cases (Nan, +/-Inf).

b) The need to tell the programmer how to detect errrors (addressed
    by referring them to math-error.7).

The example here is the changed text for log.3.

Does this seem like a reasonable approach?

Cheers,

Michael


+.SH RETURN VALUE
+On success, these functions return the natural logarithm of
+.IR x .
+
+If
+.I x
+is a NaN, then a NaN is returned.
+
+If
+.I x
+is the representation of positive infinity, then
+.I x
+is returned.
+
+If
+.I x
+is zero, a "pole error" occurs, and the functions
+return
+.RB - HUGEVAL ,
+.RB - HUGEVALF ,
+or
+.RB - HUGEVALL ,
+respectively.
+
+If
+.I x
+is negative
+(including the representation of negative infinity)
+a "domain error" occurs, and a NaN (not a number) is returned.
  .SH ERRORS
+See
+.BR math_error (7)
+for information on how to determine whether an error has occurred
+when calling these functions.
+.PP
+.I errno
+may be set to the following values:


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
