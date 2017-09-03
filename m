From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/4] crypt.3: ffix: added missing formatting
Date: Mon, 4 Sep 2017 01:27:50 +0200
Message-ID: <6b09b3be-da6e-b065-c06a-7363af7324dc@gmail.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
 <1504455396-760-3-git-send-email-konstantin@shemyak.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-3-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/03/2017 06:16 PM, Konstantin Shemyak wrote:
> Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>

Applied. Thanks, Konstantin.

Cheers,

Michael

> ---
>  man3/crypt.3 | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 749a636..1bd8509 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -233,7 +233,8 @@ based on SHA-256 and SHA-512.
>  .PP
>  "\fIsalt\fP" stands for the up to 16 characters
>  following "$\fIid\fP$" in the salt.
> -The encrypted part of the password string is the actual computed password.
> +The "\fIencrypted\fP"
> +part of the password string is the actual computed password.
>  The size of this string is fixed:
>  .TS
>  l l.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
