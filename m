From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] fallocate.2: Reference header linux/falloc.h
Date: Mon, 17 Dec 2012 02:11:38 +0100
Message-ID: <CAKgNAkirB+iHEAr7+R6Avzg6GbZbdevWAxLJOBmmXrc5EzsZPQ@mail.gmail.com>
References: <CAL3q7H6SXux13tVdjaUwXOA4Zu7kTtFJcyOKAmyyYCZvjgFzWw@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAL3q7H6SXux13tVdjaUwXOA4Zu7kTtFJcyOKAmyyYCZvjgFzWw-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: fdmanana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On Sun, Dec 16, 2012 at 4:08 PM, Filipe David Manana <fdmanana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This affects all versions of the man pages that include fallocate.2
> (to my knowledge).
>
> Attempting to compile a program that calls fallocate() and references
> the modes FALLOC_FL_KEEP_SIZE or FALLOC_FL_PUNCH_HOLE fails, because
> these constants are not defined in fcntl.h (the only header referenced
> in the man page for fallocate.2).
>
> Patch follows inline below, and as an attachment as well.
> Thank you.
>
> From 50b3cac563f6646fc75ffb8658064b25529cadea Mon Sep 17 00:00:00 2001
> From: Filipe David Borba Manana <fdmanana-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Date: Sun, 16 Dec 2012 14:56:47 +0000
> Subject: [PATCH] fallocate.2: Reference header linux/falloc.h
>
> This header file is where the constants used for the
> mode parameter are defined (FALLOC_FL_KEEP_SIZE and
> FALLOC_FL_PUNCH_HOLE at the moment).

Hello Filipe,

Thanks for the report. I've not decided yet what to do with the man
page, because the real problem is with glibc, which should define
those constants in <bits/fcntl.h>. In the meantime, I have filed this:

http://www.sourceware.org/bugzilla/show_bug.cgi?id=14964

Cheers,

Michael


> ---
>  man2/fallocate.2 |    1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/man2/fallocate.2 b/man2/fallocate.2
> index 363e50f..4aea591 100644
> --- a/man2/fallocate.2
> +++ b/man2/fallocate.2
> @@ -12,6 +12,7 @@ fallocate \- manipulate file space
>  .nf
>  .BR "#define _GNU_SOURCE" "             /* See feature_test_macros(7) */"
>  .B #include <fcntl.h>
> +.B #include <linux/falloc.h>
>
>  .BI "int fallocate(int " fd ", int " mode ", off_t " offset \
>  ", off_t " len ");
> --
> 1.7.9.5
>
>
>
> --
> Filipe David Manana,
>
> "Reasonable men adapt themselves to the world.
>  Unreasonable men adapt the world to themselves.
>  That's why all progress depends on unreasonable men."



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
