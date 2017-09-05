From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 1/3] crypt.3: encryption is not done with SHA-xxx, but
 with a function based on SHA-xxx
Date: Tue, 5 Sep 2017 19:51:38 +0200
Message-ID: <ab10a951-479b-d024-4ac6-d56e18ed9a96@gmail.com>
References: <1504551233-26383-1-git-send-email-konstantin@shemyak.com>
 <1504551233-26383-2-git-send-email-konstantin@shemyak.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504551233-26383-2-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Konstantin

On 09/04/2017 08:53 PM, Konstantin Shemyak wrote:
> The encryption is done by glibc functions __shaxxx_crypt_r() in files
> crypt/shaxxx-crypt.c. They implement a nontrivial algorithm to construct
> the inputs for the hashing functions and to apply them iteratively.
> 
> Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>

Thanks! Applied.

Cheers,

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
