From: =?ISO-8859-1?Q?Manuel_L=F3pez=2DIb=E1=F1ez?=
	<lopezibanez-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [patch] pow.3: Add note on performance characteristics of pow
Date: Fri, 17 Oct 2014 15:51:06 +0200
Message-ID: <CAESRpQB5K9U1sBreXUrNa4tPB69cwxC+fdu1bUr5BkU-dtxJMQ@mail.gmail.com>
References: <CAESRpQDx5TfgfRp1q69NiuCB5ve8+fR1NC2up9h5LOkogMKkqQ@mail.gmail.com>
 <5440A816.8000002@gmail.com> <20141017075845.GL1552@spoyarek.pnq.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=001a11c3498c4cf16805059ea962
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141017075845.GL1552-EBXREzpM9Zo4v7BKUif6HKfLeoKvNuZc@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Cc: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, GNU C Library <libc-alpha-9JcytcrH/bA+uJoB2kUjGw@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--001a11c3498c4cf16805059ea962
Content-Type: text/plain; charset=ISO-8859-1

On 17 October 2014 09:58, Siddhesh Poyarekar <siddhesh-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org> wrote:
>> > +inputs. The inputs that produce such behavior are different for
>> > +.BR powf (),
>> > +.BR pow ()
>> > +and
>> > +.BR powl ().
>> > +
>
> The slow fallback is only taken for pow, not powf or powl.

Updated patch inline:

diff --git a/man3/pow.3 b/man3/pow.3
index d0a2ea8..1b05292 100644
--- a/man3/pow.3
+++ b/man3/pow.3
@@ -320,6 +320,18 @@ The variant returning
 also conforms to
 SVr4, 4.3BSD, C89.
 .SH BUGS
+On 64-bits,
+.\"
+.\" https://sourceware.org/bugzilla/show_bug.cgi?id=13932
+.BR pow ()
+may be more than 10,000 times slower for some (rare) inputs than for
other nearby
+inputs.  This only affects
+.BR pow (),
+and not
+.BR powf ()
+nor
+.BR powl ().
+
 In glibc 2.9 and earlier,
 .\"
 .\" http://sources.redhat.com/bugzilla/show_bug.cgi?id=6776

and attached in case gmail messes it up.

Cheers,

Manuel.

--001a11c3498c4cf16805059ea962
Content-Type: text/plain; charset=US-ASCII; name="pow.diff"
Content-Disposition: attachment; filename="pow.diff"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_i1dlgt2w0

ZGlmZiAtLWdpdCBhL21hbjMvcG93LjMgYi9tYW4zL3Bvdy4zCmluZGV4IGQwYTJlYTguLjFiMDUy
OTIgMTAwNjQ0Ci0tLSBhL21hbjMvcG93LjMKKysrIGIvbWFuMy9wb3cuMwpAQCAtMzIwLDYgKzMy
MCwxOCBAQCBUaGUgdmFyaWFudCByZXR1cm5pbmcKIGFsc28gY29uZm9ybXMgdG8KIFNWcjQsIDQu
M0JTRCwgQzg5LgogLlNIIEJVR1MKK09uIDY0LWJpdHMsCisuXCIKKy5cIiBodHRwczovL3NvdXJj
ZXdhcmUub3JnL2J1Z3ppbGxhL3Nob3dfYnVnLmNnaT9pZD0xMzkzMgorLkJSIHBvdyAoKQorbWF5
IGJlIG1vcmUgdGhhbiAxMCwwMDAgdGltZXMgc2xvd2VyIGZvciBzb21lIChyYXJlKSBpbnB1dHMg
dGhhbiBmb3Igb3RoZXIgbmVhcmJ5CitpbnB1dHMuICBUaGlzIG9ubHkgYWZmZWN0cyAKKy5CUiBw
b3cgKCksCithbmQgbm90IAorLkJSIHBvd2YgKCkKK25vcgorLkJSIHBvd2wgKCkuCisKIEluIGds
aWJjIDIuOSBhbmQgZWFybGllciwKIC5cIgogLlwiIGh0dHA6Ly9zb3VyY2VzLnJlZGhhdC5jb20v
YnVnemlsbGEvc2hvd19idWcuY2dpP2lkPTY3NzYK
--001a11c3498c4cf16805059ea962--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
