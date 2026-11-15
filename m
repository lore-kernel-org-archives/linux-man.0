Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.78.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794776333;
	b=BZP2jz8H4H7XoLID/TpNGAEPbtIzx8nLvo+4Uhmjhq2bFI8rW3pbryShD/D43VuvjwBR
	 rYDqV5oQUmyrcG2Z9g+N2DRQHDPSZ+PWshgyG90MU+ZBDbiV3ckM+KH194idjqKqCmpaf
	 kRTwNppGP4Id5mMcjTFeIknyDx8fhwrzCLqmweUEEuvvZGGhPPhan0MZJ/xqkrHnEroy5
	 iKIUiagKPqwROGjt5ONbqUOKQceQLyk3Yd33EkUaVfFFTGtmJp/fzdfTSadqVrnzrMht2
	 bL/18qqHzAp+Z1jlEw9G324CQJhoLU3+dGlN8vKLve2Ot9glvl+P79fyu/816oUT9jQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794776333;
	h=DMARC-Filter:Received:Received:Received:Received:From:To:CC:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy:DKIM-Signature:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE;
	bh=Jeg4xI6+422SbPOSR2G0Fsf8VGp4jBjV86yIpY/K+SM=;
	b=YXdtj5l5AvJ4rlaGGegEHBx9D6cffzfx97FxGNX51/TI5bC3bE+qZEj38oAstOXaMXrw
	 kLEosFOZQhi5BI5cwqDjfjD/4nUyNAzMWTF9VZW2NggCjcIsC1qiJGxiVmPRPZhC5vZSa
	 biBfAMwuE8ySZNSbWywYeVrXK+dj3Y2LmyXOeHBapiQ06jBSItnZO4B3FaQyluLLv8zP7
	 aOg4XSxnadlLEKj/a58Q5VheRJkzyeuDFRyu1/CRT3MFuPYlc+u58jkkyK7Z95SdKLFsa
	 avX3GHUQNF/fKzKclTbD1lhIX/iujgOCRGnTGD2MB8ZUjouh0XY0girN6SFfaB51CIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=buffet.re;
	spf=pass smtp.mailfrom=buffet.re;
	dkim=pass header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=ZaPRybYp;
	arc=none smtp.remote-ip=46.105.78.6
Received: from 10.mo563.mail-out.ovh.net (10.mo563.mail-out.ovh.net [46.105.78.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B55606A323
	for <linux-man@vger.kernel.org>; Sun, 15 Nov 2026 20:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1B55606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buffet.re header.i=@buffet.re header.a=rsa-sha256 header.s=ovhemp1250268-selector1 header.b=ZaPRybYp
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net [79.137.60.36])
	by mo563.mail-out.ovh.net (Postfix) with ESMTPS id 4jSNdJ2CpPz5wly;
	Sun, 15 Nov 2026 20:58:44 +0000 (UTC)
Received: from director2.derp.mail-out.ovh.net (director2.derp.mail-out.ovh.net. [127.0.0.1])
        by director2.derp.mail-out.ovh.net (inspect_sender_mail_agent) with SMTP
        for <mic@digikod.net>; Sun, 15 Nov 2026 20:58:44 +0000 (UTC)
Received: from DAG5EX1.emp3.local (unknown [10.108.42.123])
	by director2.derp.mail-out.ovh.net (Postfix) with ESMTPS id 4jSNdJ06fGz1xp3;
	Sun, 15 Nov 2026 20:58:43 +0000 (UTC)
Received: from localhost.localdomain (88.142.38.18) by DAG5EX1.emp3.local
 (172.16.2.51) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.57; Sun, 15 Nov
 2026 21:58:43 +0100
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>, =?UTF-8?q?G=C3=BCnther=20Noack?=
	<gnoack3000@gmail.com>
CC: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	<linux-man@vger.kernel.org>, Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH v3] man/man?/landlock*.?: Document UDP support
Date: Sun, 15 Nov 2026 21:58:27 +0100
Message-ID: <20261115205827.136147-1-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
References: <bc495b26-2e26-4fc0-934b-37d55cb423a8@buffet.re>
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
X-ClientProxiedBy: CAS5.emp3.local (172.16.1.5) To DAG5EX1.emp3.local
 (172.16.2.51)
