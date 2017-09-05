From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 2/3] crypt.3: clarified that ending of the salt string
 with '$' is optional
Date: Tue, 5 Sep 2017 20:16:27 +0200
Message-ID: <69244957-d1ac-5ce3-86da-d2acd1c5392f@gmail.com>
References: <1504551233-26383-1-git-send-email-konstantin@shemyak.com>
 <1504551233-26383-3-git-send-email-konstantin@shemyak.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504551233-26383-3-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/04/2017 08:53 PM, Konstantin Shemyak wrote:
> In crypt/sha512-crypt.c::__sha512_crypt_r() and the similar sha256 function,
> the length of the actually used salt is calculated as:
> 
>   salt_len = MIN (strcspn (salt, "$"), SALT_LEN_MAX);
> 
> Thus the trailing '$' is optional in the salt string. One can check that
> crypt("key", "$5$salt")
> yields the same result as
> crypt("key", "$5$salt$").

Thanks, Konstantin. Applied.

Cheers,

Michael


> Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
> ---
>  man3/crypt.3 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 749a636..58fd33f 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -195,15 +195,15 @@ encryption algorithms.
>  If
>  .I salt
>  is a character string starting with the characters "$\fIid\fP$"
> -followed by a string terminated by "$":
> +followed by a string optionally terminated by "$",
> +then the result has the form:
>  .RS
>  .PP
>  $\fIid\fP$\fIsalt\fP$\fIencrypted\fP
>  .PP
>  .RE
> -then instead of using the DES machine,
>  .I id
> -identifies the encryption method used and this then determines how the rest
> +identifies the encryption method used instead of DES and this then determines how the rest
>  of the password string is interpreted.
>  The following values of
>  .I id
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
