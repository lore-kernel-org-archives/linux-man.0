From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH] syslog: document new return values
Date: Thu, 14 Feb 2008 19:54:14 +0100
Message-ID: <47B48E56.20001@gmail.com>
References: <1202863033.777067.227449740820.qpush@pokey>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202863033.777067.227449740820.qpush@pokey>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Jeremy Kerr wrote:
> .. also, add entries for type==9 and type==10 to the RETURN VALUES
> section.
> 
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> 
> ---
> 
>  man2/syslog.2 |    7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> Index: man-pages-2.77/man2/syslog.2
> ===================================================================
> --- man-pages-2.77.orig/man2/syslog.2
> +++ man-pages-2.77/man2/syslog.2
> @@ -195,7 +195,12 @@ Otherwise,
>  for \fItype\fP equal to 2, 3 or 4,
>  .BR syslog ()
>  returns the number
> -of bytes read, and otherwise 0.
> +of bytes read,
> +for \fItype\fP equal to 9,
> +the number of number of unread characters in the log buffer,
> +for \fItype\fP equal to 10,
> +the total size of the log buffer,
> +and otherwise 0.
>  .SH ERRORS
>  .TP
>  .B EINVAL

Hi Jeremy,

Thanks.  I applied something like this (did a little reworking of that
section) for man-pages-2.79.

Cheers,

Michael

 .SH "RETURN VALUE"
-In case of error, \-1 is returned, and \fIerrno\fP is set.
-Otherwise,
-for \fItype\fP equal to 2, 3 or 4,
+For \fItype\fP equal to 2, 3, or 4, a successful call to
 .BR syslog ()
 returns the number
-of bytes read, and otherwise 0.
+of bytes read.
+For \fItype\fP 9,
+.BR syslog ()
+returns the number of bytes currently
+available to be read on the kernel log buffer.
+For \fItype\fP 10,
+.BR syslog ()
+returns the total size  of  the  kernel log buffer.
+For other values of \fItype\fP, 0 is returned on success.
+
+In case of error, \-1 is returned,
+and \fIerrno\fP is set to indicate the error.


-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
