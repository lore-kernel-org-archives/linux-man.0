From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] isalpha.3: tfix
Date: Tue, 23 Sep 2014 06:24:27 +0200
Message-ID: <5420F5FB.9090205@gmail.com>
References: <1411377429-20255-1-git-send-email-penght@cn.fujitsu.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411377429-20255-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks for catching that, Haitao. Patch applied in 
my attributes_reformat_2 branch.

Cheers,

Michael

On 09/22/2014 11:17 AM, Peng Haitao wrote:
> Signed-off-by: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
> ---
>  man3/isalpha.3 | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/man3/isalpha.3 b/man3/isalpha.3
> index a7f3b0c..346cc7f 100644
> --- a/man3/isalpha.3
> +++ b/man3/isalpha.3
> @@ -223,13 +223,12 @@ The values returned are nonzero if the character
>  .I c
>  falls into the tested class, and zero if not.
>  .SH ATTRIBUTES
> -.SS Multithreading (see pthreads(7))
>  For an explanation of the terms used in this section, see
>  .BR attributes (7).
>  .ad l
>  .TS
>  allbox;
> -lbw33 lb lb
> +lbw32 lb lb
>  l l l.
>  Interface	Attribute	Value
>  T{
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
