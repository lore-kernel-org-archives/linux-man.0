From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] termios.3: tfix
Date: Wed, 07 May 2014 20:47:32 +0200
Message-ID: <536A7FC4.9070403@gmail.com>
References: <1399484554-4545-1-git-send-email-yuray@komyakino.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1399484554-4545-1-git-send-email-yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Yuri Kozlov <yuray-YPGtXv8QU+00kPtPmH8OGQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05/07/2014 07:42 PM, Yuri Kozlov wrote:
> ---
>  man3/termios.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/termios.3 b/man3/termios.3
> index 65f6c791..639e845 100644
> --- a/man3/termios.3
> +++ b/man3/termios.3
> @@ -181,7 +181,7 @@ this allows character-erase to be correctly performed in cooked mode.
>  Enable implementation-defined output processing.
>  .PP
>  The remaining \fIc_oflag\fP flag constants are defined in POSIX.1-2001,
> -unless marked otherwise.
> +unless marked otherwise:
>  .TP
>  .B OLCUC
>  (not in POSIX) Map lowercase characters to uppercase on output.

I decided to go for a different fix, since discussion of "POSIX.1" (presumably
meaning POSIX.1-1990) is rather crufty these days:

[[
--- a/man3/termios.3
+++ b/man3/termios.3
@@ -175,13 +175,11 @@ Linux does not implement this bit, and acts as if it is always set.
 (not in POSIX) Input is UTF8;
 this allows character-erase to be correctly performed in cooked mode.
 .PP
-\fIc_oflag\fP flag constants defined in POSIX.1:
+.I c_oflag
+flag constants:
 .TP
 .B OPOST
 Enable implementation-defined output processing.
-.PP
-The remaining \fIc_oflag\fP flag constants are defined in POSIX.1-2001,
-unless marked otherwise.
 .TP
 .B OLCUC
 (not in POSIX) Map lowercase characters to uppercase on output.
]]

Cheers,

Michael

-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
