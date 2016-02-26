From: Bill Kerr <bilker-7Y6McbBI5zQ@public.gmane.org>
Subject: patch getaddrinfo.3 with "protocol independent" information
Date: Thu, 25 Feb 2016 19:01:51 -0800
Message-ID: <56CFC01F.60702@pan.org>
Reply-To: bilker-7Y6McbBI5zQ@public.gmane.org
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------080400020907020101050702"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, Jerry Cooperstein <coop-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------080400020907020101050702
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Michael,

I'm one of the instructors for the Linux Foundation.  Jerry Cooperstein 
posted a note to the instructor's mailing list that he's going to update 
the network programming chapters of LFD312.  A couple of us suggested 
that he retire the exercises that use the obsolete library calls 
gethostbyname(3) and friends, replacing with with code using getaddrinfo(3).

I noted that a lot of example code out there, including (sigh) early 
editions of the Richard Stevens book "UNIX  Network Programming, Vol. 1" 
fail to accomplish what Stevens says is a goal of network programming:  
"protocol independence."

A "protocol independent" server exposes the server's socket at ALL of 
the server's IP addresses:  IPv4 and IPv6, local and remote.

The current getaddrinfo(3) man page gets PART of the way to instructing 
how to do this.

The missing part is that after setting the "hints" struct to ai_family = 
AF_UNSPEC and ai_flags = AI_PASSIVE, the code needs to CHECK the 
"ai_family" of each candidate address in the list returned by 
getaddrinfo(3) to preferentially choose AF_INET6 over AF_INET.

