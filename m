From: Akihiro Suda <suda.kyoto-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH] sched_setattr.2: callee's affinity matters, not caller's one.
Date: Sat, 2 Jan 2016 22:04:04 +0900
Message-ID: <CAG8fp8Sn2rRBxHPvpgU-k_XGDfEkZsKcopm8k9udajm_xGzARA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=089e013c65e0c49ad6052859857d
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--089e013c65e0c49ad6052859857d
Content-Type: text/plain; charset=UTF-8

Hi, all

sched_setattr.2 says:

 EPERM  The caller's CPU affinity mask does not include all CPUs in
the system (see sched_setaffinity(2)).


But it seems that callee's affinity matters, not caller's one.
http://lxr.free-electrons.com/source/kernel/sched/core.c?v=4.3#L3888

--089e013c65e0c49ad6052859857d
Content-Type: application/octet-stream;
	name="0001-sched_setattr.2-callee-s-affinity-matters-not-caller.patch"
Content-Disposition: attachment;
	filename="0001-sched_setattr.2-callee-s-affinity-matters-not-caller.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iix482du0

RnJvbSBmMmJkNTMyMzc0NDRkYzJjMzE4NTI2YzZhOWJhMGFiYzQ0NzU3N2RjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBa2loaXJvIFN1ZGEgPHN1ZGEuYWtpaGlyb0BsYWIubnR0LmNv
LmpwPgpEYXRlOiBTYXQsIDIgSmFuIDIwMTYgMjE6NTE6MjggKzA5MDAKU3ViamVjdDogW1BBVENI
XSBzY2hlZF9zZXRhdHRyLjI6IGNhbGxlZSdzIGFmZmluaXR5IG1hdHRlcnMsIG5vdCBjYWxsZXIn
cyBvbmUuCgpodHRwOi8vbHhyLmZyZWUtZWxlY3Ryb25zLmNvbS9zb3VyY2Uva2VybmVsL3NjaGVk
L2NvcmUuYz92PTQuMyNMMzg4OApTaWduZWQtb2ZmLWJ5OiBBa2loaXJvIFN1ZGEgPHN1ZGEuYWtp
aGlyb0BsYWIubnR0LmNvLmpwPgotLS0KIG1hbjIvc2NoZWRfc2V0YXR0ci4yIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
bWFuMi9zY2hlZF9zZXRhdHRyLjIgYi9tYW4yL3NjaGVkX3NldGF0dHIuMgppbmRleCBjNDExZjAx
Li5jZTZkMzM3IDEwMDY0NAotLS0gYS9tYW4yL3NjaGVkX3NldGF0dHIuMgorKysgYi9tYW4yL3Nj
aGVkX3NldGF0dHIuMgpAQCAtMzQxLDcgKzM0MSw3IEBAIGFyZSBpbnZhbGlkLgogVGhlIGNhbGxl
ciBkb2VzIG5vdCBoYXZlIGFwcHJvcHJpYXRlIHByaXZpbGVnZXMuCiAuVFAKIC5CIEVQRVJNCi1U
aGUgY2FsbGVyJ3MgQ1BVIGFmZmluaXR5IG1hc2sKK1RoZSBjYWxsZWUncyBDUFUgYWZmaW5pdHkg
bWFzawogZG9lcyBub3QgaW5jbHVkZSBhbGwgQ1BVcyBpbiB0aGUgc3lzdGVtCiAoc2VlCiAuQlIg
c2NoZWRfc2V0YWZmaW5pdHkgKDIpKS4KLS0gCjIuNS40IChBcHBsZSBHaXQtNjEpCgo=
--089e013c65e0c49ad6052859857d--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
