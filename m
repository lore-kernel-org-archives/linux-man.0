From: =?ISO-8859-1?Q?Zsb=E1n_Ambrus?= <ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org>
Subject: Fwd: [PATCH] linux man-pages ioctl_list(2) FAT_IOCTL_GET_ATTRIBUTES
Date: Sat, 3 Apr 2010 18:37:21 +0200
Message-ID: <z2h25d4951c1004030937xf216955aja619eb4322125e59@mail.gmail.com>
References: <j2n25d4951c1004030936ia8b558e9w8951691fb29a6693@mail.gmail.com>
Reply-To: ambrus-4iFmikrsyIeT9ig0jae3mg@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=00148531b974ebff01048357b6b8
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <j2n25d4951c1004030936ia8b558e9w8951691fb29a6693-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--00148531b974ebff01048357b6b8
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Dear linux man-pages,

The attached patch adds four ioctls from linux/msdos_fs.h to the
ioctl_list(2) manpage.

The ioctl FAT_IOCTL_GET_ATTRIBUTES reads FAT attributes of a file a
mounted vfat file system. =A0I tested this on Linux 2.6.33, an example
script can be found at "http://www.perlmonks.com/?node_id=3D832623".

The constants are a bit difficult to access, you may need to include
the following headers to get them defined correctly (and the order
matters; and even then they are defined the have the wrong type,
unsigned long instead of int): <sys/types.h> <sys/ioctl.h>
<linux/types.h> <linux/dirent.h> <linux/msdos_fs.h>. =A0Do you suppose
this should be mentioned in the manpage?

Ambrus

--00148531b974ebff01048357b6b8
Content-Type: text/x-diff; charset=US-ASCII; name="fatioc.diff"
Content-Disposition: attachment; filename="fatioc.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_g7kn1n8h0

LS0tIC4vaW9jdGxfbGlzdC4yCTIwMTAtMDQtMDMgMTc6NTI6MzkuMDAwMDAwMDAwICswMjAwCisr
KyAuL2lvY3RsX2xpc3QuMgkyMDEwLTA0LTAzIDE4OjIzOjMxLjAwMDAwMDAwMCArMDIwMApAQCAt
NDMwLDggKzQzMCwxNyBAQAogMHgwMDAwODlFMAlTSU9DR0VUVklGQ05UCXN0cnVjdCBzaW9jX3Zp
Zl9yZXEgKgkvLyBJLU8KIDB4MDAwMDg5RTEJU0lPQ0dFVFNHQ05UCXN0cnVjdCBzaW9jX3NnX3Jl
cSAqCS8vIEktTwogLlRFCiAKKy8vIDxpbmNsdWRlL2xpbnV4L21zZG9zX2ZzLmg+CisuVFMKK2wg
bCBsIGwuCisweDgyMzA3MjAxCVZGQVRfSU9DVExfUkVBRERJUl9CT1RICXN0cnVjdCBkaXJlbnQg
WzJdCisweDgyMzA3MjAyCVZGQVRfSU9DVExfUkVBRERJUl9TSE9SVAlzdHJ1Y3QgZGlyZW50IFsy
XQorMHg4MDA0NzIxMAlGQVRfSU9DVExfR0VUX0FUVFJJQlVURVMJX191MzIgKgorMHg0MDA0NzIx
MQlGQVRfSU9DVExfU0VUX0FUVFJJQlVURVMJY29uc3QgX191MzIgKgorLlRFCisKIC8vIDxpbmNs
dWRlL2xpbnV4L210aW8uaD4KIC5UUwogbCBsIGwgbC4KIDB4NDAwODZEMDEJTVRJT0NUT1AJY29u
c3Qgc3RydWN0IG10b3AgKgo=
--00148531b974ebff01048357b6b8--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
