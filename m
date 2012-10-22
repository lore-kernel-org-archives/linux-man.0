From: Simon Paillard <spaillard-8fiUuRrzOP0dnm+yROfE0A@public.gmane.org>
Subject: Re: Bug#604928: stat.2: EOVERFLOW not only for st_size; bit/byte
 confusion
Date: Tue, 23 Oct 2012 01:55:00 +0200
Message-ID: <20121022235500.GA16004@glenfiddich.mraw.org>
References: <20101125140830.GA14353@capsaicin.mamane.lu>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20101125140830.GA14353-rNNsFfiJtZ89bTkMJW/ABGJiwOkYxero@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lionel Elie Mamane <lionel-vlyxx04YXHqHXe+LvDLADg@public.gmane.org>, 604928-61a8vm9lEZVf4u+23C9RwQ@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Control: -1 found 3.42-1

On Thu, Nov 25, 2010 at 03:08:30PM +0100, Lionel Elie Mamane wrote:
> stat(2) says:
> 
> ERRORS
>  (...)
>    EOVERFLOW
>      (stat())  path  refers to a file whose size cannot be represented in the
>      type off_t.  This can occur when an application compiled on a 32-bit
>      platform without -D_FILE_OFFSET_BITS=64 calls stat() on a file whose
>      size exceeds (2<<31)-1 bits.
> 
> 1) It would seem to me that the condition for this to occur would be a
>    file whose size exceeds (2<<31)-1 *bytes*, not "bits".

Still applicable to manpages 3.43.
 
> 2) I got this for an overflow on st_ino (64 bit kernel, 32 bit
>    userland, CIFS mount of a Windows-served share).

Confirmed with
OpenGroup:  http://pubs.opengroup.org/onlinepubs/009695399/functions/stat.html
   [EOVERFLOW]
      The file size in bytes or the number of blocks allocated to the file or
      the file serial number cannot be represented correctly in the structure
      pointed to by buf.

egblic: sysdeps/unix/sysv/linux/xstatconv.c it can be st_ino, st_size or st_blocks
 
> So I'd suggest this text become something along the lines of:
> 
>    path or fd refers to a file for which the value of a field of the
>    stat structure cannot be represented in its type. This usually
>    occurs with applications compiled on a 32-bit platform without
>    -D_FILE_OFFSET_BITS=64. The most common occurrence is when such an
>    application calls stat() on a file whose size exceeds
>    (2<<31)-1 bytes; but it can also occur e.g. for the st_ino field,
>    e.g. when such an application is run on a 64 bit kernel.

An other proposal attached.

-- 
Simon Paillard

--BOKacYhQ+x31HxR3
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="604928.EOVERFLOW.diff"

diff --git a/man2/stat.2 b/man2/stat.2
index 0b82e1d..fb2f9dd 100644
--- a/man2/stat.2
+++ b/man2/stat.2
@@ -343,15 +343,18 @@ is not a directory.
 .B EOVERFLOW
 .RB ( stat ())
 .I path
-refers to a file whose size cannot be represented in the type
-.IR off_t .
-This can occur when an application compiled on a 32-bit platform without
+refers to a file whose size, inode number, or number of blocks cannot be represented in their respective type
+.IR off_t ,
+.IR ino_t ,
+or
+.IR blkcnt_t .
+This usually occurs when an application compiled on a 32-bit platform without
 .I -D_FILE_OFFSET_BITS=64
 calls
 .BR stat ()
 on a file whose size exceeds
 .I (1<<31)-1
-bits.
+bytes.
 .SH "CONFORMING TO"
 These system calls conform to SVr4, 4.3BSD, POSIX.1-2001.
 .\" SVr4 documents additional

--BOKacYhQ+x31HxR3--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
