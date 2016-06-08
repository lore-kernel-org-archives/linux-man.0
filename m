From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] add_key.2: Empty payloads are not allowed in user-defined
 keys.
Date: Wed, 8 Jun 2016 11:58:46 +0200
Message-ID: <9831ed7f-5c21-0788-3bdf-0552b256feb9@gmail.com>
References: <alpine.LNX.2.00.1603281843250.15978@sisyphus>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LNX.2.00.1603281843250.15978@sisyphus>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mitch-mA1pf0pi6YpWk0Htik3J/w@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Thanks, Mitch. Patch applied.

Cheers,

Michael


On 03/28/2016 10:45 PM, mitch-mA1pf0pi6YpWk0Htik3J/w@public.gmane.org wrote:
> ---
>   man2/add_key.2 | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/man2/add_key.2 b/man2/add_key.2
> index ae0d59f..6d318c1 100644
> --- a/man2/add_key.2
> +++ b/man2/add_key.2
> @@ -74,9 +74,6 @@ may be any valid string, though it is preferred that the description be
>   prefixed with a string representing the service to which the key is of interest
>   and a colon (for instance
>   .RB \*(lq afs:mykey \*(rq).
> -The
> -.I payload
> -may be empty or NULL for keys of this type.
>   .TP
>   .B \*(lqkeyring\*(rq
>   Keyrings are special key types that may contain links to sequences of other
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
