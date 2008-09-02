From: "Timothy S. Nelson" <wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org>
Subject: Patch to hsearch.3 from man-pages-3.08
Date: Tue, 2 Sep 2008 14:26:55 +1000 (EST)
Message-ID: <alpine.LRH.1.10.0809021415510.3454@gwalcmai.nelson.org.au>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=_gwalcmai-11739-1220329620-0001-2"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a MIME-formatted message.  If you see this text it means that your
E-mail software does not support MIME-formatted messages.

--=_gwalcmai-11739-1220329620-0001-2
Content-Type: text/plain; format=flowed; charset=us-ascii
Content-Transfer-Encoding: 7bit

 	Updated information obtained from:
a)	Reading the source of search.h on my Fedora system (uses __USE_GNU
 	instead of _GNU_SOURCE) -- this works in my test program
b)	Reading the documentation:
 	http://www.gnu.org/software/libc/manual/html_node/Hash-Search-Function.html#Hash-Search-Function

 	Having said that, though, it's mostly a reorganisation, and putting in 
little snippets of information that would've helped me.  I don't mind if the 
patch gets changed around or whatever, but I think the patch is an improvement 
on the current situation.  In particular, things I wondered about are:
-	I have no idea about groff; if anyone can think of improvements, go
 	for it (I did check it out with nroff -man though)
-	If it needs to be split into multiple pages (ie. hcreate*/hdestroy* on
 	a separate page from hsearch*), that's fine by me too

 	HTH,


---------------------------------------------------------------------
| Name: Tim Nelson                 | Because the Creator is,        |
| E-mail: wayland-r28gBBs99rhWo+R/V/U2/g@public.gmane.org    | I am                           |
---------------------------------------------------------------------

----BEGIN GEEK CODE BLOCK----
Version 3.12
GCS d+++ s+: a- C++$ U+++$ P+++$ L+++ E- W+ N+ w--- V- 
PE(+) Y+>++ PGP->+++ R(+) !tv b++ DI++++ D G+ e++>++++ h! y-
-----END GEEK CODE BLOCK-----

--=_gwalcmai-11739-1220329620-0001-2
Content-Type: text/plain; charset=us-ascii; name="man-pages-3.08-tsn1.patch"
Content-Transfer-Encoding: base64
Content-ID: <alpine.LRH.1.10.0809021426550.3454-/IIiqYPLJX27UUr8seqV7NQ83Er7SCjg@public.gmane.org>
Content-Description: 
Content-Disposition: attachment; filename=man-pages-3.08-tsn1.patch

