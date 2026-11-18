Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.33.106.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795034909;
	b=mMMQCR747RZZHxfoJNqum/2LxYxTrNwnMyZ/nIAVVCzVHkS4/inNSLmzNh7cb1f1DeKA
	 yyUNDbPZwMUdCWnQL+C68EXn54WjS6IO+hyLRhea3sWkjnOcUK1zXOMW1FebkN5fZLcx3
	 w1jQVNX8NRldBLre2DUxfpQe/R68+GD22ZiNOfQo7diIuOQBoogL+8uo5AyXCg83rX+SV
	 lPuHscQa3jDQ0rWpRgs56a66AbjNTWqkjAIcnJMJwMT/2Jkjmv/A0meQ1HTf+pvs57/Ic
	 fRAbDK+N68MDEq+/HfSd8ModcIaRlsUSHt/uGMkLWm984UAEqbV++0YLN48U2LP2w9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795034909;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=AP5+U1uYtrlh/18VEe/XfxBXXT/5CZbhhyUp9Vz0Lao=;
	b=vy+UAb/QHvwD3L/4yYbxo6VvCauynSF+AT6HFlycT+xy2S3EwZ9bTwynuIswoQuH8ZAo
	 77NffOjmIAOYCTXLLh3YoHEOLJxwJ4dY08PaBFEc5HNCXzGIEothDBTuzT+mGASaFSqd9
	 xhyDde4ZljYSRKYQSWoTFPLLj+CIAkj5kZ4nRAActnAbimYLRb4ZORPq+Es1WpBBmndkx
	 G6lz/KvkKdqDJWls333nPOuNtzYayXv+r88LfHkH1TRDCpKHOwd08BU7QR0JuARv71cLf
	 8E1NwXFym7s6wg1B/UQXVko1sgxdcLCXgh7NqvyOCMXXucoyogJfLbDAfWHg6wGs3+A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=UBiYUKi3;
	arc=none smtp.remote-ip=178.33.106.226
Received: from 1.mo564.mail-out.ovh.net (1.mo564.mail-out.ovh.net [178.33.106.226])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E349606A320
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 20:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E349606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=UBiYUKi3
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net [79.137.60.221])
	by mo564.mail-out.ovh.net (Postfix) with ESMTPS id 4jVDFw2P1wz8548;
	Wed, 18 Nov 2026 20:48:20 +0000 (UTC)
Received: from director1.derp.mail-out.ovh.net (director1.derp.mail-out.ovh.net. [127.0.0.1])
        by director1.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Wed, 18 Nov 2026 20:48:20 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.108.54.59])
	by director1.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jVDFv6sP0z5vLY;
	Wed, 18 Nov 2026 20:48:19 +0000 (UTC)
Received: from localhost.localdomain (88.142.38.18) by DAG5EX1.emp3.local
 (172.16.2.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Wed, 18 Nov
 2026 21:48:19 +0100
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>, "G . Branden Robinson"
	<g.branden.robinson@gmail.com>
CC: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	<linux-man@vger.kernel.org>, Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH v4] man/man?/landlock*.?: Document UDP support
Date: Wed, 18 Nov 2026 21:47:37 +0100
Message-ID: <20261118204737.18079-1-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <77089dd4-e776-4f56-8aad-508dcba53955@buffet.re>
References: <77089dd4-e776-4f56-8aad-508dcba53955@buffet.re>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CAS6.emp3.local (172.16.1.6) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1795034899; h=from:to:subject:date;
 bh=AP5+U1uYtrlh/18VEe/XfxBXXT/5CZbhhyUp9Vz0Lao=;
 b=UBiYUKi3EiK9DN3g1+cHPHCfJ8hmAE98EkBdxPXXS88TJFmZAH7yLM8/Lyu+KKlFBUCo6uQYJt4BYpi14/pMAj/+WXDH7oZ/QyncJfn/S1rcufRgN8QvOvYePBPtNIxL619sv93cZYwDGvaxxz3JsIaPLLA1VBWrQJO8WtDwC3NjNpJxO+do6UGPyfdLyaG2UkTUoRa1D6FwDnxWJnmSjlHbkZILuemUDRux6OVZBpIKNcCD+pQTkm2vHIiUBFU6/sBRftp2Fl/F71cNGCG+8FPY2roNasfiV9F3FfKH3yk/3e7Qa2w1O1BS3g6iSG1V3gnffzlGkdJrtLrlNfng+Q==