If the server (preferentially) binds to an IPv6 address, qualified as 
"AF_UNSPEC" and "AI_PASSIVE" in the hints, then the resulting socket 
will be visible at ANY and ALL of the server's IP addresses. If the 
server binds to an IPv4 address candidate (because the address 
candidates in the list aren't checked before trying to bind), then the 
socket is unavailable to clients trying any of the server's IPv6 
addresses.  This is arguably an inferior result.

I attach a patch file against the top of  the man-pages tree (version 
4.05) with modifications to two parts of man3/getaddrinfo.3:

   -> the section describing AF_UNSPEC is expanded with a "programming 
note" describing how to write a "protocol independent" server.

   -> the "server" example code has about 6 lines of code added, PLUS an 
expansion of the block comment before the loop that walks the list 
returned by getaddrinfo(3).

Thanks for considering this patch.  Please let me know what I've done 
horribly wrong, and I'll try to fix it.  I think this is somewhat 
important, as writing "protocol independent" servers is fairly 
important, and MOST of the code examples out on the Web and elsewhere 
don't CHECK the address candidates when walking the list returned by 
getaddrinfo(3).   That's all that needs to be done to make network 
servers better.

  == Bill Kerr
         bilker-7Y6McbBI5zQ@public.gmane.org
         503 781-7946


--------------080400020907020101050702
Content-Type: text/x-patch;
 name="getaddrinfo.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="getaddrinfo.patch"

ZGlmZiAtTmF1ciBtYW4tcGFnZXMtb3JpZy9tYW4zL2dldGFkZHJpbmZvLjMgbWFuLXBhZ2Vz
L21hbjMvZ2V0YWRkcmluZm8uMwotLS0gbWFuLXBhZ2VzLW9yaWcvbWFuMy9nZXRhZGRyaW5m
by4zCTIwMTYtMDItMjUgMTY6MTI6MTAuOTE4NTYzMjMwIC0wODAwCisrKyBtYW4tcGFnZXMv
bWFuMy9nZXRhZGRyaW5mby4zCTIwMTYtMDItMjUgMDg6NTI6MjcuMDQ5MDU3NTMzIC0wODAw
CkBAIC0xNTQsNyArMTU0LDIwIEBACiAoZWl0aGVyIElQdjQgb3IgSVB2NiwgZm9yIGV4YW1w
bGUpIHRoYXQgY2FuIGJlIHVzZWQgd2l0aAogLkkgbm9kZQogYW5kCi0uSVIgc2VydmljZSAu
CisuSVIgc2VydmljZSAuICAKKy5JIFByb2dyYW1taW5nIE5vdGU6ICAKK2luIG9yZGVyIHRv
IGNyZWF0ZSBhIHNlcnZlciBzb2NrZXQgdGhhdCBjYW4gYmUgcmVhY2hlZCBhdAorLkkgYm90
aAordGhlIHNlcnZlcidzIElQdjQgYW5kIElQdjYgYWRkcmVzc2VzLCB5b3Ugc2hvdWxkCisu
SSBwcmVmZXJlbnRpYWxseQorYmluZCB3aXRoIEFGX0lORVQ2IGFkZHJlc3NlcyByZXR1cm5l
ZCBieQorLkJSIGdldGFkZHJpbmZvICgpICwKK2FzIGJpbmRpbmcgd2l0aCBhbiBBRl9JTkVU
IGFkZHJlc3Mgd2lsbCBjcmVhdGUgYSBzb2NrZXQgaW5jYXBhYmxlCitvZiBhY2NlcHRpbmcg
Y29ubmVjdGlvbnMgb24gdGhlIHNlcnZlcidzIElQdjYgYWRkcmVzc2VzLiAgSW4gb3RoZXIg
d29yZHMsCithcyB5b3Ugd2FsayB0aGUgbGlzdCBvZiBjYW5kaWRhdGUgYWRkcmVzc2VzLCB5
b3Ugc2hvdWxkIHByZWZlcgorYmluZGluZyB3aXRoIHRob3NlIHdob3NlCisuSSBhaV9mYW1p
bHkKK2lzIEFGX0lORVQ2LCByYXRoZXIgdGhhbiBBRl9JTkVULgogLlRQCiAuSSBhaV9zb2Nr
dHlwZQogVGhpcyBmaWVsZCBzcGVjaWZpZXMgdGhlIHByZWZlcnJlZCBzb2NrZXQgdHlwZSwg
Zm9yIGV4YW1wbGUKQEAgLTY3NSw2ICs2ODgsNyBAQAogICAgIHNvY2tsZW5fdCBwZWVyX2Fk
ZHJfbGVuOwogICAgIHNzaXplX3QgbnJlYWQ7CiAgICAgY2hhciBidWZbQlVGX1NJWkVdOwor
ICAgIGludCBsb29wczsKIAogICAgIGlmIChhcmdjICE9IDIpIHsKICAgICAgICAgZnByaW50
ZihzdGRlcnIsICJVc2FnZTogJXMgcG9ydFxcbiIsIGFyZ3ZbMF0pOwpAQCAtNjk3LDIyICs3
MTEsMzkgQEAKICAgICB9CiAKICAgICAvKiBnZXRhZGRyaW5mbygpIHJldHVybnMgYSBsaXN0
IG9mIGFkZHJlc3Mgc3RydWN0dXJlcy4KLSAgICAgICBUcnkgZWFjaCBhZGRyZXNzIHVudGls
IHdlIHN1Y2Nlc3NmdWxseSBiaW5kKDIpLgotICAgICAgIElmIHNvY2tldCgyKSAob3IgYmlu
ZCgyKSkgZmFpbHMsIHdlIChjbG9zZSB0aGUgc29ja2V0Ci0gICAgICAgYW5kKSB0cnkgdGhl
IG5leHQgYWRkcmVzcy4gKi8KLQotICAgIGZvciAocnAgPSByZXN1bHQ7IHJwICE9IE5VTEw7
IHJwID0gcnBcLT5haV9uZXh0KSB7Ci0gICAgICAgIHNmZCA9IHNvY2tldChycFwtPmFpX2Zh
bWlseSwgcnBcLT5haV9zb2NrdHlwZSwKLSAgICAgICAgICAgICAgICBycFwtPmFpX3Byb3Rv
Y29sKTsKLSAgICAgICAgaWYgKHNmZCA9PSBcLTEpCi0gICAgICAgICAgICBjb250aW51ZTsK
KyAgICAgICBQYXNzIHRocm91Z2ggdGhlIGxpc3QgVVAgVE8gdHdpY2UuICBPbiB0aGUgZmly
c3QgcGFzcywKKyAgICAgICBTS0lQIGFkZHJlc3NlcyB0aGF0IGFyZSBOT1QgQUZfSU5FVDYu
ICBJZiBzb2NrZXQoMikgYW5kCisgICAgICAgYmluZCgyKSBib3RoIHN1Y2NlZWQgb24gYSBj
YW5kaWRhdGUsIHdlIGFyZSBkb25lLiAgRWxzZSwKKyAgICAgICBjbG9zZSB0aGUgc29ja2V0
IGFuZCB0cnkgdGhlIG5leHQgYWRkcmVzcy4gIElmIHdlIGRpZG4ndAorICAgICAgIGZpbmQg
YW4gSVB2NiBhZGRyZXNzIG9uIHRoZSBmaXJzdCBwYXNzLCB0cnkgYSBzZWNvbmQgcGFzcywK
KyAgICAgICB0aGlzIHRpbWUgdHJ5IEFMTCBjYW5kaWRhdGVzIGluIHRoZSBsaXN0LiAgSWYg
d2UgZ2V0IGFuCisgICAgICAgSVB2NiBhZGRyZXNzLCB0aGUgImhpbnRzIiBBRl9VTlNQRUMg
YW5kIEFJX1BBU1NJVkUgd2lsbAorICAgICAgIGVuc3VyZSB0aGF0IHRoZSBzb2NrZXQgY2Fu
IGJlIHJlYWNoZWQgYnkgYWxsIGNsaWVudCBwcm9ncmFtcworICAgICAgIHRyeWluZyBBTlkg
b2Ygb3VyIElQIGFkZHJlc3NlczogIHY0IG9yIHY2LCBsb2NhbCBvciByZW1vdGUuCisgICAg
ICAgVGhpcyBpcyBhbiB1c2VmdWwgYW5kIGltcG9ydGFudCBwcm9wZXJ0eSBvZiBuZXR3b3Jr
CisgICAgICAgcHJvZ3JhbW1pbmcgY2FsbGVkICJwcm90b2NvbCBpbmRlcGVuZGVuY2UuIiAg
U2VlIFJpY2hhcmQKKyAgICAgICBTdGV2ZW5zLCAiVU5JWCAgTmV0d29yayBQcm9ncmFtbWlu
ZywgVm9sLiAxIi4gKi8KKyAgICAgICAKKyAgICBmb3IgKGxvb3BzID0gMDsgbG9vcHMgPCAy
OyBsb29wcysrKSB7CisgICAgICAgIGZvciAocnAgPSByZXN1bHQ7IHJwICE9IE5VTEw7IHJw
ID0gcnBcLT5haV9uZXh0KSB7CisKKyAgICAgICAgICAgIC8qIFNLSVAgYWxsIGJ1dCBJUHY2
IGNhbmRpZGF0ZXMgb24gMXN0IHBhc3MgKi8KKyAgICAgICAgICAgIGlmIChsb29wcyA9PSAw
ICYmIHJwXC0+YWlfZmFtaWx5ICE9IEFGX0lORVQ2KQorICAgICAgICAgICAgICAgICAgICBj
b250aW51ZTsKKworICAgICAgICAgICAgc2ZkID0gc29ja2V0KHJwXC0+YWlfZmFtaWx5LCBy
cFwtPmFpX3NvY2t0eXBlLAorICAgICAgICAgICAgICAgICAgICBycFwtPmFpX3Byb3RvY29s
KTsKKyAgICAgICAgICAgIGlmIChzZmQgPT0gXC0xKQorICAgICAgICAgICAgICAgIGNvbnRp
bnVlOwogCi0gICAgICAgIGlmIChiaW5kKHNmZCwgcnBcLT5haV9hZGRyLCBycFwtPmFpX2Fk
ZHJsZW4pID09IDApCi0gICAgICAgICAgICBicmVhazsgICAgICAgICAgICAgICAgICAvKiBT
dWNjZXNzICovCisgICAgICAgICAgICBpZiAoYmluZChzZmQsIHJwXC0+YWlfYWRkciwgcnBc
LT5haV9hZGRybGVuKSA9PSAwKQorICAgICAgICAgICAgICAgIGdvdG8gb3V0OyAgICAgICAg
ICAgICAgICAgIC8qIFN1Y2Nlc3MgKi8KIAotICAgICAgICBjbG9zZShzZmQpOworICAgICAg
ICAgICAgY2xvc2Uoc2ZkKTsKKyAgICAgICAgfQogICAgIH0KIAorb3V0OgogICAgIGlmIChy
cCA9PSBOVUxMKSB7ICAgICAgICAgICAgICAgLyogTm8gYWRkcmVzcyBzdWNjZWVkZWQgKi8K
ICAgICAgICAgZnByaW50ZihzdGRlcnIsICJDb3VsZCBub3QgYmluZFxcbiIpOwogICAgICAg
ICBleGl0KEVYSVRfRkFJTFVSRSk7Cg==
--------------080400020907020101050702--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
