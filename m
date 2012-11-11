From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: add io_getevents() BUGS
Date: Sun, 11 Nov 2012 09:07:56 +0100
Message-ID: <CAKgNAkio1MMi0V_GwZ=jnnK9gRPt2J8Pd-QEDnSj_ht4eO=0mA@mail.gmail.com>
References: <20110323191425.GA15819@saboteur.suse.cz>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110323191425.GA15819-n1fJoQsqRnsVI8jrpt9EEQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jeff Moyer <jmoyer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Cyril,

On Wed, Mar 23, 2011 at 8:14 PM, Cyril Hrubis <chrubis-AlSwsSmVLrQ@public.gmane.org> wrote:
> Hi!
> The io_getevents() may cause segfault when called with invalid ctx_id.
>
> For reference see: http://marc.info/?l=linux-aio&m=130089887002435&w=2
>
> The attached patch adds BUGS paragraph into corresponding manpage.

I've applied a slightly different version of this patch, as below. Thanks

Cheers,

Michael

PS In general, inline patches are easier tor me to process.

--- a/man2/io_getevents.2
+++ b/man2/io_getevents.2
@@ -92,6 +92,11 @@ then the return value follows the usual conventions for
 indicating an error: \-1, with
 .I errno
 set to a (positive) value that indicates the error.
+.SH BUGS
+An invalid
+.IR ctx_id
+may cause a segmentation fault instead of genenerating the error
+.BR EINVAL .
 .SH "SEE ALSO"
 .PP
 .BR io_cancel (2),



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
