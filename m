From: Elie De Brauwer <eliedebrauwer-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: proc(5) and definition of loadavg
Date: Tue, 7 Feb 2012 08:48:39 +0100
Message-ID: <CAGWqfiiE01fhAYbVVyATu5=GkgekgV7-WCyZ6ZZwwrSv3XbDvA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary=14dae934038bda7c2b04b85b018d
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--14dae934038bda7c2b04b85b018d
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello all,

I've got a small suggestion related to man 5 proc (
http://www.kernel.org/doc/man-pages/online/pages/man5/proc.5.html ).
If you go to /proc/loadavg it states

<quote>
=A0The fourth field consists of two numbers separated by a slash (/).
The first of these is the number of currently executing kernel
scheduling entities (processes, threads); this will be less than or
equal to the number of CPUs. =A0The value after the slash is the number
of kernel scheduling entities that currently exist on the system.
</quote>

When I take a look at /proc/loadavg this seems to make sense:

edb@lapedb:~$ cat /proc/loadavg
0.04 0.65 0.59 1/284 8102

However, suppose I run 4 background jobs of 'yes bla > /dev/null &'

edb@lapedb:~$ yes bla > /dev/null &
[1] 8111
edb@lapedb:~$ yes bla > /dev/null &
[2] 8112
edb@lapedb:~$ yes bla > /dev/null &
[3] 8113
edb@lapedb:~$ yes bla > /dev/null &
[4] 8114
edb@lapedb:~$ cat /proc/loadavg
0.18 0.59 0.57 5/289 8115
edb@lapedb:~$ cat /proc/cpuinfo | grep processor
processor =A0 =A0 =A0 : 0
processor =A0 =A0 =A0 : 1

Then I see that the 'fourth field' before the slash is five, whereas
the number of cpu's (dual core laptop) is only two. Hence the 'this
will be less than or equal to the number of CPUs' in the manpage is
not correct. Now if we take a deeper look at how this /proc/loadavg
gets created (in fs/proc/loadavg.c):
http://lxr.linux.no/#linux+v3.0.4/fs/proc/loadavg.c#L23

We can see that the fourth value before the fraction is the result of
'nr_running()' which is turn lives in kern/sched.c (ref:
http://lxr.linux.no/#linux+v3.0.4/kernel/sched.c#L3197 ) and this
function just counts the number of runnable threads for each of the
online cpu's. I have attached a path which rephrases this, the patch
is rather trivial.



--
Elie De Brauwer

--14dae934038bda7c2b04b85b018d
Content-Type: text/x-patch; charset=US-ASCII;
	name="0019-Correct-definition-of-fourth-field-of-proc-loadavg.patch"
Content-Disposition: attachment;
	filename="0019-Correct-definition-of-fourth-field-of-proc-loadavg.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_gycmm3l10

RnJvbSA0N2QxOGYyYzI5NGI2ZWI1ODgwNjQyMTE5OTcyY2IzYWNjNTJkNDhhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFbGllIERlIEJyYXV3ZXIgPGVsaWVkZWJyYXV3ZXJAZ21haWwu
Y29tPgpEYXRlOiBUdWUsIDcgRmViIDIwMTIgMDg6NDE6MzUgKzAxMDAKU3ViamVjdDogW1BBVENI
IDE5LzE5XSBDb3JyZWN0IGRlZmluaXRpb24gb2YgZm91cnRoIGZpZWxkIG9mIC9wcm9jL2xvYWRh
dmcKCi0tLQogbWFuNS9wcm9jLjUgfCAgICA1ICsrLS0tCiAxIGZpbGVzIGNoYW5nZWQsIDIgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tYW41L3Byb2MuNSBiL21h
bjUvcHJvYy41CmluZGV4IDVhY2EzOGEuLjk4ODZjZTUgMTAwNjQ0Ci0tLSBhL21hbjUvcHJvYy41
CisrKyBiL21hbjUvcHJvYy41CkBAIC0xMzUxLDkgKzEzNTEsOCBAQCBUaGV5IGFyZSB0aGUgc2Ft
ZSBhcyB0aGUgbG9hZCBhdmVyYWdlIG51bWJlcnMgZ2l2ZW4gYnkKIC5CUiB1cHRpbWUgKDEpCiBh
bmQgb3RoZXIgcHJvZ3JhbXMuCiBUaGUgZm91cnRoIGZpZWxkIGNvbnNpc3RzIG9mIHR3byBudW1i
ZXJzIHNlcGFyYXRlZCBieSBhIHNsYXNoICgvKS4KLVRoZSBmaXJzdCBvZiB0aGVzZSBpcyB0aGUg
bnVtYmVyIG9mIGN1cnJlbnRseSBleGVjdXRpbmcga2VybmVsCi1zY2hlZHVsaW5nIGVudGl0aWVz
IChwcm9jZXNzZXMsIHRocmVhZHMpOwotdGhpcyB3aWxsIGJlIGxlc3MgdGhhbiBvciBlcXVhbCB0
byB0aGUgbnVtYmVyIG9mIENQVXMuCitUaGUgZmlyc3Qgb2YgdGhlc2UgaXMgdGhlIG51bWJlciBv
ZiBjdXJyZW50bHkgcnVubmFibGUga2VybmVsIAorc2NoZWR1bGluZyBlbnRpdGllcyAocHJvY2Vz
c2VzLCB0aHJlYWRzKS4KIFRoZSB2YWx1ZSBhZnRlciB0aGUgc2xhc2ggaXMgdGhlIG51bWJlciBv
ZiBrZXJuZWwgc2NoZWR1bGluZyBlbnRpdGllcwogdGhhdCBjdXJyZW50bHkgZXhpc3Qgb24gdGhl
IHN5c3RlbS4KIFRoZSBmaWZ0aCBmaWVsZCBpcyB0aGUgUElEIG9mIHRoZSBwcm9jZXNzIHRoYXQg
d2FzIG1vc3QKLS0gCjEuNy44LjMKCg==
--14dae934038bda7c2b04b85b018d--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
