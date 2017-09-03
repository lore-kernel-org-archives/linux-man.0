From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] crypt.3: wfix: clarified that ending of the salt
 string with '$' is optional
Date: Mon, 4 Sep 2017 01:38:33 +0200
Message-ID: <c03b9396-349c-8160-17ce-2ec6b558f01c@gmail.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
 <1504455396-760-4-git-send-email-konstantin@shemyak.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-4-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Konstantin,

On 09/03/2017 06:16 PM, Konstantin Shemyak wrote:
> Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>

Some details about how this was verified would be useful for the commit
message. Am I correct to assume that the relevant code is the following
in crypt/sha512-crypt.c::__sha512_crypt_r()

      if (*endp == '$')
        {
          salt = endp + 1;
          rounds = MAX (ROUNDS_MIN, MIN (srounds, ROUNDS_MAX));
          rounds_custom = true;
        }

and similar in crypt/sha256-crypt.c?

Thanks,

Michael

> ---
>  man3/crypt.3 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 1bd8509..375ef93 100644
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
