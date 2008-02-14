From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [PATCH 1/3] syslog: Add type 10
Date: Thu, 14 Feb 2008 19:53:49 +0100
Message-ID: <47B48E3D.8040504@gmail.com>
References: <1202861911.329926.179390617729.qpush@pokey>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1202861911.329926.179390617729.qpush@pokey>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Jeremy,

Jeremy Kerr wrote:
> Since 2.6.6, we've had another type (10) option to the syslog syscall,
> this change adds it to the syslog manpage.
> 
> Signed-off-by: Jeremy Kerr <jk-mnsaURCQ41sdnm+yROfE0A@public.gmane.org>
> 
> ---
> 
>  man2/syslog.2 |    9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> Index: man-pages-2.77/man2/syslog.2
> ===================================================================
> --- man-pages-2.77.orig/man2/syslog.2
> +++ man-pages-2.77/man2/syslog.2
> @@ -66,19 +66,20 @@ Quoting from
>   *      7 \-\- Enable printk's to console
>   *      8 \-\- Set level of messages printed to console
>   *      9 \-\- Return number of unread characters in the log buffer
> + *     10 \-\- Return size of the log buffer
>   */
>  .fi
>  
> -Only function 3 is allowed to non-root processes.
> -(Function 9 was added in 2.4.10.)
> +Only functions 3 and 10 are allowed to non-root processes.

A nicely caught detail; confirmed.

> +(Function 9 was added in 2.4.10, function 10 in 2.6.6)

Version number confirmed.  Thanks for attending to that detail.

>  .B The kernel log buffer
>  .br
>  The kernel has a cyclic buffer of length
>  .B LOG_BUF_LEN
>  (4096, since 1.3.54: 8192, since 2.1.113: 16384; in recent kernels
> -the size can be set at compile time) in which messages given as argument
> -to the kernel function
> +the size can be queried with function 10) in which messages given as
> +argument to the kernel function
>  .BR printk ()
>  are stored
>  (regardless of their loglevel).

Patch applied for man-pages-2.79.

But it seems to me that the piece on LOG_BUF_LEN was somewhat out of date.
 I reworked it as the following (could you confirm these details?):

===
The kernel has a cyclic buffer of length
.B LOG_BUF_LEN
in which messages given as arguments to the kernel function
.BR printk ()
are stored (regardless of their loglevel).
In early kernels,
.B LOG_BUF_LEN
had the value 4096;
from kernel 1.3.54, it was 8192;
from kernel 2.1.113 it was 16384;
since 2.4.23/2.6 the value is a kernel configuration option.
.\" Under "General setup" ==> "Kernel log buffer size"
In recent kernels the size can be queried with command type 10.
===

Cheers,

Michael

-- 
Michael Kerrisk
Maintainer of the Linux man-pages project
http://www.kernel.org/doc/man-pages/
Want to report a man-pages bug?  Look here:
http://www.kernel.org/doc/man-pages/reporting_bugs.html
