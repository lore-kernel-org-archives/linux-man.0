Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.33.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793662891;
	b=BGNBz58yV3jb2bb6XpX0ubqg/wggc1aejnQKD8QRR1/uxLPbZ6S2RRJGbIZpMJXPnvQt
	 NF6IpNB5fB1X9Te0HwixWIS8VsaFd7S33xm4plSuSMdDtjdMbjReKGd4nTY83Xj7Wts3g
	 tPDsb5xYjjel7pPZ9zdQTEM31jipL8DYWzKNyPs2RVSkRY7kSWv/Q9TDnwVaPtni5pYzs
	 wsD2HwwSUcUhmq0Uzkz/tVJvsOiodXxkdzH9m35Q1o/BZbBhyg4LEizyw0pVKMvk6jsDf
	 KlGDqbaY8fd1DinFi+F9KV20VbaxNJNRKzRKk2RdKh+ydO50Pf7TgUjYSeb2faK+wCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793662891;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=lBpln/EZYlLfu1A5QS4Jhwsy67hbdpf0Q8E4iPMMBmc=;
	b=cj+LVaZEz2C0zOFcLLDKbP8SSDe0Gv0w+udHpmlY0UL1ZkQI7Q62AiIoXI0vkpR6nLQ9
	 dUiS5+gPb8i0+5O+yWkQx0fFczJRf4XIT0enK/G3fQlIJB0ZwOk9I5WDLcjIuCYiPODEI
	 tiBO05uCIxszuGOUO4kdmmgGb/dB9b7tF23cC+UYhlxwc3ahcysQhxyKrjW9060Grg/nf
	 2on2YxUvVUbR/dl7wsQoIQqFK6zFPHUNpFW+r5AtzQ+K8UeOYmVgoTLDJ9Dwxcejkco/A
	 K8XYMA3ceXKZfM8L0Q4MSQOT7TD+en9nT7SPKRc09FY3p9w3fyUss/tS8YWiDiTOWyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=jae8Qc5Y;
	arc=none smtp.remote-ip=46.105.33.63
Received: from 3.mo562.mail-out.ovh.net (3.mo562.mail-out.ovh.net [46.105.33.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFB36606A32C
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 23:41:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFB36606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=jae8Qc5Y
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net [79.137.60.37])
	by mo562.mail-out.ovh.net (Postfix) with ESMTPS id 4jJSrx3zqmz20ZT;
	Mon,  2 Nov 2026 23:41:21 +0000 (UTC)
Received: from director4.derp.mail-out.ovh.net (director4.derp.mail-out.ovh.net. [127.0.0.1])
        by director4.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Mon,  2 Nov 2026 23:41:21 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.108.42.252])
	by director4.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jJSrx2fWYz1xtb;
	Mon,  2 Nov 2026 23:41:21 +0000 (UTC)
Received: from localhost.localdomain (88.142.38.18) by DAG5EX1.emp3.local
 (172.16.2.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 3 Nov
 2026 00:41:20 +0100
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>, =?UTF-8?q?G=C3=BCnther=20Noack?=
	<gnoack3000@gmail.com>
CC: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	<linux-man@vger.kernel.org>, Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH v2 2/2] man/man?/landlock*.?: Document UDP support
Date: Tue, 3 Nov 2026 00:39:32 +0100
Message-ID: <20261102233932.29912-2-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261102233932.29912-1-matthieu@buffet.re>
References: <e354fb0d-2173-4015-b945-c413bb1b1c44@buffet.re>
 <20261102233932.29912-1-matthieu@buffet.re>
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
X-ClientProxiedBy: CAS4.emp3.local (172.16.1.4) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1793662881; h=from:to:subject:date;
 bh=lBpln/EZYlLfu1A5QS4Jhwsy67hbdpf0Q8E4iPMMBmc=;
 b=jae8Qc5YC8+UqfqYBSmXFcQ1NlNE3jSoLahpnf+lW8KCeeazxo7J4lxbzBaftdtUFdEohSwDGTMhPdcAhdJOItHC51ImcE6T/7iT5WoI3s7bSoXCU6y37nr5rD6dDGuObwBw7K4/KKIz1PfxYluzj/4IuZsIuqSaWvjtoe+dYfzZgRTyFq5eWM2eKBHifvFuBcw671/0Vjzk9vWQEob6h91M5in2zuFtMmRO3Vd/yjztfLYLhCDGxamJguzA9aqPqXhsliUAtSHSKejHxdB6w+vgYAXmXwXReipLCJ2K6IdoYJWm4Fb/0zxVlR2w33/hY0BAWTDFERQhE8K/WgfxQg==
