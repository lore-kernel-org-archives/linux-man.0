From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: readdir_r: return values not clearly mentioned
Date: Fri, 10 Sep 2010 07:50:32 +0200
Message-ID: <AANLkTimQ1Ed8_d3ed=1aMfpddsKGQDVwa7tu0WS_onLb@mail.gmail.com>
References: <20100722072614.GA6355@comppasch2>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20100722072614.GA6355@comppasch2>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org" <fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Thu, Jul 22, 2010 at 9:26 AM, fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org
<fkater-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org> wrote:
> Hi,
>
> in man 3 readdir_r (man-pages-3.24, page date 2009-07-04)
> the possible return values are described as:
>
> "The readdir_r() function returns 0 on success. =A0On error,
> it returns a positive error number."
>
> It is not mentioned which possible error numbers may occur.

Well, it is, but it could be clearer. See the patch below, for man-page=
s-3.27.

Thanks,

Michael

--- a/man3/readdir.3
+++ b/man3/readdir.3
@@ -31,7 +31,7 @@
 .\"     Rework discussion of nonstandard structure fields.
 .\" 2008-09-11, mtk, Document readdir_r().
 .\"
-.TH READDIR 3  2009-07-04 "" "Linux Programmer's Manual"
+.TH READDIR 3  2010-09-10 "" "Linux Programmer's Manual"
 .SH NAME
 readdir, readdir_r \- read a directory
 .SH SYNOPSIS
@@ -131,7 +131,7 @@ is set appropriately.
 The
 .BR readdir_r ()
 function returns 0 on success.
-On error, it returns a positive error number.
+On error, it returns a positive error number (listed under ERRORS).
 If the end of the directory stream is reached,
 .BR readdir_r ()
 returns 0, and returns NULL in



--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
