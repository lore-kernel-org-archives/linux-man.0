From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 4/5] printf: %m is supported by uclibc and musl, no %n in
 bionic
Date: Thu, 9 Jun 2016 10:37:45 +0200
Message-ID: <eef8bc8b-f717-4f06-4242-9916e975586c@gmail.com>
References: <1387586263-9002-1-git-send-email-shawn@churchofgit.com>
 <1387586263-9002-4-git-send-email-shawn@churchofgit.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387586263-9002-4-git-send-email-shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 12/21/2013 01:37 AM, Shawn Landden wrote:
> Signed-off-by: Shawn Landden <shawn-01I/ocv1qBBILuwUvNxBeQ@public.gmane.org>
> ---
>  man3/printf.3 | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/man3/printf.3 b/man3/printf.3
> index 20a3b5d..a861126 100644
> --- a/man3/printf.3
> +++ b/man3/printf.3
> @@ -791,10 +791,10 @@ The number of characters written so far is stored into the integer
>  indicated by the
>  .I "int\ *"
>  (or variant) pointer argument.
> -No argument is converted.
> +No argument is converted. (absent in bionic)
>  .TP
>  .B m
> -(Glibc extension.)
> +(Glibc extension. Supported by uClibc and musl)
>  Print output of
>  .IR strerror(errno) .
>  No argument is required.

Hi Shawn,

I applied a slightly different patch.

Cheers,

Michael

--- a/man3/printf.3
+++ b/man3/printf.3
@@ -817,11 +817,12 @@ That argument shall be an
 or variant whose size matches the (optionally)
 supplied integer length modifier.
 No argument is converted.
+(This specifier is not supported by the bionic C library.)
 The behavior is undefined if the conversion specification includes
 any flags, a field width, or a precision.
 .TP
 .B m
-(Glibc extension.)
+(Glibc extension; supported by uClibc and musl.)
 Print output of
 .IR strerror(errno) .
 No argument is required.
 


-- 
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Linux/UNIX System Programming Training: http://man7.org/training/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