x-ovh-tracer-id: 1086493410410324502
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFMtW2AB3EjXEMP2BaEWkXY6yveiHaY8vKqXFtsNIHEEz9EpwE4BDeX3+g3Mghbj9ysIrktsJ14CVS2WLbeE+ACqQFytQjfVD825VcfShemX/QeMZTRl1/ykXPWTfYfbLxEly62KP6ZvmDjnkxsbQlcGGvrzrklm3Xff96AudztFvBbmRiNqghFkuEe2txC3vEs2pzhQq8RaT/4aLrsVfVKBqnwUoxWSl9PYEiNGlQgXfYG04DA8BHEE39P/ztzaPBq07mzhTRdFWC1kE1+smILK+dSeHZ9CLLFStIId8/z2KYzooNm3V2gcSbIAWPJoh/Gcp61ZtNv01j+NzCviiamjxUvrCTguV3ldcuL55LascdXojbtIyzf9/UmMx5NU/CLn+RHmIpw6q3PY0HwN9H831jwz1804CKGyRWO4+uzBeVPvaWIAkdy7DSLq/4rHIc/CUWLOEydph3rDtrGJLvddtMWE6ph6oz8BIgrZbqmsJeuuOAeDqyE9IxvbtCbXxnp/bMHGbkBstDixEpdCfnqVVlFnzJCagu2hGmJOZOjXx10A7wdcv/j6V1JU+5cv0glx+7aPhKHGb8xpSmYh/qR6y8yxnF6ejd88/ZbH2bk9kFxpI6UHZz51BnuHA8WW/KeZ760lvjfNHGdPjcE6DLAhJL/+VfSjIxZVUS4b8NEug

Landlock support for UDP-specific policy was merged in 7.2 in
linux.git 9a8ed15ce224 ("landlock: Add UDP bind() access control")
and
linux.git e61247a2e694 ("landlock: Add UDP send+connect access control")

Add documentation for new access rights, taken from the UAPI header with
minor improvements to be backported into it:
- clarify the most non-trivial behavior (auto-bind denials when sending
  if BIND_UDP is handled) without restricting to the case where
  CONNECT_SEND_UDP is handled
- improve description of how AF_UNSPEC destination addresses behave:
  connect() is always allowed, sending is always denied (instead of just
  "not supported") on IPv6 UDP sockets
- minor wording improvements, nothing else semantically different

Link: <https://github.com/landlock-lsm/linux/issues/66>
Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
---
 man/man2/landlock_add_rule.2 | 14 +++++--
 man/man7/landlock.7          | 75 +++++++++++++++++++++++++++++++++++-
 2 files changed, 83 insertions(+), 6 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index 253498bfa2cf..d48a27292987 100644
--- a/man/man2/landlock_add_rule.2
+++ b/man/man2/landlock_add_rule.2
@@ -82,7 +82,7 @@ just a file.
 .TP
 .BR LANDLOCK_RULE_NET_PORT "  (since Landlock ABI version 4)"
 For these rules,
-the object is a TCP port,
+the object is a TCP or UDP port,
 and the related actions are defined with
 .IR "network access rights" .
 .IP
@@ -120,8 +120,13 @@ with
 A Landlock rule with port 0
 and the
 .B LANDLOCK_ACCESS_NET_BIND_TCP
