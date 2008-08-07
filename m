From: Michael Kerrisk <mtk.manpages-gM/Ye1E23mwN+BqQ9rBEUg@public.gmane.org>
Subject: Re: [patch] mprotect.2: removal of EFAULT from mprotect man page
Date: Thu, 07 Aug 2008 15:35:53 +0200
Message-ID: <489AFA39.6030705@gmail.com>
References: <9debc4410808042221u2dcd955ap62db32c7034608f8@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <9debc4410808042221u2dcd955ap62db32c7034608f8-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maxin John <maxin.john-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hi Maxin,

Maxin John wrote:
> Dear Michael,
> 
>               As per the discussion in linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, I
> am sending the patch for removal of EFAULT from mprotect.2 man page to
> the linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org mailing list.
> 
> Signed-off-by: Maxin B. John <maxin.john-qujY0cBTTHtBDgjK7y7TUQ@public.gmane.org>
> 
> 
> diff -Naur man-pages-3.05/man2/mprotect.2
> man-pages-3.05_modified/man2/mprotect.2
> --- man-pages-3.05/man2/mprotect.2      2008-07-23 19:42:13.000000000 +0530
> +++ man-pages-3.05_modified/man2/mprotect.2     2008-08-04
> 15:34:33.400869088 +0530
> @@ -87,9 +87,6 @@
>  to mark it
>  .BR PROT_WRITE .
>  .TP
> -.B EFAULT
> -The memory cannot be accessed.
> -.TP
>  .B EINVAL
>  \fIaddr\fP is not a valid pointer,
>  or not a multiple of the system page size.

As per the discussion at http://thread.gmane.org/gmane.linux.kernel/714574/,
I've actually made the change as shown below (for man-pages-3.07).  Seem
okay to you?

Cheers,

Michael


===================================================================
--- mprotect.2  (revision 3957)
+++ mprotect.2  (working copy)
@@ -87,9 +87,6 @@
  to mark it
  .BR PROT_WRITE .
  .TP
-.B EFAULT
-The memory cannot be accessed.
-.TP
  .B EINVAL
  \fIaddr\fP is not a valid pointer,
  or not a multiple of the system page size.
@@ -97,11 +94,16 @@
  .TP
  .B ENOMEM
  Internal kernel structures could not be allocated.
-Or: addresses in the range
+.TP
+.B ENOMEM
+Addresses in the range
  .RI [ addr ,
  .IR addr + len ]
  are invalid for the address space of the process,
  or specify one or more pages that are not mapped.
+(Before kernel 2.4.19, the error
+.BR EFAULT
+was incorrectly produced for these cases.)
  .SH "CONFORMING TO"
  SVr4, POSIX.1-2001.
  .\" SVr4 defines an additional error


--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
