From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: small improvement for kexec_load.2 and getutent.3
Date: Thu, 4 Nov 2010 07:24:38 +0100
Message-ID: <AANLkTimjULbQt+LrK0CNfbmk39HK81Jk_vr4mpfOcGZT@mail.gmail.com>
References: <20101102151043.220797e6@keeper.home.local>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=KOI8-R
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20101102151043.220797e6-CpVCSV+zb/Ftei/ch0jEm2ZHpeb/A1Y/@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Yuri,

On Tue, Nov 2, 2010 at 1:10 PM, Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org> wrote:
> Hello.

(Inline patches are usually easier for me.)

By chance, Denis Barbier (later) reported the same error in
kexec_load.2, and I happened to apply his patch first.

For getutent.3, the formatting as given was deliberate, but could be
improved. I applied a slightly different patch for 3.31.

Thanks for these reports.

Thanks,

Michael

--- a/man3/getutent.3
+++ b/man3/getutent.3
@@ -209,7 +209,7 @@ Glibc adds reentrant versions
 .sp
 .nf
 .BR "#define _GNU_SOURCE" "    /* or _SVID_SOURCE or _BSD_SOURCE;
-.R "\&                          see feature_test_macros(7) */
+.RB "\&                          see " feature_test_macros(7) " */"
 .B #include <utmp.h>
 .sp
 .BI "int getutent_r(struct utmp *" ubuf ", struct utmp **" ubufp );


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