-right means that requesting to bind on port 0 is allowed
-and it will automatically translate to binding on the related port range.
+or
+.B LANDLOCK_ACCESS_NET_BIND_UDP
+right means that a port 0 binding request is allowed,
+automatically translating
+to a binding on a kernel-assigned ephemeral port.
+Such binding can be done explicitly or implicitly
+(sending a datagram on an unbound UDP socket is one implicit means).
 .P
 .I flags
 is a bit mask of the following optional flags:
@@ -181,7 +186,8 @@ can fail for the following reasons:
 .I rule_type
 is
 .BR LANDLOCK_RULE_NET_PORT ,
-but TCP is not supported by the running kernel.
+but the kernel was built without
+.BR CONFIG_INET .
 .TP
 .B EBADF
 .I ruleset_fd
diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
index 006482c94e34..6621676c5ca7 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -53,8 +53,8 @@ For these rules, the object is a file hierarchy,
 and the related filesystem actions are defined with
 .IR "filesystem access rights" .
 .TP
-.BR "Network rules" " (since ABI v4)"
-For these rules, the object is a TCP port,
+.BR "Network rules" " (since ABI v4 for TCP, v10 for UDP)"
+For these rules, the object is a TCP or UDP port,
 and the related actions are defined with
 .IR "network access rights" .
 .\"
@@ -279,6 +279,75 @@ Bind a TCP socket to a local port.
 .TP
 .BR LANDLOCK_ACCESS_NET_CONNECT_TCP "  (since Landlock ABI version 4)"
 Connect an active TCP socket to a remote port.
+.P
+And similarly for UDP port numbers:
+.TP
+.BR LANDLOCK_ACCESS_NET_BIND_UDP "  (since Landlock ABI version 10)"
+Bind UDP sockets to the given local port.
+.TP
+.BR LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP "  (since Landlock ABI version 10)"
+Set the remote port of UDP sockets to the given port,
+or send datagrams to the given remote port
+ignoring any destination pre-set on a socket.
+.P
+Note on auto-binding:
+Setting a remote address
+or sending a first datagram
+auto-binds
+UDP sockets
+to an ephemeral local source port
+if not already bound.
+To allow this if
+.B LANDLOCK_ACCESS_NET_BIND_UDP
+is handled
+(even if
+.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
+is not),
+either:
+.IP (a) 4
+use a socket already bound to a port
+before the ruleset started being enforced;
+.IP (b) 4
+grant
+.B LANDLOCK_ACCESS_NET_BIND_UDP
+on port 0, meaning
+\[lq]any port in the ephemeral port range\[rq];
+.IP (c) 4
+grant
+.B LANDLOCK_ACCESS_NET_BIND_UDP
+on a specific port,
+and call
+.BR bind (2)
+on that port before trying to
+.BR connect (2)
+or send datagrams.
+.P
+Note on
+.BR AF_UNSPEC :
+Calling
+.BR connect (2)
+on a TCP or UDP socket
+with an address of the
+.B AF_UNSPEC
+family
+can only dissolve existing associations,
+and as such is always allowed.
+If
+.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
+is handled,
+sending datagrams to explicit addresses of the
+.B AF_UNSPEC
+family on IPv6 UDP sockets
+is not supported
+and always results in a denial,
+as if the policy rejected it:
+use a
+.I NULL
+address instead to get the same semantics
+inside and outside a Landlock domain.
+Other uses of the
+.B AF_UNSPEC
+family have unchanged semantics.
 .\"
 .SS Scope flags
 These flags enable isolating a sandboxed process from a set of IPC actions.
@@ -534,6 +603,8 @@ _	_	_
 9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
 _	_	_
 10	7.2	LANDLOCK_ADD_RULE_QUIET
+\^	\^	LANDLOCK_ACCESS_NET_BIND_UDP
+\^	\^	LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version

base-commit: 7b4329e4945b1506f75c67c18730ad0191e09fb0
-- 
2.47.3

