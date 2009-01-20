From: "Lucio Maciel" <luciofm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] getifaddrs.3: fix a memory leak in sample code
Date: Tue, 20 Jan 2009 10:29:40 -0200
Message-ID: <1d5458980901200429u43337162ydc8e016c3e8b39d9@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_Part_41802_5864033.1232454580409"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

------=_Part_41802_5864033.1232454580409
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi, there is a memory leak in the sample usage code in the getifaddrs
(3) man page.

The code doesnt save the head pointer of the list, an then passes a
NULL pointer to the freeifaddrs(3) leaving all the memory unfreed.

L=FAcio Maciel
luciofm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org

------=_Part_41802_5864033.1232454580409
Content-Type: application/octet-stream; name=getifaddrs.diff
Content-Transfer-Encoding: base64
X-Attachment-Id: f_fq6jgrjw0
Content-Disposition: attachment; filename=getifaddrs.diff

LS0tIG1hbi1wYWdlcy0zLjE3L21hbjMvZ2V0aWZhZGRycy4zfgkyMDA5LTAxLTIwIDEwOjE0OjMx
LjAwMDAwMDAwMCAtMDIwMAorKysgbWFuLXBhZ2VzLTMuMTcvbWFuMy9nZXRpZmFkZHJzLjMJMjAw
OS0wMS0yMCAxMDoyMDowNy4wMDAwMDAwMDAgLTAyMDAKQEAgLTIzMywxNyArMjMzLDE4IEBACiBp
bnQKIG1haW4oaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKIHsKLSAgICBzdHJ1Y3QgaWZhZGRycyAq
aWZhZGRyOworICAgIHN0cnVjdCBpZmFkZHJzICppZmFkZHIsICpsaXN0OwogICAgIHN0cnVjdCBu
ZXRfZGV2aWNlX3N0YXRzICpuZHNwOwogICAgIGludCBmYW1pbHksIHM7CiAgICAgY2hhciBob3N0
W05JX01BWEhPU1RdOwogCi0gICAgaWYgKGdldGlmYWRkcnMoJmlmYWRkcikgPT0gXC0xKSB7Cisg
ICAgaWYgKGdldGlmYWRkcnMoJmxpc3QpID09IFwtMSkgewogICAgICAgICBwZXJyb3IoImdldGlm
YWRkcnMiKTsKICAgICAgICAgZXhpdChFWElUX0ZBSUxVUkUpOwogICAgIH0KIAotICAgIHdoaWxl
IChpZmFkZHIgIT0gTlVMTCkgeyAgICAvKiBXYWxrIHRocm91Z2ggbGlua2VkIGxpc3QgKi8KKyAg
ICAvKiBXYWxrIHRocm91Z2ggbGlua2VkIGxpc3QsIG1haW50YWluaW5nIHRoZSBoZWFkIHBvaW50
ZXIgKi8KKyAgICBmb3IgKGlmYWRkciA9IGxpc3Q7IGlmYWRkciAhPSBOVUxMOyBpZmFkZHIgPSBp
ZmFkZHJcLT5pZmFfbmV4dCkgewogICAgICAgICBmYW1pbHkgPSBpZmFkZHJcLT5pZmFfYWRkclwt
PnNhX2ZhbWlseTsKIAogICAgICAgICAvKiBEaXNwbGF5IGludGVyZmFjZSBuYW1lIGFuZCBmYW1p
bHkgKGluY2x1ZGluZyBzeW1ib2xpYwpAQCAtMjY4LDExICsyNjksOSBAQAogICAgICAgICAgICAg
fQogICAgICAgICAgICAgcHJpbnRmKCJcXHRhZGRyZXNzOiA8JXM+XFxuIiwgaG9zdCk7CiAgICAg
ICAgIH0KLQotICAgICAgICBpZmFkZHIgPSBpZmFkZHJcLT5pZmFfbmV4dDsKICAgICB9CiAKLSAg
ICBmcmVlaWZhZGRycyhpZmFkZHIpOworICAgIGZyZWVpZmFkZHJzKGxpc3QpOwogICAgIGV4aXQo
RVhJVF9TVUNDRVNTKTsKIH0KIC5maQo=
------=_Part_41802_5864033.1232454580409--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
