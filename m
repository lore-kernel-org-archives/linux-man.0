From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 1/4] crypt.3: wfix: encryption is not done with SHA-xxx,
 but with a function based on SHA-xxx.
Date: Mon, 4 Sep 2017 01:38:47 +0200
Message-ID: <b3db3cd0-0e40-d50e-fe58-78f8619c6aa9@gmail.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
 <1504455396-760-2-git-send-email-konstantin@shemyak.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-2-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 09/03/2017 06:16 PM, Konstantin Shemyak wrote:
> Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>

Hi Konstantin,

Could you add some info saying how you checked/discovered
the details changed by this commit message?

Also, a minor nit: this is not a "wfix" commit. It changes the
meaning of the text.

Thanks,

Michael


> ---
>  man3/crypt.3 | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 9edd63a..749a636 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -227,9 +227,9 @@ _
>  .TE
>  .RE
>  .PP
> -So $5$\fIsalt\fP$\fIencrypted\fP is an SHA-256 encoded
> -password and $6$\fIsalt\fP$\fIencrypted\fP is an
> -SHA-512 encoded one.
> +So $5$\fIsalt\fP$\fIencrypted\fP and $6$\fIsalt\fP$\fIencrypted\fP
> +contain the password encrypted correspondingly with a function
> +based on SHA-256 and SHA-512.
>  .PP
>  "\fIsalt\fP" stands for the up to 16 characters
>  following "$\fIid\fP$" in the salt.
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
