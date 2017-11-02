From: enh <enh-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: [patch] recvmmsg.2/sendmmsg.2: fix signatures
Date: Wed, 1 Nov 2017 17:09:32 -0700
Message-ID: <CAJgzZorunHq-6ztgLS4Ya3wWKbXxzE87wCykgBN3ofCcmVKi0g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="001a114037bab51f01055cf4ce0c"
Return-path: <linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-man-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "Michael Kerrisk (man-pages)" <mtk.manpages-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-man-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-man@vger.kernel.org

--001a114037bab51f01055cf4ce0c
Content-Type: text/plain; charset="UTF-8"

---
 man2/recvmmsg.2 | 2 +-
 man2/sendmmsg.2 | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/man2/recvmmsg.2 b/man2/recvmmsg.2
index 3ff1b63a3..e7dfe848a 100644
--- a/man2/recvmmsg.2
+++ b/man2/recvmmsg.2
@@ -38,7 +38,7 @@ recvmmsg \- receive multiple messages on a socket
 .PP
 .BI "int recvmmsg(int " sockfd ", struct mmsghdr *" msgvec \
 ", unsigned int " vlen ","
-.BI "             unsigned int " flags ", struct timespec *" timeout ");"
+.BI "             int " flags ", struct timespec *" timeout ");"
 .fi
 .SH DESCRIPTION
 The
diff --git a/man2/sendmmsg.2 b/man2/sendmmsg.2
index e61ed0b4e..a4895c1ac 100644
--- a/man2/sendmmsg.2
+++ b/man2/sendmmsg.2
@@ -35,7 +35,7 @@ sendmmsg \- send multiple messages on a socket
 .PP
 .BI "int sendmmsg(int " sockfd ", struct mmsghdr *" msgvec \
 ", unsigned int " vlen ","
-.BI "             unsigned int " flags ");"
+.BI "             int " flags ");"
 .fi
 .SH DESCRIPTION
 The
-- 
2.15.0.403.gc27cc4dac6-goog

--001a114037bab51f01055cf4ce0c
Content-Type: text/x-patch; charset="US-ASCII";
	name="0001-Fix-recvmmsg-2-sendmmsg-2-signatures.patch"
Content-Disposition: attachment;
	filename="0001-Fix-recvmmsg-2-sendmmsg-2-signatures.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_j9hplyz80

RnJvbSAyNzQ1ODMyY2Y2NDQ0ZWRlYTRiMTU2YmQzOGI1MzE3MTNlZmNmYTlmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBFbGxpb3R0IEh1Z2hlcyA8ZW5oQGdvb2dsZS5jb20+CkRhdGU6
IFdlZCwgMSBOb3YgMjAxNyAxNzowNDowMSAtMDcwMApTdWJqZWN0OiBbUEFUQ0hdIEZpeCByZWN2
bW1zZygyKS9zZW5kbW1zZygyKSBzaWduYXR1cmVzLgoKLS0tCiBtYW4yL3JlY3ZtbXNnLjIgfCAy
ICstCiBtYW4yL3NlbmRtbXNnLjIgfCAyICstCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tYW4yL3JlY3ZtbXNnLjIgYi9tYW4y
L3JlY3ZtbXNnLjIKaW5kZXggM2ZmMWI2M2EzLi5lN2RmZTg0OGEgMTAwNjQ0Ci0tLSBhL21hbjIv
cmVjdm1tc2cuMgorKysgYi9tYW4yL3JlY3ZtbXNnLjIKQEAgLTM4LDcgKzM4LDcgQEAgcmVjdm1t
c2cgXC0gcmVjZWl2ZSBtdWx0aXBsZSBtZXNzYWdlcyBvbiBhIHNvY2tldAogLlBQCiAuQkkgImlu
dCByZWN2bW1zZyhpbnQgIiBzb2NrZmQgIiwgc3RydWN0IG1tc2doZHIgKiIgbXNndmVjIFwKICIs
IHVuc2lnbmVkIGludCAiIHZsZW4gIiwiCi0uQkkgIiAgICAgICAgICAgICB1bnNpZ25lZCBpbnQg
IiBmbGFncyAiLCBzdHJ1Y3QgdGltZXNwZWMgKiIgdGltZW91dCAiKTsiCisuQkkgIiAgICAgICAg
ICAgICBpbnQgIiBmbGFncyAiLCBzdHJ1Y3QgdGltZXNwZWMgKiIgdGltZW91dCAiKTsiCiAuZmkK
IC5TSCBERVNDUklQVElPTgogVGhlCmRpZmYgLS1naXQgYS9tYW4yL3NlbmRtbXNnLjIgYi9tYW4y
L3NlbmRtbXNnLjIKaW5kZXggZTYxZWQwYjRlLi5hNDg5NWMxYWMgMTAwNjQ0Ci0tLSBhL21hbjIv
c2VuZG1tc2cuMgorKysgYi9tYW4yL3NlbmRtbXNnLjIKQEAgLTM1LDcgKzM1LDcgQEAgc2VuZG1t
c2cgXC0gc2VuZCBtdWx0aXBsZSBtZXNzYWdlcyBvbiBhIHNvY2tldAogLlBQCiAuQkkgImludCBz
ZW5kbW1zZyhpbnQgIiBzb2NrZmQgIiwgc3RydWN0IG1tc2doZHIgKiIgbXNndmVjIFwKICIsIHVu
c2lnbmVkIGludCAiIHZsZW4gIiwiCi0uQkkgIiAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgIiBm
bGFncyAiKTsiCisuQkkgIiAgICAgICAgICAgICBpbnQgIiBmbGFncyAiKTsiCiAuZmkKIC5TSCBE
RVNDUklQVElPTgogVGhlCi0tIAoyLjE1LjAuNDAzLmdjMjdjYzRkYWM2LWdvb2cKCg==
--001a114037bab51f01055cf4ce0c--
--
To unsubscribe from this list: send the line "unsubscribe linux-man" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
