From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ptsname.3: ERRORS: remove EINVAL
Date: Fri, 16 Jun 2017 09:46:15 +0200
Message-ID: <9ce65877-92c7-9a57-8126-c856b3e6e342@gmail.com>
References: <20170608125218.GA80475@aloka.lostca.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170608125218.GA80475-dUzzAJbwTVHDVYEGADRjmA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arjun Shankar <arjun.is-xDe9EDckjEKzQB+pC5nmwQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Zack Weinberg <zackw-VmQCmMdMyN0AvxtiuMwx3w@public.gmane.org>, Joseph Myers <joseph-qD8j1LwMmJjtCj0u4l0SBw@public.gmane.org>, Florian Weimer <fweimer-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

On 06/08/2017 02:52 PM, Arjun Shankar wrote:
> The glibc implementation of 'ptsname_r' no longer checks if it has
> been called with a NULL 'buf' [1], and therefore cannot return an
> EINVAL error.
>
> [1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=8f0a947
>     (prior to the release of glibc 2.26)
> 
> Signed-off-by: Arjun Shankar <arjun.is-xDe9EDckjEKzQB+pC5nmwQ@public.gmane.org>
> ---
>  man3/ptsname.3 | 6 ------
>  1 file changed, 6 deletions(-)
> 
> diff --git a/man3/ptsname.3 b/man3/ptsname.3
> index 90133fe..fd98b6b 100644
> --- a/man3/ptsname.3
> +++ b/man3/ptsname.3
> @@ -58,12 +58,6 @@ is set to indicate the error.
>  .\" result -- MTK, Dec 04
>  .SH ERRORS
>  .TP
> -.B EINVAL
> -.RB ( ptsname_r ()
> -only)
> -.I buf
> -is NULL.
> -.TP
>  .B ENOTTY
>  .I fd
>  does not refer to a pseudoterminal master device.


Thanks, Arjun. I applied a slightly different patch:

diff --git a/man3/ptsname.3 b/man3/ptsname.3
index 0ce88a1..05f4958 100644
--- a/man3/ptsname.3
+++ b/man3/ptsname.3
@@ -76,6 +76,9 @@ is set to indicate the error.
 only)
 .I buf
 is NULL.
+(This error is returned only for
+.\" glibc commit 8f0a947cf55f3b0c4ebdf06953c57eff67a22fa9
+glibc 2.25 and earlier.)
 .TP
 .B ENOTTY
 .I fd


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
