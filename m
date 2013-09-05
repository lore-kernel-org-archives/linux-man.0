From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ffix: hyphen-used-as-minus-sign
Date: Thu, 05 Sep 2013 13:09:58 +0200
Message-ID: <52286686.1080706@gmail.com>
References: <1378337755-8807-1-git-send-email-spaillard@debian.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1378337755-8807-1-git-send-email-spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 05.09.2013 01:35, Simon Paillard wrote:
> See http://lintian.debian.org/tags/hyphen-used-as-minus-sign.html

Thanks, Simon. Applied.

Cheers,

Michael


> ---
>  man2/ptrace.2 |    2 +-
>  man2/setns.2  |    4 ++--
>  man7/glob.7   |    2 +-
>  man8/ld.so.8  |    2 +-
>  4 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/man2/ptrace.2 b/man2/ptrace.2
> index 60d5345..f52b43c 100644
> --- a/man2/ptrace.2
> +++ b/man2/ptrace.2
> @@ -1955,7 +1955,7 @@ file descriptor.
>  The usual symptom of this bug is that when you attach to
>  a quiescent process with the command
>  
> -    strace -p <process-ID>
> +    strace \-p <process-ID>
>  
>  then, instead of the usual
>  and expected one-line output such as
> diff --git a/man2/setns.2 b/man2/setns.2
> index 780cd80..614cc9c 100644
> --- a/man2/setns.2
> +++ b/man2/setns.2
> @@ -146,7 +146,7 @@ Password:
>  clone() returned 3550
>  uts.nodename in child:  bizarro
>  uts.nodename in parent: antero
> -# \fBuname -n\fP             # Verify hostname in the shell
> +# \fBuname \-n\fP             # Verify hostname in the shell
>  antero
>  .in
>  .fi
> @@ -159,7 +159,7 @@ set by the child created by the first program:
>  .nf
>  .in +4n
>  # \fB./ns_exec /proc/3550/ns/uts /bin/bash\fP
> -# \fBuname -n\fP             # Executed in shell started by ns_exec
> +# \fBuname \-n\fP             # Executed in shell started by ns_exec
>  bizarro
>  .in
>  .fi
> diff --git a/man7/glob.7 b/man7/glob.7
> index d6b52ce..98e6fc8 100644
> --- a/man7/glob.7
> +++ b/man7/glob.7
> @@ -120,7 +120,7 @@ With
>  .I bash
>  one can force the classical behavior using this command:
>  
> -    shopt -s nullglob
> +    shopt \-s nullglob
>  .\" In Bash v1, by setting allow_null_glob_expansion=true
>  
>  (Similar problems occur elsewhere.
> diff --git a/man8/ld.so.8 b/man8/ld.so.8
> index 76f31b0..eb358ad 100644
> --- a/man8/ld.so.8
> +++ b/man8/ld.so.8
> @@ -97,7 +97,7 @@ Thus, an application located in
>  .I somedir/app
>  could be compiled with
>  
> -    gcc -Wl,-rpath,\(aq$ORIGIN/../lib\(aq
> +    gcc \-Wl,\-rpath,\(aq$ORIGIN/../lib\(aq
>  
>  so that it finds an associated shared library in
>  .I somedir/lib
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
