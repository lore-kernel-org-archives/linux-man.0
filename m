From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] vfork.2: tfix
Date: Thu, 26 Jan 2017 07:24:21 +1300
Message-ID: <b3fe6a56-acac-927b-63c4-7cdf2e3ef7b3@gmail.com>
References: <20170125153733.3588-1-jwilk@jwilk.net>
 <20170125153733.3588-2-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170125153733.3588-2-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/26/2017 04:37 AM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Hmmm -- that text was a bit of a fail on my part....

Applied! Thanks, Jakub.

Cheers,

Michael



> ---
>  man2/vfork.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/vfork.2 b/man2/vfork.2
> index bfc689b6e..b4ac02c48 100644
> --- a/man2/vfork.2
> +++ b/man2/vfork.2
> @@ -219,7 +219,7 @@ avoids the need to temporarily commit memory (see the description of
>  in
>  .BR proc (5))
>  in order to execute a new program.
> -(This can be especifially beneficial where a large parent process wishes
> +(This can be especially beneficial where a large parent process wishes
>  to execute a small helper program in a child process.)
>  By contrast, using
>  .BR fork (2)
> @@ -253,7 +253,7 @@ or similar),
>  since there are now two processes with different privilege levels
>  running in the same address space.
>  As an example of the dangers,
> -suppose that a multithreaded pgroam running as root creates a child using
> +suppose that a multithreaded program running as root creates a child using
>  .BR vfork ().
>  After the
>  .BR vfork (),
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
