From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/8] keyctl.2: tfix
Date: Wed, 4 Jan 2017 15:24:43 +1300
Message-ID: <b8bae7ec-2949-2ee7-d5be-8d909a82483c@gmail.com>
References: <20170103233657.8875-1-jwilk@jwilk.net>
 <20170103233657.8875-3-jwilk@jwilk.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170103233657.8875-3-jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 01/04/2017 12:36 PM, Jakub Wilk wrote:
> Signed-off-by: Jakub Wilk <jwilk-tXgOlIzOKNReoWH0uzbU5w@public.gmane.org>

Thanks, Jakub. Applied.

Cheers,

Michael



> ---
>  man2/keyctl.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/keyctl.2 b/man2/keyctl.2
> index e1efb1898..57d1a2133 100644
> --- a/man2/keyctl.2
> +++ b/man2/keyctl.2
> @@ -816,7 +816,7 @@ The key must either grant the caller
>  permission, or grant the caller
>  .I search
>  permission when searched for from the process keyrings
> -(i.e, the key is possessed).
> +(i.e., the key is possessed).
>  
>  The
>  .I arg5
> @@ -1166,7 +1166,7 @@ The keyring must exist and must grant the caller
>  permission.
>  The parent process must be single-threaded and have
>  the same effective ownership as this process
> -and must not be be set-user-ID or set-group-ID.
> +and must not be set-user-ID or set-group-ID.
>  The UID of the parent process's existing session keyring (f it has one),
>  as well as the UID of the caller's session keyring
>  much match the caller's effective UID.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
