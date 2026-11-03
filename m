Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793737318;
	b=m3oARU0cKoazixwE6MNF+1+llRy3C2tOqA29tCgMFu2y4KOd0aB04U8CehNIVpHR0NbP
	 NuHTOXlCBU1dl4LMu2742hFdKCl2YAKkq9sn5ElKehSuSJGDzBYjYHlRfQdpWZEeOPPYn
	 uKlcVPgcD9tpU319ITn6XAIERWViHINp+T4FYg69SXHjqjYf44iy2CfjTtj4IL6peOPFm
	 vBUszotz3yAt9zsBGqsJZPwltnxvUWUpAyTaKTNVXxNB+cacW+98eQRR0VkexqZ1OiJNR
	 G8aukBSdtDgGqc+8rYPTf28DO/WsZ1OEtCQLFL2Tjyvkb18tkNeTlrhworOiYT1CsHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793737318;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=AuJhcvWPM35u7pgKjYXsni2NbhG6LIuTkt5cG102mHY=;
	b=JbcrM4/8xWLrHLrI/lTrmM7Yy6T+a5J9JzqhAQIbFcyVKSJViDgBVpNED8F5Bh6hSvlw
	 88HBgwu+0fSYCHeSUbxmb9z4/E5BriHLM6OsE2ZkJfm4i8HA34Cgo6iUdBO/3gml2WcRq
	 VMgD96JBU5hP03pJjAZudhbdkuHicbogfxIXQmfckgBDep8XE9ltPhCWQhGzNQp6yeOYg
	 z5Yzdd2YWIyIWZPjVfSWwlBBDrWx4RjfKXRXrFVkkvv1qCvw9T6SqLy9lJzvOLxDjcuDY
	 /zWTmMLNeEyXJLWoOJFrw4gLgsdngv55WT5tWxT8AlEcfAnPfy3p0EJrLPiO2/Yjkjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rilMYXzU;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88EE8606A31B
	for <linux-man@vger.kernel.org>; Tue,  3 Nov 2026 20:21:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88EE8606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rilMYXzU
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a5b2be99a8so29659765e9.2
        for <linux-man@vger.kernel.org>; Tue, 03 Nov 2026 12:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793737316; x=1794342116; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AuJhcvWPM35u7pgKjYXsni2NbhG6LIuTkt5cG102mHY=;
        b=rilMYXzU6pH1klXi2TR+6Tc0hKRsGqycbV5Lg+gWy0qFnN0IpZqjm1iksB1m3IrrTp
         EYaTFJndv9jv1qJaJbFesqE1LpxfYMEcgPxTbpB4sDNCh/BHmxTcbd9qdg6V8zFPM384
         VGsX8ev/P3gtsDGFtLKzgLmzozs00eWnhTUWNz+d4zUsEdR5Kg9auFsYYidwE1DMEBOm
         /v0jrB7smLOS+M/G/iFk3NjSO4lVuCM+pQjuzv0aq7wG/RtrT9Bj8pEwcClkqU7oLasR
         pYt3q+l8G/Q1+7PDvoOQY96ykjCLPiikVMCFxtCZOdcCWWPmnVD+hk0hsV4qLP6n1mMx
         JcBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793737316; x=1794342116;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AuJhcvWPM35u7pgKjYXsni2NbhG6LIuTkt5cG102mHY=;
        b=uFgcPcbgt5varYWv5+HhtI+GBpVa2sGNCZ4Ybjh9f4O3WIcEO6graYLEEOd3rTaXp3
         o5sY28WGldmcPYbykyw+jGc3CRRdoTpcCrXSCDDS0GknlEdw27DA53fJQV9uj4+g3oOo
         Ttr0zgMYvvtBnxrLTNFQBLHpR5f+FOi/k8bsDypjR4tCgShIo0oRjH7g7OfhtUFiK3Lv
         h+jjnLn2VHRERchKFRL7T27ZhIPLnsRtS2q1B8CKsyrjI+HcHxJEUJ/Sx4VygkMq64jM
         BllP3I7vn1YNo8TYVQWfuDRDaq/kHOE+TXCEvTT+QObbRQBHPZZJ9p9KmPYf5zAeD6p7
         GqsA==
X-Forwarded-Encrypted: i=1; AKwUvBw5TqEeq8kQefJ0wlmmBBonIgoI3t+qkBrAaa1LXQ5EePtMDFUUdYqyGAuYEtRLH3U+VlpDXI7leOw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4HHgNsvrlnsfo7T6PGS6HdmPD8137qXkCAmj5uU5OvWFgtFmP
	YcZmR6s8oPxu271OFovnBqKnqdIrUJ4EXT7YI/NI5+W7D03De5CQe57Y
