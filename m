From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] resolver.3: correct arguments to res_ninit(res_state
 statep)
Date: Thu, 11 Aug 2016 06:22:07 +1200
Message-ID: <c52076aa-42f1-d655-5405-44995eb7a896@gmail.com>
References: <4208e9bc-38c0-a17b-298f-bb6659d00138@isc.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4208e9bc-38c0-a17b-298f-bb6659d00138-2cKsPvgpMDY@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ray Bellis <ray-2cKsPvgpMDY@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Ray,

On 08/10/2016 10:24 PM, Ray Bellis wrote:
> The man page for res_ninit() incorrectly says that it takes no
> parameters, when in fact (and indeed according to the same page further
> down) it has to take a res_state parameter.

Thanks for the patch! Applied.

Cheers,

Michael


> --8<--8<--
> diff --git a/man3/resolver.3 b/man3/resolver.3
> index a5cfd22..dc0519a 100644
> --- a/man3/resolver.3
> +++ b/man3/resolver.3
> @@ -44,7 +44,7 @@ dn_comp, dn_expand \- resolver routines
>  .B struct __res_state;
>  .B typedef struct __res_state *res_state;
>
> -.B int res_ninit(void);
> +.BI "int res_ninit(res_state " statep );
>
>  .BI "int res_nquery(res_state " statep ,
>  .BI "           const char *" dname ", int " class ", int " type ,
> --8<--8<--
>
> kind regards,
>
> Ray Bellis
>


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
