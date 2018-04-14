From: Rical Jasan <rj@2c3t.io>
Subject: Re: [PATCH 2/2] crypt.3, encrypt.3: Add notes about _XOPEN_CRYPT.
Date: Fri, 13 Apr 2018 21:43:16 -0700
Message-ID: <67f35157-514b-a996-5fd5-78d70eb87395@2c3t.io>
References: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <libc-alpha-return-91548-glibc-alpha=m.gmane.org@sourceware.org>
List-Unsubscribe: <mailto:libc-alpha-unsubscribe-glibc-alpha=m.gmane.org@sourceware.org>
List-Subscribe: <mailto:libc-alpha-subscribe@sourceware.org>
List-Archive: <http://sourceware.org/ml/libc-alpha/>
List-Post: <mailto:libc-alpha@sourceware.org>
List-Help: <mailto:libc-alpha-help@sourceware.org>, <http://sourceware.org/ml/#faqs>
Sender: libc-alpha-owner@sourceware.org
In-Reply-To: <6d9a7e45-5d31-efbd-78ad-2808d492eb21@redhat.com>
To: Carlos O'Donell <carlos@redhat.com>, "linux-man@vger.kernel.org" <linux-man@vger.kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Florian Weimer <fweimer@redhat.com>, Zack Weinberg <zackw@panix.com>, GNU C Library <libc-alpha@sourceware.org>
List-Id: linux-man@vger.kernel.org

On 04/12/2018 12:05 PM, Carlos O'Donell wrote:
> diff --git a/man3/crypt.3 b/man3/crypt.3
> index 3e6552ad8..58c62d93d 100644
> --- a/man3/crypt.3
> +++ b/man3/crypt.3
> @@ -188,8 +188,26 @@ POSIX.1-2001, POSIX.1-2008, SVr4, 4.3BSD.
>  .BR crypt_r ()
>  is a GNU extension.
>  .SH NOTES
> -.SS Glibc notes
> -The glibc2 version of this function supports additional
> +.SS Availability in glibc
> +The
> +.BR crypt (),
> +.BR encrypt (),
> +and
> +.BR setkey ()
> +functions are part of the POSIX.1-2008 XSI Options Group for Encryption
> +and are optional. If the interfaces are not available then the symbolic
> +constant
> +.BR _XOPEN_CRYPT
> +is either not defined or defined to -1, and can be checked at runtime with
> +.BR sysconf ().
> +This may be the case if the downstream distribution has switched from glibc
> +crypt to libxcrypt.  When recompiling applications in such distributions the
> +user must detect if
> +.BR _XOPEN_CRPYT

"CRYPT"

(Looks like this was caught already.)

> +is not available and include crypt.h for the function prototypes; otherwise
> +libxcrypt is a ABI compatible drop-in replacement.

"an ABI"

I would also hyphenate "ABI-compatible".

(The same issues were also in encrypt.3 but it sounds like the content
was deduplicated already.)


Rical
