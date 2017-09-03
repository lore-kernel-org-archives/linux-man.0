From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] getrlimit.2: Mention unit used by RLIMIT_CORE and
 RLIMIT_FSIZE
Date: Sun, 3 Sep 2017 02:49:12 +0200
Message-ID: <07aa1031-91b5-f1ca-b23f-858c06c3a9f8@gmail.com>
References: <20170901202743.9678-1-bauerman@linux.vnet.ibm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170901202743.9678-1-bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Thiago,

On 09/01/2017 10:27 PM, Thiago Jung Bauermann wrote:
> It would have been obvious that these limits are in bytes, except that
> "ulimit -a" in at least bash, dash and zsh says that they're in blocks.
> This confused me, so I had to check the kernel source code.
> 
> My understanding is that they are indeed in bytes, so mention this
> information in the man page.

Thanks. That was a silly deficiency on the man page. Patch applied.
I also fixed a similar problem with RLIMIT_DATA.

Cheers,

Michael


> Signed-off-by: Thiago Jung Bauermann <bauerman-23VcF4HTsmIX0ybBhKVfKdBPR1lH4CV8@public.gmane.org>
> ---
>  man2/getrlimit.2 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man2/getrlimit.2 b/man2/getrlimit.2
> index 84f04d695ea2..f2c5297526d7 100644
> --- a/man2/getrlimit.2
> +++ b/man2/getrlimit.2
> @@ -150,7 +150,7 @@ This is the maximum size of a
>  .I core
>  file (see
>  .BR core (5))
> -that the process may dump.
> +in bytes that the process may dump.
>  When 0 no core dump files are created.
>  When nonzero, larger dumps are truncated to this size.
>  .TP
> @@ -187,7 +187,7 @@ which fail with the error
>  upon encountering the soft limit of this resource.
>  .TP
>  .B RLIMIT_FSIZE
> -This is the maximum size of files that the process may create.
> +This is the maximum size in bytes of files that the process may create.
>  Attempts to extend a file beyond this limit result in delivery of a
>  .B SIGXFSZ
>  signal.
> 
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
