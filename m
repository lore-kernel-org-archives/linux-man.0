From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/4] crypt.3: Added description of previously undocumented
 'rounds' parameter
Date: Mon, 4 Sep 2017 01:43:51 +0200
Message-ID: <40dd8935-bd18-8705-55ea-0c04036667d8@gmail.com>
References: <1504455396-760-1-git-send-email-konstantin@shemyak.com>
 <1504455396-760-5-git-send-email-konstantin@shemyak.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1504455396-760-5-git-send-email-konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Konstantin

On 09/03/2017 06:16 PM, Konstantin Shemyak wrote:
> Signed-off-by: Konstantin Shemyak <konstantin-gSWgoXPz5bhBDgjK7y7TUQ@public.gmane.org>

So, this man page change should mention the glibc version where this
parameter was introduced. It looks like glibc 2.7. Can you confirm
and update the patch?

Also, in the commit message, it would be good to note how the various
details were discovered/can be verified from source code. For example,
mention the following from crypt/sha512-crypt.c:

/* Default number of rounds if not explicitly specified.  */
#define ROUNDS_DEFAULT 5000
/* Minimum number of rounds.  */
#define ROUNDS_MIN 1000
/* Maximum number of rounds.  */
#define ROUNDS_MAX 999999999

> ---
>  man3/crypt.3 | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 375ef93..b9cf973 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -249,6 +249,21 @@ In the MD5 and SHA implementations the entire
>  .I key
>  is significant (instead of only the first
>  8 bytes in DES).
> +.PP
> +SHA-256 and SHA-512 implementations support user-supplied number of
> +hashing rounds, defaulting to 5000.
> +If the "$\fIid\fP$" characters in the salt are
> +followed by "rounds=\fIxxx\fP$" and \fIxxx\fP is an integer, then the
> +result has the form
> +.RS
> +.PP
> +$\fIid\fP$\fIrounds=yyy\fP$\fIsalt\fP$\fIencrypted\fP
> +.PP
> +.RE
> +where \fIyyy\fP is the actual number of hashing rounds used.
> +This actual number is 1000 if the supplied number is less than 1000,

Change first part to" The number actually used is 1000..."

> +999999999 if the supplied number is greater than 999999999, and
> +equal to the supplied number otherwise.
>  .SH SEE ALSO
>  .BR login (1),
>  .BR passwd (1),

Thanks,

Michael


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