x-ovh-tracer-id: 2279102886523658774
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGpQy+rOFO4f0oW4J/8eHXxTlGpPX+VepMNFoA6Ejhh6P1VGLSYGynjnseA/HzmikBWz5iMBQ3yNEfcUjER0R/eVmBKUEjZmOseP8kn2I6mN/2uYM9Tr9dnFl22aZu0kLx8M4MFE3rZo9nixK+DhsUb/f9v0ue4VOfFFxKOZQBLOLLLDO4VvuL6zMUUK/Um+zMKCG0nQY7+iW/lw/q+QW/CuqGXTvp26zuuaJR/zoECoGaqoc62FkQtRdh0rKmfwEZS28J+A3+w0aQsyTk19tXUtWMMmaZg3ekNN83u0HcezPCTFilVFdKILtWYxX3FVf/xR6CFIVg2wZIs4cd2QDlfgH+aDBg4HLx5hdrhjAVs/nFxNcq32k75f9E7ghUZnKOnp30KrZc6+WsvHMAnUwCLDlWOBYyW8ZGZ/Lfd0HCifCKyDiF0sCHKpSsDME1IvbsikNsz5RKn87Z0Afxan3R1f/loPRH/qijHijdXjWtN7d77p3PoML4kZa9hTyyCWxkBJZyS6HoplnDoDWRnc81OH+8mZxFf70uH9ZpLc6BGf7mDQjvfJOphhw0hLmbWrOusiilN2rSB5wGJ2yL0EGtcpPLQtVgWH1zqvELFDorNLGf1UwL37LYF2T+00iqH4A7sGDHZGmjVgj2dkOOfEG6+wSgekgK0qtbPV2D5D9LjvQ

Landlock support for UDP-specific policy was merged in 7.2 in
linux.git 9a8ed15ce224 ("landlock: Add UDP bind() access control")
and
linux.git e61247a2e694 ("landlock: Add UDP send+connect access control")

Add documentation for new access rights taken from the UAPI header, plus:
- clarify the description of the most non-trivial behavior (auto-bind
  denials when emitting, which can occur even if CONNECT_SEND_UDP is not
  handled)
- improve AF_UNSPEC behavior description in both connect() and IPv6-send
  cases
- minor wording fixes to be backported in the UAPI header

Link: <https://github.com/landlock-lsm/linux/issues/66>
Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
---
 man/man2/landlock_add_rule.2 | 14 +++++--
 man/man7/landlock.7          | 74 +++++++++++++++++++++++++++++++++++-
 2 files changed, 82 insertions(+), 6 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index 253498bfa2cf..337ff4150f2c 100644
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
+right means that requesting to bind on port 0
+(explicitly, or implicitly
+for instance by sending a datagram on an unbound UDP socket)
+is allowed
+and it will automatically translate to binding on a kernel-assigned ephemeral port.
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
index ad63826da84f..296c4d74a22f 100644
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
@@ -276,6 +276,74 @@ Bind a TCP socket to a local port.
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
+.IP \[bu] 3
+use a socket already bound to a port
+before the ruleset started being enforced;
+.IP \[bu] 3
+grant
+.B LANDLOCK_ACCESS_NET_BIND_UDP
+on port 0, meaning
+\[lq]any port in the ephemeral port range\[rq];
+.IP \[bu] 3
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
+On IPv6 UDP sockets, if
+.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
+is handled,
+sending datagrams to
+.B AF_UNSPEC
+addresses is not supported
+and will always result in a denial,
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
@@ -531,6 +599,8 @@ _	_	_
 9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
 _	_	_
 10	7.2	LANDLOCK_ADD_RULE_QUIET
+\^	\^	LANDLOCK_ACCESS_NET_BIND_UDP
+\^	\^	LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version
-- 
2.47.3

