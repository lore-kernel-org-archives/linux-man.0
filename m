From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] Standarize on "nonzero".
Date: Mon, 4 Dec 2017 20:50:45 +0100
Message-ID: <cc3bb6ed-f988-2b00-281a-c2c890ded972@gmail.com>
References: <20171203200934.7rmbcl2bzqf5hb4q@crack.deadbeast.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20171203200934.7rmbcl2bzqf5hb4q-Z0uaYDh/Ni4SozaZsD9aTtHuzzzSOjJt@public.gmane.org>
Content-Language: en-US
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "G. Branden Robinson" <g.branden.robinson-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/03/2017 09:09 PM, G. Branden Robinson wrote:
> Patch inline and attached.  "Nonzero" is by far the preferred term in
> the existing man pages, with roughly 180 occurrences compared to the
> handful I have changed below.

Thanks, Branden. Applied.

Cheers,

Michael


> Also add this term to the style guide in man-pages(7).
> 
> diff --git a/man1/iconv.1 b/man1/iconv.1
> index 9e66f988c..f66477d7b 100644
> --- a/man1/iconv.1
> +++ b/man1/iconv.1
> @@ -112,7 +112,7 @@ Print a short usage summary and exit.
>  Print the version number, license, and disclaimer of warranty for
>  .BR iconv .
>  .SH EXIT STATUS
> -Zero on success, non-zero on errors.
> +Zero on success, nonzero on errors.
>  .SH ENVIRONMENT
>  Internally, the
>  .B iconv
> diff --git a/man3/pthread_rwlockattr_setkind_np.3 b/man3/pthread_rwlockattr_setkind_np.3
> index 227e0af1c..defaf0d0b 100644
> --- a/man3/pthread_rwlockattr_setkind_np.3
> +++ b/man3/pthread_rwlockattr_setkind_np.3
> @@ -100,7 +100,7 @@ Given valid pointer arguments,
>  always succeeds.
>  On error,
>  .BR pthread_rwlockattr_setkind_np ()
> -returns a non-zero error number.
> +returns a nonzero error number.
>  .SH ERRORS
>  .TP
>  .BR EINVAL
> diff --git a/man7/man-pages.7 b/man7/man-pages.7
> index cf6727af9..1e2ee61e5 100644
> --- a/man7/man-pages.7
> +++ b/man7/man-pages.7
> @@ -682,6 +682,7 @@ filesystem	file system
>  hostname	host name
>  inode	i-node
>  lowercase	lower case, lower-case
> +nonzero	non-zero
>  pathname	path name
>  pseudoterminal	pseudo-terminal
>  privileged port	T{
> diff --git a/man7/socket.7 b/man7/socket.7
> index 1a2cfe9cc..64696d3b1 100644
> --- a/man7/socket.7
> +++ b/man7/socket.7
> @@ -319,7 +319,7 @@ or an extended BPF
>  program to the socket for use as a filter of incoming packets.
>  A packet will be dropped if the filter program returns zero.
>  If the filter program returns a
> -non-zero value which is less than the packet's data length,
> +nonzero value which is less than the packet's data length,
>  the packet will be truncated to the length returned.
>  If the value returned by the filter is greater than or equal to the
>  packet's data length, the packet is allowed to proceed unmodified.
> diff --git a/man8/iconvconfig.8 b/man8/iconvconfig.8
> index c5fdf3cfd..e94ad1e5a 100644
> --- a/man8/iconvconfig.8
> +++ b/man8/iconvconfig.8
> @@ -87,7 +87,7 @@ Print a short usage summary and exit.
>  Print the version number, license, and disclaimer of warranty for
>  .BR iconv .
>  .SH EXIT STATUS
> -Zero on success, non-zero on errors.
> +Zero on success, nonzero on errors.
>  .SH FILES
>  .TP
>  .I /usr/lib/gconv
> 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
