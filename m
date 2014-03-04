From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man 3 strncpy error
Date: Tue, 04 Mar 2014 17:39:09 +0100
Message-ID: <531601AD.7020702@gmail.com>
References: <1393698707.4142.12.camel@linus.home.rsiny.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393698707.4142.12.camel-rnTwVquHiKrxZjqEEZ1hU1aTQe2KTcn/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: rstanley-PulMX1svUoYAvxtiuMwx3w@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Rick,

On 03/01/2014 07:31 PM, Rick Stanley wrote:
> On the current page for `man 3 strncpy` there is an error in the sample
> for forced termination if the copy does not result in a proper
> null-terminated string. (Appears in both "Man-pages, release 3.58", and
> on http://man7.org/linux/man-pages/man3/strncpy.3.html )
> 
> Current:
>         
>         strncpy(buf, str, n);
>         if (n > 0)
>             buf[n - 1]= '\0';
>         
> If n == 4, then 4 bytes are copied, (buf[0] - buf[3]) but n - 1 or
> buf[3] is then overwritten with the '\0'.  Should be buf[n] instead.
> 
> Corrected code:
>         
>         strncpy(buf, str, n);
>         if (n > 0)
>             buf[n]= '\0';
>         
> Question:  Even if n == 0 why shouldn't buf[n] be set to '\0'?

The answer to all the points is that there was a mistake in the first line
of the code. It should have read:

         strncpy(buf, str, n - 1);

As long as I was there, I decided to improve the text somewhat as well.
Patch below. Thanks for the report.

Cheers,

Michael

diff --git a/man3/strcpy.3 b/man3/strcpy.3
index da027c3..c4293b0 100644
--- a/man3/strcpy.3
+++ b/man3/strcpy.3
@@ -32,7 +32,7 @@
 .\" 2007-06-15, Marc Boyer <marc.boyer-oUYRw6/Rnm9Wj0EZb7rXcA@public.gmane.org> + mtk
 .\"     Improve discussion of strncpy().
 .\"
-.TH STRCPY 3  2014-02-28 "GNU" "Linux Programmer's Manual"
+.TH STRCPY 3  2014-03-04 "GNU" "Linux Programmer's Manual"
 .SH NAME
 strcpy, strncpy \- copy a string
 .SH SYNOPSIS
@@ -152,20 +152,25 @@ bytes of
 .BR strncpy ()
 produces an unterminated string in
 .IR dest .
-You can force termination using something like the following:
+If
+.I buf
+has length
+.IR buflen ,
+you can force termination using something like the following:
 .in +4n
 .nf
 
-strncpy(buf, str, n);
-if (n > 0)
-    buf[n \- 1]= \(aq\\0\(aq;
+strncpy(buf, str, buflen \- 1);
+if (buflen > 0)
+    buf[buflen \- 1]= \(aq\\0\(aq;
 .fi
 .in
 .PP
-(Of course, the above technique ignores the fact that
-information contained in
+(Of course, the above technique ignores the fact that, if
 .I src
-is lost in the copying to
+contains more than
+.I "buflen\ \-\ 1"
+bytes, information is lost in the copying to
 .IR dest .)
 
 Some systems (the BSDs, Solaris, and others) provide the following function:



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