ZGlmZiAtdXJOIG1hbi1wYWdlcy0zLjA4L21hbjMvaHNlYXJjaC4zIG1hbi1w
YWdlcy0zLjA4LXRzbjEvbWFuMy9oc2VhcmNoLjMNCi0tLSBtYW4tcGFnZXMt
My4wOC9tYW4zL2hzZWFyY2guMwkyMDA4LTA4LTI3IDE2OjA5OjAyLjAwMDAw
MDAwMCArMTAwMA0KKysrIG1hbi1wYWdlcy0zLjA4LXRzbjEvbWFuMy9oc2Vh
cmNoLjMJMjAwOC0wOS0wMiAxNDoxMTowNy4wMDAwMDAwMDAgKzEwMDANCkBA
IC00MSw3ICs0MSw3IEBADQogLnNwDQogLkIgInZvaWQgaGRlc3Ryb3kodm9p
ZCk7Ig0KIC5zcA0KLS5CICNkZWZpbmUgX0dOVV9TT1VSQ0UNCisuQiAjZGVm
aW5lIF9fVVNFX0dOVQ0KIC5icg0KIC5CICNpbmNsdWRlIDxzZWFyY2guaD4N
CiAuc3ANCkBAIC01OCwyMyArNTgsNjIgQEANCiAuQlIgaHNlYXJjaCAoKSwN
CiBhbmQNCiAuQlIgaGRlc3Ryb3kgKCkNCi1hbGxvdyB0aGUgdXNlciB0byBj
cmVhdGUgYSBoYXNoIHRhYmxlIChvbmx5IG9uZSBhdCBhIHRpbWUpDQorYWxs
b3cgdGhlIHVzZXIgdG8gY3JlYXRlIGFuZCBtYW5pcHVsYXRlIGEgaGFzaCB0
YWJsZSAob25seSBvbmUgYXQgYSB0aW1lKQ0KIHdoaWNoIGFzc29jaWF0ZXMg
YSBrZXkgd2l0aCBhbnkgZGF0YS4NCiAuUFANCitUaGUgdGhyZWUgZnVuY3Rp
b25zDQorLkJSIGhjcmVhdGVfciAoKSwNCisuQlIgaHNlYXJjaF9yICgpLA0K
Ky5CUiBoZGVzdHJveV9yICgpDQorYXJlIHJlZW50cmFudCB2ZXJzaW9ucyB0
aGF0IGFsbG93IHRoZSB1c2Ugb2YgbW9yZSB0aGFuIG9uZSB0YWJsZS4NCitU
aGUgbGFzdCBhcmd1bWVudCB1c2VkIGlkZW50aWZpZXMgdGhlIHRhYmxlLg0K
Ky5QUA0KKy5TUyAiaGNyZWF0ZSgpL2hjcmVhdGVfcigpIg0KKy5QUA0KIEZp
cnN0IHRoZSB0YWJsZSBtdXN0IGJlIGNyZWF0ZWQgd2l0aCB0aGUgZnVuY3Rp
b24NCi0uQlIgaGNyZWF0ZSAoKS4NCisuQlIgaGNyZWF0ZSAoKQ0KKy8NCisu
QlIgaGNyZWF0ZV9yICgpLg0KKy5UUA0KKy5CIEFyZ3VtZW50ICJuZWwiDQog
VGhlIGFyZ3VtZW50IFxmSW5lbFxmUCBpcyBhbiBlc3RpbWF0ZSBvZiB0aGUg
bWF4aW11bSBudW1iZXIgb2YgZW50cmllcw0KIGluIHRoZSB0YWJsZS4NCi1U
aGUgZnVuY3Rpb24NCi0uQlIgaGNyZWF0ZSAoKQ0KK1RoZSBjcmVhdGlvbiBm
dW5jdGlvbg0KIG1heSBhZGp1c3QgdGhpcyB2YWx1ZSB1cHdhcmQgdG8gaW1w
cm92ZSB0aGUNCiBwZXJmb3JtYW5jZSBvZiB0aGUgcmVzdWx0aW5nIGhhc2gg
dGFibGUuDQotLlBQDQorLlRQDQorLkIgQXJndW1lbnQgInRhYiINCitBcyBz
cGVjaWZpZWQgYWJvdmUsIGluIHRoZSBjYXNlIG9mIGhjcmVhdGVfciwgdGhp
cyBwb2ludHMgdG8gdGhlIA0KK3RhYmxlIHRvIGJlIGNyZWF0ZWQuICBUaGUg
c3RydWN0IGl0IHBvaW50cyB0byBtdXN0IGJlIG1hbGxvYydkIGFuZA0KK3pl
cm9lZCBiZWZvcmUgdGhlIGZpcnN0IGNhbGwgdG8NCisuQlIgaGNyZWF0ZV9y
ICgpLg0KKy5UUA0KKy5CIFJldHVybiBWYWx1ZQ0KKy5CUiBoY3JlYXRlICgp
DQorYW5kDQorLkJSIGhjcmVhdGVfciAoKQ0KK3JldHVybiAwIHdoZW4gYWxs
b2NhdGlvbiBvZiB0aGUgbWVtb3J5DQorZm9yIHRoZSBoYXNoIHRhYmxlIGZh
aWxzIChvciwgaW4gdGhlIGNhc2Ugb2YNCisuQlIgaGNyZWF0ZSgpLA0KK3do
ZW4gYSBoYXNoIHRhYmxlIGlzIGFscmVhZHkgaW4gdXNlKSwgbm9uLXplcm8g
b3RoZXJ3aXNlLg0KKy5MUA0KKy5TUyAiaGRlc3Ryb3koKS9oZGVzdHJveV9y
KCkiDQogVGhlIGNvcnJlc3BvbmRpbmcgZnVuY3Rpb24NCiAuQlIgaGRlc3Ry
b3kgKCkNCisvDQorLkJSIGhkZXN0cm95X3IoKQ0KIGZyZWVzIHRoZSBtZW1v
cnkgb2NjdXBpZWQgYnkNCiB0aGUgaGFzaCB0YWJsZSBzbyB0aGF0IGEgbmV3
IHRhYmxlIGNhbiBiZSBjb25zdHJ1Y3RlZC4NCiAuUFANCisuU1MgImhzZWFy
Y2goKS9oc2VhcmNoX3IoKSINCitUaGUgZnVuY3Rpb24NCisuQlIgaHNlYXJj
aCAoKQ0KK3NlYXJjaGVzIHRoZSBoYXNoIHRhYmxlIGZvciBhbg0KK2l0ZW0g
d2l0aCB0aGUgc2FtZSBrZXkgYXMgXGZJaXRlbVxmUCAod2hlcmUgInRoZSBz
YW1lIiBpcyBkZXRlcm1pbmVkIHVzaW5nDQorLkJSIHN0cmNtcCAoMykpLA0K
K2FuZCBpZiBzdWNjZXNzZnVsIHJldHVybnMgYSBwb2ludGVyIHRvIGl0Lg0K
Ky5UUA0KKy5CIEFyZ3VtZW50ICJpdGVtIg0KIFRoZSBhcmd1bWVudCBcZklp
dGVtXGZQIGlzIG9mIHR5cGUgXGZCRU5UUllcZlAsIHdoaWNoIGlzIGEgdHlw
ZWRlZiBkZWZpbmVkIGluDQogXGZJPHNlYXJjaC5oPlxmUCBhbmQgaW5jbHVk
ZXMgdGhlc2UgZWxlbWVudHM6DQogLmluICs0bg0KQEAgLTkwLDEyICsxMjks
OCBAQA0KIFRoZSBmaWVsZCBcZklrZXlcZlAgcG9pbnRzIHRvIHRoZSBudWxs
LXRlcm1pbmF0ZWQgc3RyaW5nIHdoaWNoIGlzIHRoZQ0KIHNlYXJjaCBrZXku
DQogVGhlIGZpZWxkIFxmSWRhdGFcZlAgcG9pbnRzIHRvIHRoZSBkYXRhIGFz
c29jaWF0ZWQgd2l0aCB0aGF0IGtleS4NCi1UaGUgZnVuY3Rpb24NCi0uQlIg
aHNlYXJjaCAoKQ0KLXNlYXJjaGVzIHRoZSBoYXNoIHRhYmxlIGZvciBhbg0K
LWl0ZW0gd2l0aCB0aGUgc2FtZSBrZXkgYXMgXGZJaXRlbVxmUCAod2hlcmUg
InRoZSBzYW1lIiBpcyBkZXRlcm1pbmVkIHVzaW5nDQotLkJSIHN0cmNtcCAo
MykpLA0KLWFuZCBpZiBzdWNjZXNzZnVsIHJldHVybnMgYSBwb2ludGVyIHRv
IGl0Lg0KKy5UUA0KKy5CIEFyZ3VtZW50ICJhY3Rpb24iDQogVGhlIGFyZ3Vt
ZW50IFxmSWFjdGlvblxmUCBkZXRlcm1pbmVzIHdoYXQNCiAuQlIgaHNlYXJj
aCAoKQ0KIGRvZXMNCkBAIC0xMDMsMzMgKzEzOCwyMSBAQA0KIEEgdmFsdWUg
b2YgXGZCRU5URVJcZlAgaW5zdHJ1Y3RzIGl0IHRvDQogaW5zZXJ0IGEgY29w
eSBvZiBcZklpdGVtXGZQLCB3aGlsZSBhIHZhbHVlIG9mIFxmQkZJTkRcZlAg
bWVhbnMgdG8gcmV0dXJuDQogTlVMTC4NCi0uUFANCi1UaGUgdGhyZWUgZnVu
Y3Rpb25zDQotLkJSIGhjcmVhdGVfciAoKSwNCi0uQlIgaHNlYXJjaF9yICgp
LA0KLS5CUiBoZGVzdHJveV9yICgpDQotYXJlIHJlZW50cmFudCB2ZXJzaW9u
cyB0aGF0IGFsbG93IHRoZSB1c2Ugb2YgbW9yZSB0aGFuIG9uZSB0YWJsZS4N
Ci1UaGUgbGFzdCBhcmd1bWVudCB1c2VkIGlkZW50aWZpZXMgdGhlIHRhYmxl
Lg0KLVRoZSBzdHJ1Y3QgaXQgcG9pbnRzIHRvDQotbXVzdCBiZSB6ZXJvZWQg
YmVmb3JlIHRoZSBmaXJzdCBjYWxsIHRvDQotLkJSIGhjcmVhdGVfciAoKS4N
Ci0uU0ggIlJFVFVSTiBWQUxVRSINCi0uQlIgaGNyZWF0ZSAoKQ0KLWFuZA0K
LS5CUiBoY3JlYXRlX3IgKCkNCi1yZXR1cm4gMCB3aGVuIGFsbG9jYXRpb24g
b2YgdGhlIG1lbW9yeQ0KLWZvciB0aGUgaGFzaCB0YWJsZSBmYWlscywgbm9u
LXplcm8gb3RoZXJ3aXNlLg0KLS5MUA0KKy5UUA0KKy5CIEFyZ3VtZW50ICJy
ZXQiDQorVGhlIGFyZ3VtZW50IFxmSXJldFxmUCBwb2ludHMgYXQgdGhlIGZv
dW5kIGl0ZW0sIGlmIGFjdGlvbiB3YXMgXGZCRklORFxmUA0KK2FuZCB0aGVy
ZSB3ZXJlIG5vIGVycm9ycy4NCisuVFANCisuQiBSZXR1cm4gVmFsdWUNCiAu
QlIgaHNlYXJjaCAoKQ0KIHJldHVybnMgTlVMTCBpZiBcZklhY3Rpb25cZlAg
aXMgXGZCRU5URVJcZlAgYW5kDQogdGhlIGhhc2ggdGFibGUgaXMgZnVsbCwg
b3IgXGZJYWN0aW9uXGZQIGlzIFxmQkZJTkRcZlAgYW5kIFxmSWl0ZW1cZlAN
CiBjYW5ub3QgYmUgZm91bmQgaW4gdGhlIGhhc2ggdGFibGUuDQotLkxQDQog
LkJSIGhzZWFyY2hfciAoKQ0KLXJldHVybnMgMCBpZiBcZklhY3Rpb25cZlAg
aXMgXGZCRU5URVJcZlAgYW5kDQotdGhlIGhhc2ggdGFibGUgaXMgZnVsbCwg
YW5kIG5vbi16ZXJvIG90aGVyd2lzZS4NCityZXR1cm5zIHplcm8gb24gZmFp
bHVyZSwgYW5kIG5vbi16ZXJvIG9uIHN1Y2Nlc3MuICBJZiB0aGVyZSdzIGEg
ZmFpbHVyZSwNCit0aGUgZXJyb3IgKHNlZSBFUlJPUlMgc2VjdGlvbiBiZWxv
dykgaXMgc3RvcmVkIGluIGVycm5vLg0KIC5TSCBFUlJPUlMNCi1QT1NJWCBk
b2N1bWVudHMNCitQT1NJWCBkb2N1bWVudHMgdGhlIGZvbGxvd2luZyBlcnJu
byB2YWx1ZXMgKCNpbmNsdWRlIDxlcnJuby5oPik6DQogLlRQDQogLkIgRU5P
TUVNDQogT3V0IG9mIG1lbW9yeS4NCg==

--=_gwalcmai-11739-1220329620-0001-2--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
