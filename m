From: =?iso-8859-1?q?Andr=E9_Goddard_Rosa?= <andre.goddard-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [patch] tsearch.3: dispose properly of allocated resources in example code
Date: Sun, 21 Sep 2008 03:10:43 -0300
Message-ID: <200809210310.43647.andre.goddard@gmail.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_jVe1Ixwyq86eTsK"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--Boundary-00=_jVe1Ixwyq86eTsK
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: base64
Content-Disposition: inline

QXMgdGhlcmUgYXJlIG1hbnkgdXNlcnMgd2hvIGJhc2UgdGhlaXIgb3duIGNvZGUgb24gdGhlc2Ug
ZXhhbXBsZXMsIHdlIHNob3VsZCBhdm9pZCBsZWFraW5nIG1lbW9yeSB3aGVuIHVzaW5nIGZ1bmN0
aW9ucyBvZiB0c2VhcmNoKCkgZmFtaWx5LgpJbiB0aGUgcHJvdmlkZWQgZXhhbXBsZSwgdHNlYXJj
aCgpIGxlYWtzIG1lbW9yeSB3aGVuZXZlciBpdCB0cmllcyB0byBpbnNlcnQgYSBudW1iZXIgd2hp
Y2ggd2FzIGFscmVhZHkgaW5zZXJ0ZWQgYmVmb3JlLgoKUGxlYXNlIENDIG1lLCBhcyBJtG0gbm90
IHN1YnNjcmliZWQuCgpBcHBsaWVzIHRvIG1hbi1wYWdlcy0zLjA5LgoKLS0tIG1hbjMvdHNlYXJj
aC4zCTIwMDgtMDktMTAgMTA6MTY6MTMuMDAwMDAwMDAwIC0wMzAwCisrKyBtYW4zL3RzZWFyY2gu
My5nb2RkYXJkCTIwMDgtMDktMjEgMDI6NDI6NTUuMDAwMDAwMDAwIC0wMzAwCkBAIC0yNDYsOCAr
MjQ2LDExIEBACiAgICAgICAgIHZhbCA9IHRzZWFyY2goKHZvaWQgKikgcHRyLCAmcm9vdCwgY29t
cGFyZSk7CiAgICAgICAgIGlmICh2YWwgPT0gTlVMTCkKICAgICAgICAgICAgIGV4aXQoRVhJVF9G
QUlMVVJFKTsKKyAgICAgICAgZWxzZSBpZiAoISgoKihpbnQgKiopIHZhbCkgPT0gcHRyKSkKKyAg
ICAgICAgICAgIGZyZWUocHRyKTsKICAgICB9CiAgICAgdHdhbGsocm9vdCwgYWN0aW9uKTsKKyAg
ICB0ZGVzdHJveShyb290LCBmcmVlKTsKICAgICBleGl0KEVYSVRfU1VDQ0VTUyk7CiB9CiAuZmkK
AAo=

--Boundary-00=_jVe1Ixwyq86eTsK
Content-Type: text/x-patch;
  charset="utf-8";
  name="tsearch3-free-allocated-resources.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="tsearch3-free-allocated-resources.patch"

--- man3/tsearch.3	2008-09-10 10:16:13.000000000 -0300
+++ man3/tsearch.3.goddard	2008-09-21 02:42:55.000000000 -0300
@@ -246,8 +246,11 @@
         val = tsearch((void *) ptr, &root, compare);
         if (val == NULL)
             exit(EXIT_FAILURE);
+        else if (!((*(int **) val) == ptr))
+            free(ptr);
     }
     twalk(root, action);
+    tdestroy(root, free);
     exit(EXIT_SUCCESS);
 }
 .fi

--Boundary-00=_jVe1Ixwyq86eTsK--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
