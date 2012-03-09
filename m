From: "D. Barbier" <bouzim-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: man-pages-3.37 released
Date: Fri, 9 Mar 2012 20:03:21 +0100
Message-ID: <CAMqf4EHcasSC=UXmUxsu9F1_jzPcgx8K0XFYU2tXn=FBMmfVng@mail.gmail.com>
References: <CAKgNAkjJSkf68TG2A5Ls9H8XoaaOuh44H4M7xJCWH_yRUgBpEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=e89a8ff24c7b1628f604bad40d88
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAKgNAkjJSkf68TG2A5Ls9H8XoaaOuh44H4M7xJCWH_yRUgBpEQ-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--e89a8ff24c7b1628f604bad40d88
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Le 9 mars 2012 18:28, Michael Kerrisk (man-pages) a =C3=A9crit :
> Gidday,
>
> The Linux man-pages maintainer proudly announces:
>
> =C2=A0 man-pages-3.37.tar.gz - man pages for Linux
[...]

Hello Michael,

There is an nroff syntax error in man2/ptrace.2:

diff --git a/man2/ptrace.2 b/man2/ptrace.2
index 37c4dff..775a26d 100644
--- a/man2/ptrace.2
+++ b/man2/ptrace.2
@@ -726,7 +726,7 @@ group-stop, PTRACE_EVENT stops, syscall-stops
 .BR PTRACE_SINGLESTEP ,
 .BR PTRACE_SYSEMU ,
 and
-.BE PTRACE_SYSEMU_SINGLESTEP .
+.BR PTRACE_SYSEMU_SINGLESTEP .
 They all are reported by
 .BR waitpid (2)
 with


Denis

--e89a8ff24c7b1628f604bad40d88
Content-Type: text/x-patch; charset=US-ASCII; name="ptrace.patch"
Content-Disposition: attachment; filename="ptrace.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gzllrn140

ZGlmZiAtLWdpdCBhL21hbjIvcHRyYWNlLjIgYi9tYW4yL3B0cmFjZS4yCmluZGV4IDM3YzRkZmYu
Ljc3NWEyNmQgMTAwNjQ0Ci0tLSBhL21hbjIvcHRyYWNlLjIKKysrIGIvbWFuMi9wdHJhY2UuMgpA
QCAtNzI2LDcgKzcyNiw3IEBAIGdyb3VwLXN0b3AsIFBUUkFDRV9FVkVOVCBzdG9wcywgc3lzY2Fs
bC1zdG9wcwogLkJSIFBUUkFDRV9TSU5HTEVTVEVQICwKIC5CUiBQVFJBQ0VfU1lTRU1VICwKIGFu
ZAotLkJFIFBUUkFDRV9TWVNFTVVfU0lOR0xFU1RFUCAuCisuQlIgUFRSQUNFX1NZU0VNVV9TSU5H
TEVTVEVQIC4KIFRoZXkgYWxsIGFyZSByZXBvcnRlZCBieQogLkJSIHdhaXRwaWQgKDIpCiB3aXRo
Cg==
--e89a8ff24c7b1628f604bad40d88--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
