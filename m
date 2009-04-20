From: Andrew Hecox <ahecox-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: man(5) proc file-nr correction
Date: Mon, 20 Apr 2009 14:38:05 -0400 (EDT)
Message-ID: <alpine.LRH.2.00.0904201432260.10236@honeypot.usersys.redhat.com>
Mime-Version: 1.0
Content-Type: MULTIPART/MIXED; BOUNDARY="185258995-1082269706-1240252685=:10236"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--185258995-1082269706-1240252685=:10236
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII


attached is a correction (text pulled from kernel's
Documentation/filesystems/proc.txt file) of the file-nr proc file.

It might be nice to clarify the difference between allocated and
utilized, but I didn't go there in this case. I can, if it would be
helpful.

thanks,

Andrew
--185258995-1082269706-1240252685=:10236
Content-Type: TEXT/PLAIN; charset=US-ASCII; name=proc.5.file-nr.patch
Content-Transfer-Encoding: BASE64
Content-ID: <alpine.LRH.2.00.0904201438050.10236-I7Xoyy2rRIi/4bX3TIDHR/XAX3CI6PSWQQ4Iyu8u01E@public.gmane.org>
Content-Description: 
Content-Disposition: attachment; filename=proc.5.file-nr.patch

ZGlmZiAtLWdpdCBhL21hbjUvcHJvYy41IGIvbWFuNS9wcm9jLjUNCmluZGV4
IGVkNDdmNzAuLjRmNTRjY2QgMTAwNjQ0DQotLS0gYS9tYW41L3Byb2MuNQ0K
KysrIGIvbWFuNS9wcm9jLjUNCkBAIC0xODM3LDE2ICsxODM3LDEyIEBAIHZh
bHVlIG9mDQogb3IgeW91IHdpbGwgcnVuIG91dCBvZiBpbm9kZXMuDQogLlRQ
DQogLkkgL3Byb2Mvc3lzL2ZzL2ZpbGUtbnINCi1UaGlzIChyZWFkLW9ubHkp
IGZpbGUgZ2l2ZXMgdGhlIG51bWJlciBvZiBmaWxlcyBwcmVzZW50bHkgb3Bl
bmVkLg0KLUl0IGNvbnRhaW5zIHRocmVlIG51bWJlcnM6IHRoZSBudW1iZXIg
b2YgYWxsb2NhdGVkIGZpbGUgaGFuZGxlczsNCi10aGUgbnVtYmVyIG9mIGZy
ZWUgZmlsZSBoYW5kbGVzOyBhbmQgdGhlIG1heGltdW0gbnVtYmVyIG9mIGZp
bGUgaGFuZGxlcy4NCi1UaGUga2VybmVsIGFsbG9jYXRlcyBmaWxlIGhhbmRs
ZXMgZHluYW1pY2FsbHksIGJ1dCBpdA0KLWRvZXNuJ3QgZnJlZSB0aGVtIGFn
YWluLg0KLUlmIHRoZSBudW1iZXIgb2YgYWxsb2NhdGVkIGZpbGVzIGlzIGNs
b3NlIHRvIHRoZQ0KLW1heGltdW0sIHlvdSBzaG91bGQgY29uc2lkZXIgaW5j
cmVhc2luZyB0aGUgbWF4aW11bS4NCi1XaGVuIHRoZSBudW1iZXIgb2YgZnJl
ZSBmaWxlIGhhbmRsZXMgaXMNCi1sYXJnZSwgeW91J3ZlIGVuY291bnRlcmVk
IGEgcGVhayBpbiB5b3VyIHVzYWdlIG9mIGZpbGUNCi1oYW5kbGVzIGFuZCB5
b3UgcHJvYmFibHkgZG9uJ3QgbmVlZCB0byBpbmNyZWFzZSB0aGUgbWF4aW11
bS4NCitIaXN0b3JpY2FsbHksIHRoZSB0aHJlZSB2YWx1ZXMgaW4gZmlsZS1u
ciBkZW5vdGVkIHRoZSBudW1iZXIgb2YNCithbGxvY2F0ZWQgZmlsZSBoYW5k
bGVzLCB0aGUgbnVtYmVyIG9mIGFsbG9jYXRlZCBidXQgdW51c2VkIGZpbGUN
CitoYW5kbGVzLCBhbmQgdGhlIG1heGltdW0gbnVtYmVyIG9mIGZpbGUgaGFu
ZGxlcy4gTGludXggMi42IGFsd2F5cw0KK3JlcG9ydHMgMCBhcyB0aGUgbnVt
YmVyIG9mIGZyZWUgZmlsZSBoYW5kbGVzIC0tIHRoaXMgaXMgbm90IGFuIGVy
cm9yLA0KK2l0IGp1c3QgbWVhbnMgdGhhdCB0aGUgbnVtYmVyIG9mIGFsbG9j
YXRlZCBmaWxlIGhhbmRsZXMgZXhhY3RseQ0KK21hdGNoZXMgdGhlIG51bWJl
ciBvZiB1c2VkIGZpbGUgaGFuZGxlcy4NCiAuVFANCiAuSSAvcHJvYy9zeXMv
ZnMvaW5vZGUtbWF4DQogVGhpcyBmaWxlIGNvbnRhaW5zIHRoZSBtYXhpbXVt
IG51bWJlciBvZiBpbi1tZW1vcnkgaW5vZGVzLg0K

--185258995-1082269706-1240252685=:10236--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
