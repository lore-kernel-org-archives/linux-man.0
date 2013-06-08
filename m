From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] bootparam.7: rdev was removed as of 2012
Date: Sat, 08 Jun 2013 04:53:37 +0200
Message-ID: <51B29CB1.7000705@gmail.com>
References: <20130221005704.GE19381@nt1.in>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130221005704.GE19381-9epcXJ+zteU@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Regid Ichira <regid23-9epcXJ+zteU@public.gmane.org>
Cc: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

On 02/21/13 01:57, Regid Ichira wrote:
> Reference: https://git.kernel.org/?p=utils/util-linux/util-linux.git;a=commit;h=a3e40c14651fccf18e7954f081e601389baefe3f

Thanks, Regid. I applied this patch.

Cheers,

Michael



> ---
> Applied to 3.47, on top of
> 191a77d - Michael Kerrisk, 2013-02-18 : accept.2: NAME: Add "accept4"
> ---
>  man7/bootparam.7 |   20 ++++----------------
>  1 file changed, 4 insertions(+), 16 deletions(-)
> 
> diff --git a/man7/bootparam.7 b/man7/bootparam.7
> index 1ca4ea8..934eb66 100644
> --- a/man7/bootparam.7
> +++ b/man7/bootparam.7
> @@ -42,10 +42,6 @@ which you copied a kernel using 'cp zImage /dev/fd0'),
>  you have no opportunity to specify any parameters.
>  So, in order to take advantage of this possibility you have to
>  use software that is able to pass parameters, like LILO or loadlin.
> -For a few parameters one can also modify the kernel image itself,
> -using rdev, see
> -.BR rdev (8)
> -for further details.
>  
>  The LILO program (LInux LOader) written by Werner Almesberger is the
>  most commonly used.
> @@ -177,8 +173,6 @@ system that the kernel was built on.
>  To override this value, and
>  select the second floppy drive as the root device, one would
>  use 'root=/dev/fd1'.
> -(The root device can also be set using
> -.BR rdev (8).)
>  
>  The root device can be specified symbolically or numerically.
>  A symbolic specification has the form /dev/XXYN, where XX designates
> @@ -218,8 +212,6 @@ as read/write capable, for example, by 'mount \-w \-n \-o remount /'.
>  The 'rw' option tells the kernel to mount the root file system read/write.
>  This is the default.
>  
> -The choice between read-only and read/write can also be set using
> -.BR rdev (8).
>  .TP
>  .B "'reserve=...'"
>  This is used to protect I/O port regions from probes.
> @@ -379,13 +371,10 @@ before the main disk can be accessed.
>  In Linux 1.3.48, ramdisk handling was changed drastically.
>  Earlier, the memory was allocated statically, and there was
>  a 'ramdisk=N' parameter to tell its size.
> -(This could also
> -be set in the kernel image at compile time, or by use of
> -.BR rdev (8).)
> +(This could also be set in the kernel image at compile time.)
>  These days ram disks use the buffer cache, and grow dynamically.
> -For a lot of information (e.g., how to use
> -.BR rdev (8)
> -in conjunction with the new ramdisk setup), see
> +For a lot of information in conjunction with the new ramdisk
> +setup), see
>  .IR /usr/src/linux/Documentation/ramdisk.txt .
>  
>  There are four parameters, two boolean and two integral.
> @@ -1297,8 +1286,7 @@ Braille machines.
>  .BR lilo.conf (5),
>  .BR klogd (8),
>  .BR lilo (8),
> -.BR mount (8),
> -.BR rdev (8)
> +.BR mount (8)
>  
>  Large parts of this man page have been derived from the
>  Boot Parameter HOWTO (version 1.0.1) written by Paul Gortmaker.
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