DKIM-Signature: v=1; a=rsa-sha256; d=buffet.re; s=ovhemp1250268-selector1;
 c=relaxed/relaxed; t=1794776323; h=from:to:subject:date;
 bh=Jeg4xI6+422SbPOSR2G0Fsf8VGp4jBjV86yIpY/K+SM=;
 b=ZaPRybYpL29Nl9CvYpEqxqm9KJoNs6+pULZ1CDBXHwvm6bEvQYAC0NHVhAVoAxPElS5pO2KaWzth/olO70gUdFkyHarnDC3YIzO9tPqUOfnYM/6+quTAD1jk68nabqxfOMgJMhcZ394pjwRzYdoBfjkMEixS4ef6i5vtfOfNlPHCGeb9IdRh2xx1Ic9vGa2R9RC3FKwlThh/rnxkOBhwsySb8DoB6nwcvNCvnKUVUXS0jeXBHK/2YUnYBp774g0STZWJV53w6S+uJGd2Uy+++iDYTxcSKujrRDnFWeuIfUSuwaGLDCEA6/n3L1t0/zRaL7aH1fIgmHBkk/L0eaiBFQ==
x-ovh-tracer-id: 2090796130345771542
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGcvrpru2GdKcmccgjGaYqdM7PumWez9nPjCesADc8bsMGMkyW2BVhz4AaOhTQL1oC/fujhG3AgUklDqB7kOcAzjdvXU6k9ypLNbkSCRh3y1Wv2ISN5ZQbBjpT29iJOw37PN++drEMeDz7x0x68cKC+9ehjYpmQe5Oxhd1/BdiZq+8DqhsQ7bVjuQtskptA9hXeGZhIS/sjiXpMmeYXZOjYiw0J4suCdc9ci+uT8xYPRoYjP4apINkmYrnGNjWBHBaPr5I92N4bEm7weIJbT+1m4KyFV3U3u2anocfYDfid8daiIXlQk2iabNAxH2tzV5opaU0AsHDXxT+Tp05VCvXOszLq3+ENJYtC+VlP26KdTE7mVMRGQsFiNpgk4PyhBhiU2hEs8cGqp/XTHZ0O6UnihHaUXjjup7bQ/R7x2yBqmTgRV2mBJvHAHwcQTZuMkjRJU63zFGouWF8bXATaZ4istSgIbIsYNKDTUsjoz6MTcoAfUQbZKCUTnSQplSrQ5YtZE7B88B9PeQaUXjuknmgeaeip0NCFegokMKb8FEWebFv/BbbZZ5Z7S0ipQXBrvxH5P7QPOTaogoacu8lYCLoYbzNoI3sr+uHtdK8TRggQDCLye7YszUyUn+Whge6VogiJNrLEK1vHghzZCtfjEHizJQ6ZUVjeyGw6nMhBMc3NZA

Landlock support for UDP-specific policy was merged in 7.2 in
linux.git 9a8ed15ce224 ("landlock: Add UDP bind() access control")
and
linux.git e61247a2e694 ("landlock: Add UDP send+connect access control")

Add documentation for new access rights, taken from the UAPI header with
minor deviations to be backported into it:
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
Changes v1->v2:
- Remove bind(AF_UNSPEC) behavior note, connect(AF_UNSPEC) note is
  reduced to a few words merged into a single patch
- Phrasing clarification
- Man formatting and etiquette

Changes v2->v3:
- Minor ephemeral port range rewording patch has already been merged,
  only one patch left
- Reword the sendto/sendmsg(AF_UNSPEC) note: we are talking about
  explicit addresses of AF_UNSPEC family on a domain=IPv6&type=UDP
  socket
- Punctuation+phrasing

 man/man2/landlock_add_rule.2 | 15 ++++++--
 man/man7/landlock.7          | 75 +++++++++++++++++++++++++++++++++++-
 2 files changed, 84 insertions(+), 6 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index 253498bfa2cf..9ff470a988d2 100644
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
@@ -120,8 +120,14 @@ with
 A Landlock rule with port 0
 and the
 .B LANDLOCK_ACCESS_NET_BIND_TCP
-right means that requesting to bind on port 0 is allowed
-and it will automatically translate to binding on the related port range.
+or
+.B LANDLOCK_ACCESS_NET_BIND_UDP
+right means that requesting to bind to port 0
+(explicitly or implicitly,
+e.g., by sending a datagram on an unbound UDP socket)
+is allowed,
+and it will automatically translate to
+binding on a kernel-assigned ephemeral port.
 .P
 .I flags
 is a bit mask of the following optional flags:
@@ -181,7 +187,8 @@ can fail for the following reasons:
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
index 006482c94e34..7e48fc5329d7 100644
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

base-commit: 9dc90054e92357bbe4c44f9c2a38c111f8ed7374
-- 
2.47.3

