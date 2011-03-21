From: Stefan Puiu <stefan.puiu-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: sendto() on UDP can return EACCES
Date: Mon, 21 Mar 2011 12:49:15 +0200
Message-ID: <AANLkTikmut_ro+FEiqgazjYz_hsJ3+wDK3xaDRUJj9+Y@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=485b397dd7a9f62aef049efbe0bb
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: lnx-man <linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-man@vger.kernel.org

--485b397dd7a9f62aef049efbe0bb
Content-Type: text/plain; charset=ISO-8859-1

Hi,

It seems sendto() can return EACCES for UDP as well; the current man
page in git only says it can return EACCES for Unix sockets:

EACCES
(For  UNIX  domain  sockets, which are identified by pathname) Write
permission is denied on the destination socket file, or
              search permission is denied for one of the directories
the path prefix.  (See path_resolution(7).)

I was able to make sendto() return EACCES if I try to send from
192.168.1.1/24 to 192.168.1.0. I think the relevant code (in kernel
2.6.38, but also present in 2.6.7 and 2.6.32, the 2 kernels we use) is
this (net/ipv4/udp.c, udp_sendmsg()):

 910                err = -EACCES;
 911                if ((rt->rt_flags & RTCF_BROADCAST) &&
 912                    !sock_flag(sk, SOCK_BROADCAST))
 913                        goto out;

So I guess if the kernel finds a route to the destination and it's a
broadcast route (and the socket doesn't have the broadcast flag), then
it returns EACCES.

I can verify the behavior with a very simple program (attached). I've
run it on my Ubuntu 10.10 (2.6.35 kernel) and got this:

stefan@spuiu-vml2:~/src/test/broadcast$ ./broadcast_test 10.205.20.94
10.205.20.1
sendto() returned 4
stefan@spuiu-vml2:~/src/test/broadcast$ ./broadcast_test 10.205.20.94
10.205.20.0
sendto() returned negative, errno: 13/Permission denied

(10.205.20.94 is my local IP, of course).

How about updating the send.2 page like this?

diff --git a/man2/send.2 b/man2/send.2
index 69287fb..4d2faed 100644
--- a/man2/send.2
+++ b/man2/send.2
@@ -288,6 +288,8 @@ or search permission is denied for one of the directories
 the path prefix.
 (See
 .BR path_resolution (7).)
+(For UDP sockets) An attempt was made to sendto() to a
+network/broadcast address like it was a unicast address.
 .TP
 .BR EAGAIN " or " EWOULDBLOCK
 .\" Actually EAGAIN on Linux

Thanks,
Stefan.

--485b397dd7a9f62aef049efbe0bb
Content-Type: text/x-csrc; charset=US-ASCII; name="broadcast_test.c"
Content-Disposition: attachment; filename="broadcast_test.c"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_glj9r2vl0

CiNpbmNsdWRlIDxzdGRpby5oPgoKI2luY2x1ZGUgPHN5cy90eXBlcy5oPgojaW5jbHVkZSA8c3lz
L3NvY2tldC5oPgojaW5jbHVkZSA8bmV0aW5ldC9pbi5oPgojaW5jbHVkZSA8YXJwYS9pbmV0Lmg+
CiNpbmNsdWRlIDxlcnJuby5oPgojaW5jbHVkZSA8c3RkbGliLmg+CgppbnQgbWFpbihpbnQgYXJn
YywgY2hhciAqKmFyZ3YpCnsKICAgIGludCBzb2NrOwoKICAgIGlmIChhcmdjIDwgMikgewogICAg
ICAgIHByaW50ZigiVXNhZ2U6ICVzIGxvY2FsX2FkZHJlc3MgZGVzdGluYXRpb25fYWRkcmVzc1xu
IiwgYXJndlswXSk7CiAgICAgICAgZXhpdCgxKTsKICAgIH0KCiAgICBzb2NrID0gc29ja2V0KEFG
X0lORVQsIFNPQ0tfREdSQU0sIDApOwogICAgaWYgKHNvY2sgPCAwKSB7CiAgICAgICAgcGVycm9y
KCJzb2NrZXQiKTsKICAgICAgICByZXR1cm4gLTE7CiAgICB9CgogICAgc3RydWN0IHNvY2thZGRy
X2luIGxvY2FsX2FkZHI7CiAgICBsb2NhbF9hZGRyLnNpbl9mYW1pbHkgPSBBRl9JTkVUOwogICAg
bG9jYWxfYWRkci5zaW5fcG9ydCA9IGh0b25zKDEyMzQpOwogICAgbG9jYWxfYWRkci5zaW5fYWRk
ci5zX2FkZHIgPSBpbmV0X2FkZHIoYXJndlsxXSk7CiAgICBpbnQgcmV0ID0gYmluZChzb2NrLCAo
c3RydWN0IHNvY2thZGRyICopICZsb2NhbF9hZGRyLCBzaXplb2YobG9jYWxfYWRkcikpOwogICAg
aWYgKHJldCA8IDApIHsKICAgICAgICBwZXJyb3IoImJpbmQiKTsKICAgICAgICByZXR1cm4gLTE7
CiAgICB9CiAgICAKICAgIHN0cnVjdCBzb2NrYWRkcl9pbiByZW1vdGVfYWRkcjsKICAgIHJlbW90
ZV9hZGRyLnNpbl9mYW1pbHkgPSBBRl9JTkVUOwogICAgcmVtb3RlX2FkZHIuc2luX3BvcnQgPSBo
dG9ucygxMjM0KTsKICAgIHJlbW90ZV9hZGRyLnNpbl9hZGRyLnNfYWRkciA9IGluZXRfYWRkcihh
cmd2WzJdKTsKICAgIHJldCA9IHNlbmR0byhzb2NrLCAiYmxhaCIsIDQsIDAsIChzdHJ1Y3Qgc29j
a2FkZHIgKikmcmVtb3RlX2FkZHIsIHNpemVvZihyZW1vdGVfYWRkcikpOwogICAgaWYgKHJldCA8
IDApIHsKICAgICAgICBwcmludGYoInNlbmR0bygpIHJldHVybmVkIG5lZ2F0aXZlLCBlcnJubzog
JWQvJW1cbiIsIGVycm5vKTsKICAgIH0KICAgIGVsc2UgewogICAgICAgIHByaW50Zigic2VuZHRv
KCkgcmV0dXJuZWQgJWRcbiIsIHJldCk7ICAgICAgICAKICAgIH0KCiAgICByZXR1cm4gMDsKfQo=
--485b397dd7a9f62aef049efbe0bb--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
