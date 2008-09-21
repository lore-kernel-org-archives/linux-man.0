From: =?iso-8859-1?q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] tsearch.3: dispose properly of allocated resources in example code
Date: Sun, 21 Sep 2008 03:15:21 -0300
Message-ID: <200809210315.21860.andre.goddard@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: base64
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-man@vger.kernel.org

QXMgdGhlcmUgYXJlIG1hbnkgdXNlcnMgd2hvIGJhc2UgdGhlaXIgb3duIGNvZGUgb24gdGhlc2Ug
ZXhhbXBsZXMsIHdlIHNob3VsZCBhdm9pZCBsZWFraW5nIG1lbW9yeSB3aGVuIHVzaW5nIGZ1bmN0
aW9ucyBvZiB0c2VhcmNoKCkgZmFtaWx5LgpJbiB0aGUgcHJvdmlkZWQgZXhhbXBsZSwgdHNlYXJj
aCgpIGxlYWtzIG1lbW9yeSB3aGVuZXZlciBpdCB0cmllcyB0byBpbnNlcnQgYSBudW1iZXIgd2hp
Y2ggd2FzIGFscmVhZHkgaW5zZXJ0ZWQgYmVmb3JlLgoKUGxlYXNlIENDIG1lLCBhcyBJtG0gbm90
IHN1YnNjcmliZWQuCgpBcHBsaWVzIHRvIG1hbi1wYWdlcy0zLjA5LgoKLS0tIG1hbjMvdHNlYXJj
aC4zCTIwMDgtMDktMTAgMTA6MTY6MTMuMDAwMDAwMDAwIC0wMzAwCisrKyBtYW4zL3RzZWFyY2gu
My5nb2RkYXJkCTIwMDgtMDktMjEgMDM6MTI6NDMuMDAwMDAwMDAwIC0wMzAwCkBAIC0yNDYsOCAr
MjQ2LDExIEBACiAgICAgICAgIHZhbCA9IHRzZWFyY2goKHZvaWQgKikgcHRyLCAmcm9vdCwgY29t
cGFyZSk7CiAgICAgICAgIGlmICh2YWwgPT0gTlVMTCkKICAgICAgICAgICAgIGV4aXQoRVhJVF9G
QUlMVVJFKTsKKyAgICAgICAgZWxzZSBpZiAoKCooaW50ICoqKSB2YWwpICE9IHB0cikKKyAgICAg
ICAgICAgIGZyZWUocHRyKTsKICAgICB9CiAgICAgdHdhbGsocm9vdCwgYWN0aW9uKTsKKyAgICB0
ZGVzdHJveShyb290LCBmcmVlKTsKICAgICBleGl0KEVYSVRfU1VDQ0VTUyk7CiB9CiAuZmkKAAo=
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
