From: Peter Schiffer <pschiffe-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>
Subject: [patch] tzset.3: fix description of "n" format
Date: Thu, 10 Nov 2011 19:24:44 +0100
Message-ID: <4EBC16EC.30905@redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------090401050609070508050301"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

This is a multi-part message in MIME format.
--------------090401050609070508050301
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello,

according to [1], description of start/end format of TZ variable says:
...
Jn
This specifies the Julian day, with n between 1 and 365. February 29 is 
never counted, even in leap years.
n
This specifies the Julian day, with n between 0 and 365. February 29 is 
counted in leap years.
...

This is correct and works. However, man page tzset(3) says:
...
Jn This specifies the Julian day with n between 1 and 365. Febru‐
ary 29 is never counted even in leap years.

n This specifies the Julian day with n between 1 and 365. Febru‐
ary 29 is counted in leap years.
...

For "n" format, interval should be "between 0 and 365". Attached patch 
is solving this issue.

Version of man pages: 3.35


peter


[1] http://www.gnu.org/s/hello/manual/libc/TZ-Variable.html

--------------090401050609070508050301
Content-Type: text/plain;
 name="tzset.patch"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="tzset.patch"

ZGlmZiAtdXAgbWFuLXBhZ2VzLTMuMzUvbWFuMy90enNldC4zLnRtcCBtYW4tcGFnZXMtMy4z
NS9tYW4zL3R6c2V0LjMKLS0tIG1hbi1wYWdlcy0zLjM1L21hbjMvdHpzZXQuMy50bXAJMjAx
MS0xMC0wNCAwODozNDo0NS4wMDAwMDAwMDAgKzAyMDAKKysrIG1hbi1wYWdlcy0zLjM1L21h
bjMvdHpzZXQuMwkyMDExLTExLTEwIDE4OjQ3OjA3Ljg2ODk2OTA0NSArMDEwMApAQCAtMTM0
LDcgKzEzNCw3IEBAIFRoaXMgc3BlY2lmaWVzIHRoZSBKdWxpYW4gZGF5IHdpdGggXGZJblwK
IEZlYnJ1YXJ5IDI5IGlzIG5ldmVyIGNvdW50ZWQgZXZlbiBpbiBsZWFwIHllYXJzLgogLlRQ
CiAuSSBuCi1UaGlzIHNwZWNpZmllcyB0aGUgSnVsaWFuIGRheSB3aXRoIFxmSW5cZlAgYmV0
d2VlbiAxIGFuZCAzNjUuCitUaGlzIHNwZWNpZmllcyB0aGUgSnVsaWFuIGRheSB3aXRoIFxm
SW5cZlAgYmV0d2VlbiAwIGFuZCAzNjUuCiBGZWJydWFyeSAyOSBpcyBjb3VudGVkIGluIGxl
YXAgeWVhcnMuCiAuVFAKIE1cZkltXGZQLlxmSXdcZlAuXGZJZFxmUAo=
--------------090401050609070508050301--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
