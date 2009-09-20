From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: setenv may set errno
Date: Sun, 20 Sep 2009 05:01:38 +0200
Message-ID: <cfd18e0f0909192001g79154e7axe123e77901e7cbb2@mail.gmail.com>
References: <20090908091236.GF15639@lenovo.private>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20090908091236.GF15639-tjyxa8jfGxeYtgw7cXKeDw@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Georg,

On Tue, Sep 8, 2009 at 11:12 AM,  <gsauthof-If1cxaH3S3JVgF+RW+Bo1SZEdBbF94EN@public.gmane.org> wrote:
> Hi,
>
> in setenv(3) in the section 'RETURN VALUE' it is not mentioned, that
> setenv() may set errno. For unsetenv() the section mentions this.

Thanks! Your comment actually triggered a few other changes as well.
See the patc below, which will be in man-pages-3.22.

Cheers,

Michael


--- a/man3/setenv.3
+++ b/man3/setenv.3
@@ -82,8 +82,10 @@ then the function succeeds, and the environment is unchanged.
 .SH "RETURN VALUE"
 The
 .BR setenv ()
-function returns zero on success, or \-1 if there
-was insufficient space in the environment.
+function returns zero on success,
+or \-1 on error, with
+.I errno
+set to indicate the cause of the error.

 The
 .BR unsetenv ()
@@ -95,7 +97,11 @@ set to indicate the cause of the error.
 .TP
 .B EINVAL
 .I name
-contained an \(aq=\(aq character.
+is NULL, points to a string of length 0,
+or contains an \(aq=\(aq character.
+.TP
+.B ENOMEM
+Insufficient memory to add a new variable to the environment.
 .SH "CONFORMING TO"
 4.3BSD, POSIX.1-2001.
 .SH "NOTES"




-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Watch my Linux system programming book progress to publication!
http://blog.man7.org/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
