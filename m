From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ld.so.8: wfix
Date: Wed, 27 Sep 2017 09:53:04 +0200
Message-ID: <42bb28ee-2b39-dbee-cc89-6533befbf187@gmail.com>
References: <1506425039-14243-1-git-send-email-mihir@cs.utexas.edu>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1506425039-14243-1-git-send-email-mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/26/2017 01:23 PM, mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org wrote:
> From: Mihir Mehta <mihir-NZpS4cJIG2HvQtjrzfazuQ@public.gmane.org>

Thanks, Mihir! Applied.

Cheers,

Michael

> Someone omitted a word in ld.so.8; this patch fixes that.
> ---
>   man8/ld.so.8 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 97faf87..952401e 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -39,7 +39,7 @@ handles a.out binaries, a format used long ago;
>   handles ELF,
>   which everybody has been using for years now.
>   Otherwise, both have the same behavior, and use the same
> -support files and programs
> +support files and programs as
>   .BR ldd (1),
>   .BR ldconfig (8),
>   and
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
