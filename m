From: "Michael Kerrisk (man-opages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] keyctl.2: remove parentheses from the crypto API URL
 description
Date: Mon, 11 Sep 2017 16:25:48 +0200
Message-ID: <954fd991-2469-c7c1-89a3-d0d7756dec03@gmail.com>
References: <20170911031114.GA5337@asgard.redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170911031114.GA5337-ZbobWygYI+YXGNroddHbYwC/G2K4zDHf@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/11/2017 05:11 AM, Eugene Syromyatnikov wrote:
> Those look unnecessary when rendered either as text or HTML.

Thanks. Patch applied.

Cheers,

Michael


> * man2/keyctl.2 (.SH DESCRIPTION) <.TP .BR KEYCTL_DH_COMPUTE>: Remove
> parentheses around "Kernel Crypto API Architecture".
> 
> Signed-off-by: Eugene Syromyatnikov <evgsyr-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
>   man2/keyctl.2 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/man2/keyctl.2 b/man2/keyctl.2
> index 1975602..8a05087 100644
> --- a/man2/keyctl.2
> +++ b/man2/keyctl.2
> @@ -1508,7 +1508,7 @@ field is a null-terminated string which specifies a hash name
>   (available in the kernel's crypto API; the list of the hashes available
>   is rather tricky to observe; please refer to the
>   .UR https://www.kernel.org/doc/html/latest/crypto/architecture.html
> -("Kernel Crypto API Architecture")
> +"Kernel Crypto API Architecture"
>   .UE
>   documentation for the information regarding how hash names are constructed and
>   your kernel's source and configuration regarding what ciphers
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
