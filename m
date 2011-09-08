From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] malloc.3: reorder prototypes in SYNOPSIS
Date: Thu, 8 Sep 2011 17:36:42 +0200
Message-ID: <CAKgNAkibLz7kcjkxXf7rNj-cJq2YR+mg=mncsYRNx7G4JpMdiw@mail.gmail.com>
References: <4E5E49AD.8030704@gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5E49AD.8030704-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

2011/8/31 Seonghun Lim <wariua-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>:
> man-pages version: latest git repository
> why: calloc() comes before realloc() in the other sections, so
> should do in SYNOPSIS, too.

Applied for 3.33.

Thanks,

Michael

> diff --git a/man3/malloc.3 b/man3/malloc.3
> --- a/man3/malloc.3
> +++ b/man3/malloc.3
> @@ -34,8 +34,8 @@ malloc, free, calloc, realloc \- Allocate and free
> dynamic memory
> .sp
> .BI "void *malloc(size_t " "size" );
> .BI "void free(void " "*ptr" );
> -.BI "void *realloc(void " "*ptr" ", size_t " "size" );
> .BI "void *calloc(size_t " "nmemb" ", size_t " "size" );
> +.BI "void *realloc(void " "*ptr" ", size_t " "size" );
> .fi
> .SH DESCRIPTION
> .PP
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
