From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] capabilities.7: add a note about /proc/PID/status
Date: Thu, 28 Feb 2013 14:54:42 +0100
Message-ID: <CAKgNAkhdp3sT+KOO-nsHOH+ps2aOSbvt2CcVRMHA39Of9gqKXQ@mail.gmail.com>
References: <1361532265-5962-1-git-send-email-avagin@openvz.org>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361532265-5962-1-git-send-email-avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Andrey,

On Fri, Feb 22, 2013 at 12:24 PM, Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org> wrote:
> Since kernel 3.6.8, all non-existent capabilities (above CAP_LAST_CAP)
> are not shown.
>
> Signed-off-by: Andrey Vagin <avagin-GEFAQzZX7r8dnm+yROfE0A@public.gmane.org>
> ---
>  man7/capabilities.7 | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/man7/capabilities.7 b/man7/capabilities.7
> index b8f2a75..5e4e6bf 100644
> --- a/man7/capabilities.7
> +++ b/man7/capabilities.7
> @@ -1034,7 +1034,11 @@ The
>  file can be used to view the capability sets of a thread.
>  The
>  .I /proc/PID/status
> -file shows the capability sets of a process's main thread.
> +file shows the capability sets of a process's main thread. Since kernel 3.6.8,
> +all non-existent capabilities (above
> +.B CAP_LAST_CAP)
> +are not shown.
> +.\" 7b9a7ec565505699f503b4fcf61500dceb36e744
>
>  The
>  .I libcap
> --
> 1.7.11.7
>

Thanks. I applied a tweaked version of your patch, and replaced the
stable kernel number with a mainline number, which is the norm in
man-pages.

Cheers,

Michael

diff --git a/man7/capabilities.7 b/man7/capabilities.7
index a663c22..64b642e 100644
--- a/man7/capabilities.7
+++ b/man7/capabilities.7
@@ -43,7 +43,7 @@
 .\"     other capabilities where the permitted or inheritable bit is set.
 .\" 2011-09-07, mtk/Serge hallyn: Add CAP_SYSLOG
 .\"
-.TH CAPABILITIES 7 2012-12-22 "Linux" "Linux Programmer's Manual"
+.TH CAPABILITIES 7 2013-02-25 "Linux" "Linux Programmer's Manual"
 .SH NAME
 capabilities \- overview of Linux capabilities
 .SH DESCRIPTION
@@ -1035,6 +1035,13 @@ file can be used to view the capability sets of a thread.
 The
 .I /proc/PID/status
 file shows the capability sets of a process's main thread.
+Before Linux 3.8, nonexistent capabilities were shown as being
+enabled (1) in these sets.
+Since Linux 3.8,
+.\" 7b9a7ec565505699f503b4fcf61500dceb36e744
+all non-existent capabilities (above
+.B CAP_LAST_CAP)
+are shown as disabled (0).

 The
 .I libcap


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
