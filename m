From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getent.1: ffix
Date: Fri, 11 Sep 2015 10:46:06 +0200
Message-ID: <55F294CE.2050700@gmail.com>
References: <1441808319-2128-1-git-send-email-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1441808319-2128-1-git-send-email-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/09/2015 04:18 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael


> ---
>  man1/getent.1 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man1/getent.1 b/man1/getent.1
> index af162fd..a1a49fd 100644
> --- a/man1/getent.1
> +++ b/man1/getent.1
> @@ -344,12 +344,12 @@ and display the result.
>  .RE
>  .SH OPTIONS
>  .TP
> -.BR \-s\ \fIservice\fP, \-\-service\ \fIservice\fP
> +.BR \-s\ \fIservice\fP ", " \-\-service\ \fIservice\fP
>  .\" commit 9d0881aa76b399e6a025c5cf44bebe2ae0efa8af (glibc)
>  Override all databases with the specified service.
>  (Since glibc 2.2.5.)
>  .TP
> -.BR \-s\ \fIdatabase\fP:\fIservice\fP,\ \
> +.BR \-s\ \fIdatabase\fP:\fIservice\fP ", "\
>  \-\-service\ \fIdatabase\fP:\fIservice\fP
>  .\" commit b4f6f4be85d32b9c03361c38376e36f08100e3e8 (glibc)
>  Override only specified databases with the specified service.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
