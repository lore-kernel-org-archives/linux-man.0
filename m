From: "Michael Kerrisk" <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: stat(2) can return EOVERFLOW
Date: Thu, 4 Dec 2008 13:52:12 -0500
Message-ID: <cfd18e0f0812041052v113510bbg389e8167758d1947@mail.gmail.com>
References: <20081204155355.GI16402@aym.net2.nerim.net>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20081204155355.GI16402-956IwFboN44acnK+F/IuxqxOck334EZe@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org>
Cc: "linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

[CC += linux-man@]

Hi Andre,

Thanks for the bug report.

On Thu, Dec 4, 2008 at 10:53 AM, Andre Majorel <aym-xunil-Bi/FLWfhfolQFI55V6+gNQ@public.gmane.org> wrote:
> Michael,
>
> On my system, stat(2) can return EOVERFLOW when stat'ing a file
> larger than 4 (or 2 ?) GB.

2!

> The ERRORS section of stat(2) does not
> mention EOVERFLOW.

I made the change below, for man-pages-3.15.

Thanks,

Michael

--- a/man2/stat.2
+++ b/man2/stat.2
@@ -319,6 +319,19 @@ Out of memory (i.e., kernel memory).
 .TP
 .B ENOTDIR
 A component of the path is not a directory.
+.TP
+.B EOVERFLOW
+.RB ( stat ())
+.I path
+refers to a file whose size cannot be represented in the type
+.IR off_t .
+This can occur when an application compiled on a 32-bit platform without
+.I -D_FILE_OFF_SET_BITS=64
+calls
+.BR stat ()
+on a file whose size exceeds
+.I (2<<31)-1
+bits.
 .SH "CONFORMING TO"
 These system calls conform to SVr4, 4.3BSD, POSIX.1-2001.
 .\" SVr4 documents additional
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