X-Gm-Gg: AYBFou3twX2n+63HSbK98M83W/I4PzWMJvdXgib2x1TlJXMOn6jHHc8AYJHXPN85QSn
	ayiMQV1yFDk99niEUlicoe1RTt5kHlr/sqKGziasT/CNwapx41xlJ7SPTHy2/QET4HHiuG3ItLc
	84UTDTkpV05fRdeveURUuLJySIzFnOEsJkZqA3waPds0ke9E5J6Z3Wui/Rn8OAZEYvP3xnesVEK
	T+H69drizeRVFggqvbQA0bo4fIPuyodi6/Rw3jUnazt1B98IkzCD0Ts4WC7OqOGAtQ4lS+UB21W
	+zAnUrDIsnOFW4MGjYfDVqIdMN6NW6iPcV8o0w3IjrCjanjBYiE9Zzoxom+REfugnzIr8TrP2Gh
	a0vKuF5fCSIRbGAnX/Bupjxz8rweeWn+yp/HA/DKRBsKOat1BuD3FIXV4A2CWIme7B3mpkvEKP1
	ZTY0/9lx6nh8Y+BVr4zphf5L91gfSaLOGdo3R0l+3yBq8R47z3otFdwURK5AfnijYegUlPnkRSu
	vFz6TyjETD5ITADIbQGoC8F34Q8uh2J1PW7sWkuPGSxJUITtLuH/T/4o97Tdzc2i9xplJo7faxy
	nvlQjqm/S9VzEAASv7LkUpiHUWNncmqPxWakhLUayAp4zUtguOh4VjcTUcge44T5sS04TmK7Szs
	=
X-Received: by 2002:a05:600c:a00d:b0:4a5:e6fd:65e5 with SMTP id 5b1f17b1804b1-4ac19705d57mr318307935e9.31.1793737315646;
        Tue, 03 Nov 2026 12:21:55 -0800 (PST)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b2a82cebc1sm120955805e9.1.2026.11.03.12.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 12:21:55 -0800 (PST)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Jon Maloy <jmaloy@redhat.com>,
	samanthakumar <samanthakumar@google.com>,
	Alejandro Colomar <alx@kernel.org>
Subject: [PATCH v2 1/6] man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to unix(7)
Date: Tue,  3 Nov 2026 21:21:31 +0100
Message-ID: <20261103202136.13574-2-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261103202136.13574-1-gnoack3000@gmail.com>
References: <20261103202136.13574-1-gnoack3000@gmail.com>
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The option is implemented through proto_ops->set_peek_off, which is
nowadays also set for UDP and TCP sockets:

	linux.git 627d2d6b5500 (2016-04-05; "udp: enable MSG_PEEK at non-zero offset")
		Linux 4.7, UDP over IPv4 and IPv6
	linux.git 05ea491641d3 (2024-04-11; "tcp: add support for SO_PEEK_OFF socket option")
		Linux 6.10, TCP over IPv4
	linux.git be9a4fb831b8 (2024-08-29; "tcp: add SO_PEEK_OFF socket option tor TCPv6")
		Linux 6.12, TCP over IPv6

Previously, it was only available for UNIX Domain Sockets:

	linux.git f55bb7f9cb82 (2012-02-21; "unix: Support peeking offset for datagram and seqpacket sockets")
        linux.git ef64a54f6e55 (2012-02-21; "sock: Introduce the SO_PEEK_OFF sock option")

Cc: Jon Maloy <jmaloy@redhat.com>
Cc: samanthakumar <samanthakumar@google.com>
Cc: Kuniyuki Iwashima <kuniyu@google.com>
Assisted-by: LLM
Reviewed-by: Kuniyuki Iwashima <kuniyu@google.com>
Reviewed-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code -- this feature has been added to these other
    protocols since that man page section was written.
    
    The commits that introduced them are only listed in the commit
    message, not in the source, per Alejandro's request in [1].
    
    [1] https://lore.kernel.org/all/atulJkR7fAgyKhPP@debian/

 man/man7/socket.7 | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/man/man7/socket.7 b/man/man7/socket.7
index 96f6f173a40b..60133b4712eb 100644
--- a/man/man7/socket.7
+++ b/man/man7/socket.7
@@ -662,14 +662,19 @@ .SS Socket options
 .TP
 .BR SO_PEEK_OFF " (since Linux 3.4)"
 .\" commit ef64a54f6e558155b4f149bb10666b9e914b6c54
-This option, which is currently supported only for
-.BR unix (7)
-sockets, sets the value of the "peek offset" for the
+This option sets the value of the "peek offset" for the
 .BR recv (2)
 system call when used with
 .B MSG_PEEK
 flag.
 .IP
+This option is supported for
+.BR unix (7)
+sockets since Linux 3.4,
+for UDP sockets since Linux 4.7,
+and for TCP sockets since
+Linux 6.10 (IPv4) and Linux 6.12 (IPv6).
+.IP
 When this option is set to a negative value
 (it is set to \-1 for all new sockets),
 traditional behavior is provided:
-- 
2.56.0

