From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] mbrtowc.3: ATTRIBUTES: Note function that is thread safe
 with exceptions
Date: Sat, 08 Jun 2013 05:55:02 +0200
Message-ID: <51B2AB16.3040506@gmail.com>
References: <1370339930-23741-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370339930-23741-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, carlos-v2tUB8YBRSi3e3T8WW9gsA@public.gmane.org, aoliva-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/04/13 11:58, Peng Haitao wrote:
> The function mbrtowc() is thread safe with exceptions.

Thanks, Peng. Applied in my local branch.

Cheers,

Michael



> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/mbrtowc.3 | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/man3/mbrtowc.3 b/man3/mbrtowc.3
> index ce3e3aa..aaf5e91 100644
> --- a/man3/mbrtowc.3
> +++ b/man3/mbrtowc.3
> @@ -102,6 +102,12 @@ and sets \fIerrno\fP to \fBEILSEQ\fP, if an invalid multibyte sequence was
>  encountered.
>  It returns \fI(size_t)\ \-2\fP if it couldn't parse a complete multibyte
>  character, meaning that \fIn\fP should be increased.
> +.SH ATTRIBUTES
> +.SS Multithreading (see pthreads(7))
> +The
> +.BR mbrtowc ()
> +function is thread-safe with exceptions.
> +It is not thread-safe if called with a NULL \fIps\fP parameter.
>  .SH CONFORMING TO
>  C99.
>  .SH NOTES
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
