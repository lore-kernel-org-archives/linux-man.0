From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: should man page for syslog(2) be updated WRT log levels?
Date: Sun, 15 Jun 2014 20:17:51 +0200
Message-ID: <539DE34F.7020302@gmail.com>
References: <alpine.LFD.2.11.1405260905100.6928@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.11.1405260905100.6928@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Robert P. J. Day" <rpjday-L09J2beyid0N/H6P543EQg@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Robert,

On 05/26/2014 03:06 PM, Robert P. J. Day wrote:
> 
>   hi, not sure if this question makes any sense but, currently, the
> man page for syslog(2) claims:
> 
> The conventional meaning of the loglevel is defined in
> .I <linux/kernel.h>
> as follows:
> 
> .nf
> #define KERN_EMERG    "<0>"  /* system is unusable               */
> #define KERN_ALERT    "<1>"  /* action must be taken immediately */
> #define KERN_CRIT     "<2>"  /* critical conditions              */
> #define KERN_ERR      "<3>"  /* error conditions                 */
> #define KERN_WARNING  "<4>"  /* warning conditions               */
> #define KERN_NOTICE   "<5>"  /* normal but significant condition */
> #define KERN_INFO     "<6>"  /* informational                    */
> #define KERN_DEBUG    "<7>"  /* debug-level messages             */
> 
>  first, those defines don't seem to exist anymore -- 

Yup. there was a change with kernel commit 
04d2c8c83d0e3ac5f78aeede51babb3236200112, it seems.

> in userspace, one
> finds definitions in <sys/syslog.h>:
> 
> #define LOG_EMERG       0       /* system is unusable */
> #define LOG_ALERT       1       /* action must be taken immediately */
> #define LOG_CRIT        2       /* critical conditions */
> #define LOG_ERR         3       /* error conditions */
> #define LOG_WARNING     4       /* warning conditions */
> #define LOG_NOTICE      5       /* normal but significant condition */
> #define LOG_INFO        6       /* informational */
> #define LOG_DEBUG       7       /* debug-level messages */

Those defines are there for syslog(3).

>   also, in kernelspace, there is the newer header file kern_levels.h
> which defines log levels differently these days:
> 
> #define KERN_SOH        "\001"          /* ASCII Start Of Header */
> #define KERN_SOH_ASCII  '\001'
> 
> #define KERN_EMERG      KERN_SOH "0"    /* system is unusable */
> #define KERN_ALERT      KERN_SOH "1"    /* action must be taken immediately */
> #define KERN_CRIT       KERN_SOH "2"    /* critical conditions */
> #define KERN_ERR        KERN_SOH "3"    /* error conditions */
> #define KERN_WARNING    KERN_SOH "4"    /* warning conditions */
> #define KERN_NOTICE     KERN_SOH "5"    /* normal but significant condition */
> #define KERN_INFO       KERN_SOH "6"    /* informational */
> #define KERN_DEBUG      KERN_SOH "7"    /* debug-level messages */
> 
> #define KERN_DEFAULT    KERN_SOH "d"    /* the default kernel loglevel */
> 
>   i have no idea how any of that should affect the man page for
> syslog(2), and possibly others. thoughts? or am i just totally
> misunderstanding something?

So, some details have changed, and I agree that the page could be clearer.
But, in the meantime, I'll apply a patch something like the below.

Cheers,

Michael

diff --git a/man2/syslog.2 b/man2/syslog.2
index 5053b88..10894bf 100644
--- a/man2/syslog.2
+++ b/man2/syslog.2
@@ -1,3 +1,4 @@
+'\" t
 .\" Copyright (C) 1995 Andries Brouwer (aeb-rh8NL+sEX9E@public.gmane.org)
 .\"
 .\" %%%LICENSE_START(VERBATIM)
@@ -232,20 +233,21 @@ This level is
 (6) unless the line starts with <d>
 where \fId\fP is a digit in the range 1-7, in which case the level
 is \fId\fP.
-The conventional meaning of the loglevel is defined in
-.I <linux/kernel.h>
-as follows:
+The conventional meaning of the loglevel is as follows:
 
-.nf
-#define KERN_EMERG    "<0>"  /* system is unusable               */
-#define KERN_ALERT    "<1>"  /* action must be taken immediately */
-#define KERN_CRIT     "<2>"  /* critical conditions              */
-#define KERN_ERR      "<3>"  /* error conditions                 */
-#define KERN_WARNING  "<4>"  /* warning conditions               */
-#define KERN_NOTICE   "<5>"  /* normal but significant condition */
-#define KERN_INFO     "<6>"  /* informational                    */
-#define KERN_DEBUG    "<7>"  /* debug-level messages             */
-.fi
+.TS
+lB lB lB
+lB c l.
+Kernel constant        Level value     Meaning
+KERN_EMERG     0       System is unusable
+KERN_ALERT     1       Action must be taken immediately
+KERN_CRIT      2       Critical conditions
+KERN_ERR       3       Error conditions
+KERN_WARNING   4       Warning conditions
+KERN_NOTICE    5       Normal but significant condition
+KERN_INFO      6       Informational
+KERN_DEBUG     7       Debug-level messages
+.TE
 .SH RETURN VALUE
 For \fItype\fP equal to 2, 3, or 4, a successful call to
 .BR syslog ()

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
