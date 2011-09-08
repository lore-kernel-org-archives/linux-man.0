From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] mkstemp.3, perror(3): minor fixes in SYNOPSIS
Date: Thu, 8 Sep 2011 17:34:14 +0200
Message-ID: <CAKgNAkixC=Emgush8qyruAW63rMxVMPK8aBrU9EgmkXe7kqQJQ@mail.gmail.com>
References: <4E5E4AEF.5090508@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E4AEF.5090508-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: A whitespace was removed, and the formatting corrected.

Applied for 3.33.

Thanks,

Michael


> diff --git a/man3/mkstemp.3 b/man3/mkstemp.3
> --- a/man3/mkstemp.3
> +++ b/man3/mkstemp.3
> @@ -39,7 +39,7 @@ mkstemp, mkostemp \- create a unique temporary file
> .sp
> .BI "int mkstemp(char *" template );
> .sp
> -.BI "int mkostemp (char *" template ", int " flags );
> +.BI "int mkostemp(char *" template ", int " flags );
> .sp
> .BI "int mkstemps(char *" template ", int " suffixlen );
> .sp
> diff --git a/man3/perror.3 b/man3/perror.3
> --- a/man3/perror.3
> +++ b/man3/perror.3
> @@ -33,7 +33,7 @@ perror \- print a system error message
> .SH SYNOPSIS
> .B #include <stdio.h>
> .sp
> -.BI "void perror(const char " *s );
> +.BI "void perror(const char *" s );
> .sp
> .B #include <errno.h>
> .sp
>
>



-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
