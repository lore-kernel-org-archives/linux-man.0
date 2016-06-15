From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] getauxval.3: tfix
Date: Wed, 15 Jun 2016 22:53:30 +0200
Message-ID: <76f5701d-5292-9e35-1b35-31f09796859c@gmail.com>
References: <20160615201922.GA2370@localhost>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160615201922.GA2370@localhost>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 06/15/2016 10:19 PM, Tobias Stoeckmann wrote:
> Fix typo. It's supposed to be "its" not "it's" in this context.

Thanks, Tobias. Applied.

Cheers,

Michael

> Signed-off-by: Tobias Stoeckmann <tobias-te0W2B6tFQkGQOE+iOL5gA@public.gmane.org>
> ---
>  man3/getauxval.3 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man3/getauxval.3 b/man3/getauxval.3
> index fe2b0b8..85d7f41 100644
> --- a/man3/getauxval.3
> +++ b/man3/getauxval.3
> @@ -149,7 +149,7 @@ The address of sixteen bytes containing a random value.
>  Has a nonzero value if this executable should be treated securely.
>  Most commonly, a nonzero value indicates that the process is
>  executing a set-user-ID or set-group-ID binary
> -(so that it's real and effective UIDs or GIDs differ from one another),
> +(so that its real and effective UIDs or GIDs differ from one another),
>  or that it gained capabilities by executing
>  a binary file that has capabilities (see
>  .BR capabilities (7)).
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
