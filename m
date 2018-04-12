From: "Michael Kerrisk (man-pages)" <mtk.manpages@gmail.com>
Subject: Re: [PATCH] getcwd.3: Mention that "(unreachable)" is no longer
 returned for glibc > 2.27.
Date: Thu, 12 Apr 2018 13:50:19 +0200
Message-ID: <c92d8492-78a2-3a63-8695-140d4d043f79@gmail.com>
References: <94a3f8a3-5c0e-9fa5-ce2c-3f7e4b097a97@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-91510-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <94a3f8a3-5c0e-9fa5-ce2c-3f7e4b097a97@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, GNU C Library <libc-alpha@sourceware.org>
Cc: mtk.manpages@gmail.com, Florian Weimer <fweimer@redhat.com>
List-Id: linux-man@vger.kernel.org

Hello Carlos,

On 02/05/2018 09:34 PM, Carlos O'Donell wrote:
> Michael,
> 
> With glibc fix 52a713fdd0a30e1bd79818e2e3c4ab44ddca1a94 for
> CVE-2018-1000001 (Sourceware BZ #22679) the implementation in the
> just released glibc 2.27 has been changed such that instead of
> returning "(unreachable)" the implementation now returns ENOENT
> as it would have if the current directory had been unlinked.
> 
> I see that in 2015 the quirk was documented in commit
> a2ac97c78bf05a55f8f616fc39a4724372dcfa95, and this is no longer
> true with glibc 2.27, but may continue to be true in other C libraries,
> so I reference NOTES from the paragraph in the central text.

Thanks. Patch applied.

Cheers,

Michael

> Signed-off-by: Carlos O'Donell <carlos@redhat.com>
> 
> diff --git a/man3/getcwd.3 b/man3/getcwd.3
> index ff953a7d0..3c41736c9 100644
> --- a/man3/getcwd.3
> +++ b/man3/getcwd.3
> @@ -91,7 +91,9 @@ the current directory into another mount namespace.
>  When dealing with paths from untrusted sources, callers of these
>  functions should consider checking whether the returned path starts
>  with '/' or '(' to avoid misinterpreting an unreachable path
> -as a relative path.
> +as a relative path. This is no longer true under some C libraries,
> +see
> +.BR NOTES .
>  .PP
>  The
>  .BR getcwd ()
> @@ -270,6 +272,16 @@ generic implementation is called.
>  Only in that case can
>  these calls fail under Linux with
>  .BR EACCES .
> +.PP
> +Since Linux commit v2.6.36 which added "(unreachable)" the glibc
> +.BR getcwd ()
> +has failed to conform to POSIX and returned a relative path when the API
> +contract requires an absolute path. With glibc 2.27 onwards this is corrected;
> +calling
> +.BR getcwd ()
> +from such a path will now result in failure with
> +.BR ENOENT .
> +
>  .PP
>  These functions are often used to save the location of the current working
>  directory for the purpose of returning to it later.
> ---
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
