From: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] localeconv.3: Add description of the function is not thread-safe
Date: Sun, 17 Mar 2013 11:07:58 +0100
Message-ID: <CAKgNAkhzs0vxsbTYkAEV3x493RZedTek0Sm5s3++OFOi1VK=HA@mail.gmail.com>
References: <1363085000-6967-1-git-send-email-penght@cn.fujitsu.com>
Reply-To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1363085000-6967-1-git-send-email-penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

Hello Peng,

On Tue, Mar 12, 2013 at 11:43 AM, Peng Haitao <penght-BthXqXjhjHXQFUHtdCDX3A@public.gmane.org> wrote:
> The function localeconv() returns a pointer to a structure which might be
> overwritten by subsequent calls to localeconv() or by calls to setlocale(),
> so it is not thread-safe.

I've applied this patch in my local branch for the ATTRIBUTES work.

See also my general comments in the reply to the ecvt.3 patch.

Here we have a page that could do with other improvements also, and it
is probably worth making such improvements as we go. What I mean is:
the page make no other mention that the returned pointer may (okay, in
glibc *does*) point to a statically allocated object that is
overwritten by subsequent calls. If you notice cases such as this, you
might like to add an extra piece to your patch, such as I have doe in
the patch below (I added some other details as well that I wouldn't
expect you to add), or you could alert me, and maybe I will add a
suitable patch.

Thanks for the patch.

Cheers,

Michael

diff --git a/man3/localeconv.3 b/man3/localeconv.3
index 80a2a21..b449211 100644
--- a/man3/localeconv.3
+++ b/man3/localeconv.3
@@ -49,6 +49,19 @@ Programs may also use the functions
 and
 .BR strfmon (3),
 which behave according to the actual locale in use.
+.SH RETURN VALUE
+The
+.BR localeconv ()
+function returns a pointer to a filled in
+.IR "struct lconv" .
+This structure may be (in glibc,
+.IR is )
+statically allocated, and may be overwritten by subsequent calls.
+According to POSIX,
+the caller should not modify the contents of this structure.
+The
+.BR localeconv ()
+function always succeeds.
 .SH ATTRIBUTES
 .SS Multithreading (see pthreads(7))
 The
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
