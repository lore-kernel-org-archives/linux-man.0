Received: from mx1.buffet.re (mx1.buffet.re [51.83.41.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A03DE3C3F75
	for <linux-man@vger.kernel.org>; Thu, 17 Sep 2026 08:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.83.41.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632272; cv=none; b=ahIuc1b4vzrq6Ioo0hhgCbybiH+3mFgxx3jVyp/GY1sQrdULJ4lbEiL9ZEapeEbuuzDY7nYFSHvYbSc0t/9fAEnHwuO1PAjE0fkrD5PzbSkKUJrFY7aafHojXeMDFP/Dhebf0+SI9i/zADpiyFqqDgTJxJLIUmAbTNvDqlRv1sM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632272; c=relaxed/simple;
	bh=9vKPOGbhhqvbPW8baeGcM02bFGdKdMxZOML8WQsggnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4G9Trk2xvwKKqaKvG5fvWjmte3NirvBBp5wph0aygdMfR63Mjesdtejc9LIvmaMoSnz7wgwp5SZE8POCvY0OuYn/zYSaber9Rz+WLDca53lp3ILSc6fGq4H0LDuBrXDNiUGE2pkjPUDtQ6GNqYlcnq9x5UjaffG3eCDgKkeau4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re; spf=pass smtp.mailfrom=buffet.re; dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b=P2aHkzfI; arc=none smtp.client-ip=51.83.41.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=buffet.re
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=buffet.re
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buffet.re header.i=@buffet.re header.b="P2aHkzfI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=buffet.re; s=mx1;
	t=1789631947; bh=9vKPOGbhhqvbPW8baeGcM02bFGdKdMxZOML8WQsggnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P2aHkzfIPy9nhSKL2E1Pueq43Faoh8z8+MOrCg+EDBER87vJtaPTSgiaMu4/IcHQh
	 XfMscBPYUoFDfdL12tKNszzhTtWU3RiRAwDok5EiYYzuEaGVRzZR4ksYw3yxukKL4Z
	 LTvYqbQdNotIf2SXkl+41Vdi3iehAPChtBFm5GaoXU9y4fhd6u4qpHKBjPwQVeOeTy
	 FzWxC/SD2y4d6z09StQ1Vhr9N46STwtvgSwt4WRnf8DsO2U4RH0iVlDVz+SNIu6icl
	 0g+Yqf/4dRIU6YuwszKAALnjhCG9wbnLqztc2UEv0J3nNCu/alAw7cxyQYhQ/oKkAb
	 t47nmlyapkqJw==
Received: from localhost.localdomain (unknown [10.0.1.3])
	by mx1.buffet.re (Postfix) with ESMTPSA id 02C7D126851;
	Thu, 17 Sep 2026 09:59:07 +0200 (CEST)
From: Matthieu Buffet <matthieu@buffet.re>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Matthieu Buffet <matthieu@buffet.re>
Subject: [PATCH 3/3] man/man7/landlock.7, man/man2/landlock_add_rule.2: Document UDP support
Date: Thu, 17 Sep 2026 09:58:52 +0200
Message-ID: <20260917075853.10231-4-matthieu@buffet.re>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260917075853.10231-1-matthieu@buffet.re>
References: <20260917075853.10231-1-matthieu@buffet.re>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Landlock support for UDP-specific policy was merged in 7.2 in
linux.git 9a8ed15ce224 ("landlock: Add UDP bind() access control")
and
linux.git e61247a2e694 ("landlock: Add UDP send+connect access control")

Update the example to account for ABI v10, and add documentation for new
access rights taken from the UAPI header, plus:
- explicitly state in the access right description that sending
  datagrams without a destination does not require any access right
- more importantly: clarify the description of the most non-trivial
  behaviour (auto-bind denials when emitting, which can occur even if
  CONNECT_SEND_UDP is not handled)

Link: <https://github.com/landlock-lsm/linux/issues/66>
Signed-off-by: Matthieu Buffet <matthieu@buffet.re>
---
 man/man2/landlock_add_rule.2 | 15 +++++---
 man/man7/landlock.7          | 70 ++++++++++++++++++++++++++++++++++--
 2 files changed, 78 insertions(+), 7 deletions(-)

diff --git a/man/man2/landlock_add_rule.2 b/man/man2/landlock_add_rule.2
index 633d89824373..2b2b28147de0 100644
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
+right means that requesting to bind on port 0
+(explicitly, or implicitly
+by e.g.\& sending a datagram on an unbound UDP socket)
+is allowed
+and it will automatically translate to
+binding on a kernel-assigned ephemeral port.
 .P
 .I flags
 must be 0.
@@ -141,7 +147,8 @@ can fail for the following reasons:
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
index 51e63f40052c..884e1d49feb0 100644
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
@@ -277,6 +277,55 @@ Bind a TCP socket to a local port.
 .BR LANDLOCK_ACCESS_NET_CONNECT_TCP "  (since Landlock ABI version 4)"
 Connect an active TCP socket to a remote port.
 .P
+And similarly for UDP port numbers:
+.TP
+.BR LANDLOCK_ACCESS_NET_BIND_UDP "  (since Landlock ABI version 10)"
+Bind a UDP socket to the given local port.
+.TP
+.BR LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP "  (since Landlock ABI version 10)"
+Set the remote port of a UDP socket to the given port,
+or send datagrams to the given remote port
+taking precedence over any destination pre-set on a socket.
+Sending without an explicit destination
+(i.e.\& on a socket already connected)
+is never restricted.
+.P
+Note on auto-binding:
+Setting a remote address
+or sending a first datagram
+on UDP sockets
+performs an implicit
+.BR bind (2)
+to an ephemeral local source port
+if not already bound.
+If
+.B LANDLOCK_ACCESS_NET_BIND_UDP
+is handled,
+to avoid an
+.B EACCES
+error when sending outbound datagrams
+(even if
+.B LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
+is not handled),
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
 Note on
 .BR AF_UNSPEC :
 Calling
@@ -292,6 +341,17 @@ for IPv4 and
 .B INADDR_ANY
 it is treated as
 .BR AF_INET .
+Sending datagrams to that address family
+on IPv4 UDP sockets
+will similarly be treated as
+.BR AF_INET .
+On IPv6 UDP sockets,
+such use is not supported
+and will always result in a denial as if the policy rejected it:
+use a
+.I NULL
+address instead to get the same semantics
+inside and outside a Landlock domain.
 All other uses of that address family result in the same error codes
 as when Landlock is not in use.
 .\"
@@ -518,6 +578,9 @@ _	_	_
 8	7.0	LANDLOCK_RESTRICT_SELF_TSYNC
 _	_	_
 9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
+_	_	_
+10	7.2	LANDLOCK_ACCESS_NET_BIND_UDP
+\^	\^	LANDLOCK_ACCESS_NET_CONNECT_SEND_UDP
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version
@@ -628,6 +691,7 @@ __u64 landlock_fs_access_rights[] = {
     (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v7: same
     (LANDLOCK_ACCESS_FS_IOCTL_DEV    << 1) \- 1,  // v8: same
     (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v9: add "resolve_unix"
+    (LANDLOCK_ACCESS_FS_RESOLVE_UNIX << 1) \- 1,  // v10: UDP support
 };
 \&
 int abi = landlock_create_ruleset(NULL, 0,
@@ -640,7 +704,7 @@ if (abi == \-1) {
     perror("Unable to use Landlock");
     return;  /* Graceful fallback: Do nothing.  */
 }
-abi = MIN(abi, 9);
+abi = MIN(abi, 10);
 \&
 /* Only use the available rights in the ruleset.  */
 attr.handled_access_fs &= landlock_fs_access_rights[abi \- 1];
-- 
2.47.3

