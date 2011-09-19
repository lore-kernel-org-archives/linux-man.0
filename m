From: Michael Kerrisk <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] fallocate.2: document FALLOC_FL_PUNCH_HOLE
Date: Mon, 19 Sep 2011 07:06:31 +0200
Message-ID: <CAKgNAkhOM4VDrBZASy9DXEJ24vooX2-JY3v6o0LFY4shLa3TWQ@mail.gmail.com>
References: <AANLkTimeEM-Zrcr2-hRUCW1gO_NYCh9=6mTXo5f11dq3@mail.gmail.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <AANLkTimeEM-Zrcr2-hRUCW1gO_NYCh9=6mTXo5f11dq3-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>, Dave Chinner <dchinner-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

Hello Lucian,

On Fri, Jan 14, 2011 at 1:35 AM, Lucian Adrian Grijincu
<lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org> wrote:
> This functionality landed in Linux 2.6.38 since:
>
> commit 79124f18b335172e1916075c633745e12dae1dac
> Author: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> Date: =A0 Wed Nov 17 20:46:15 2010 -0500
>
> =A0 =A0fs: add hole punching to fallocate
>
> =A0 =A0Hole punching has already been implemented by XFS and OCFS2, a=
nd has the
> =A0 =A0potential to be implemented on both BTRFS and EXT4 so we need =
a
> generic way to
> =A0 =A0get to this feature. =A0The simplest way in my mind is to add
> FALLOC_FL_PUNCH_HOLE
> =A0 =A0to fallocate() since it already looks like the normal fallocat=
e() operation.
> =A0 =A0I've tested this patch with XFS and BTRFS to make sure XFS did=
 what it's
> =A0 =A0supposed to do and that BTRFS failed like it was supposed to. =
=A0Thank you,
>
> CC: Josef Bacik <josef-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
> CC: Al Viro <viro-RmSDqhL/yNMiFSDQTTA3OLVCufUGDwFn@public.gmane.org>
> Signed-off-by: Lucian Adrian Grijincu <lucian.grijincu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> ---
> =A0man2/fallocate.2 | =A0 22 +++++++++++++++++++++-
> =A01 files changed, 21 insertions(+), 1 deletions(-)

Pasting your patch back in line (which is preferred):

=3D=3D=3D=3D
diff --git a/man2/fallocate.2 b/man2/fallocate.2
index 42eefbd..1279130 100644
--- a/man2/fallocate.2
+++ b/man2/fallocate.2
@@ -32,7 +32,7 @@ bytes.
 The
 .I mode
 argument determines the operation to be performed on the given range.
-Currently only one flag is supported for
+There are two flag values supported for
 .IR mode :
 .TP
 .B FALLOC_FL_KEEP_SIZE
@@ -59,6 +59,26 @@ even if it is less than
 .\" All of the above flags were debated upon and we can not say
 .\" if any/which one of these flags will make it to the later kernels.
 .PP
+.TP
+.BR FALLOC_FL_PUNCH_HOLE " (since Linux 2.6.38)
+Deallocate space inside a file in the byte range starting at
+.I offset
+and continuing for
+.I len
+bytes.
+Partial filesystem blocks are zeroed, and
+whole filesystem blocks are removed from the file.
+Currently you can only have
+.BR FALLOC_FL_PUNCH_HOLE
+with
+.BR FALLOC_FL_KEEP_SIZE
+set,
+so the file size (as reported by
+.BR stat (2))
+does not change
+when hole punching, even when puching the end of
+a file off.
+.PP
 If
 .B FALLOC_FL_KEEP_SIZE
 flag is not specified in
=3D=3D=3D=3D=3D

Josef actually sent me a patch describing FALLOC_FL_PUNCH_HOLE a while
back which I never applied yet, but in some ways your patch is better
(nice work!), so I'll apply your patch, and add some fixes from
Josef's patch afterwards.

Cheers,

Michael

--=20
Michael Kerrisk
Linux man-pages maintainer; http://www.kernel.org/doc/man-pages/
Author of "The Linux Programming Interface"; http://man7.org/tlpi/
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
