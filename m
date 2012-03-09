From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: ld.so.8: formatting fix
Date: Fri, 9 Mar 2012 20:47:12 +0100
Message-ID: <CAMqf4EHbGwsucygbk4cw+cjjH=1Uh0tktai9mi7zcfrJJRhnpw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=e89a8ff254e0d849df04bad4a91e
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--e89a8ff254e0d849df04bad4a91e
Content-Type: text/plain; charset=UTF-8

Hello,

diff --git a/man8/ld.so.8 b/man8/ld.so.8
index 5c02204..2fbacae 100644
--- a/man8/ld.so.8
+++ b/man8/ld.so.8
@@ -126,6 +126,7 @@ Ignore RPATH and RUNPATH information in object
names in LIST.
 This option is ignored if
 .B ld.so
 is set-user-ID or set-group-ID.
+.TP
 .B \-\-audit LIST
 Use objects named in LIST as auditors.
 .SH ENVIRONMENT

--e89a8ff254e0d849df04bad4a91e
Content-Type: text/x-patch; charset=US-ASCII; name="ld.patch"
Content-Disposition: attachment; filename="ld.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gzlnbzcy0

ZGlmZiAtLWdpdCBhL21hbjgvbGQuc28uOCBiL21hbjgvbGQuc28uOAppbmRleCA1YzAyMjA0Li4y
ZmJhY2FlIDEwMDY0NAotLS0gYS9tYW44L2xkLnNvLjgKKysrIGIvbWFuOC9sZC5zby44CkBAIC0x
MjYsNiArMTI2LDcgQEAgSWdub3JlIFJQQVRIIGFuZCBSVU5QQVRIIGluZm9ybWF0aW9uIGluIG9i
amVjdCBuYW1lcyBpbiBMSVNULgogVGhpcyBvcHRpb24gaXMgaWdub3JlZCBpZgogLkIgbGQuc28K
IGlzIHNldC11c2VyLUlEIG9yIHNldC1ncm91cC1JRC4KKy5UUAogLkIgXC1cLWF1ZGl0IExJU1QK
IFVzZSBvYmplY3RzIG5hbWVkIGluIExJU1QgYXMgYXVkaXRvcnMuCiAuU0ggRU5WSVJPTk1FTlQK
--e89a8ff254e0d849df04bad4a91e--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
