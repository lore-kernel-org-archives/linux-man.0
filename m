Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.135
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794360740;
	b=Achl9xYXIpnazJelMEtBzvQRV8WwT7ZlG+SOu7JGv/54/aQ1OhbhT7dR2yIny8ay98tX
	 8gsDVxg2845Arq+DWR/VuW45165dQPfNaRD8stuV0O0FZrC7Yfq/7Xhcj2aJ0cZtatSV2
	 6ZHram0zA5l60hBiYKvcL8GDB0bpj+7z42RZ2QmPPSI7eJn+wpXRKB2CfFyVKY8bNs1gk
	 TiIjf5KsvzJLQNUayM3AfT0vmBN9tve+ZN7jQlqtpjXqph04oclvj784m8RAS41IkMYX/
	 sbXBzTw0M0eGSp+sTLkUMMF2v2YoVLoC8uTRWdkwxWW2SZCjntGXIjbm7TUfIJ0QhIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794360740;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WHdTdfLqBqsLXLIOizRbgO+Qx4PcV+Z1Fbd/kS3x8Vc=;
	b=miNDKaNIdVBWk64hNGPPZzrvS9npOg2tucg45n2OmlPY9n2zyNHbZ5uohd1Pwu9+FnCv
	 VsNOEgm3684rr5IROUTD0Z4c0PVDbti4Xu57bdXqV0qaIqamHJjvpuTqnEjkCLHd9L/nP
	 GmpPq0ESN1AO/Nyrr1n5H7Ivc7+p6ePsrTwuIpyzdczZVL239bLkDpNpYczbyU5JOKH7j
	 2rd6dHlrDuRdz1cZU/Zgh2v+6mv+zl2YuV5/XptgFxPPdNm6uGHervDCk7z+Hg/eTzx/x
	 l630/smYLq9JGtosk4waR0ev5Y9AWMjgpez6dOZQN8I/IC5qMGjb532rLqZ394szfZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ruVSQ8r8;
	arc=none smtp.remote-ip=74.125.224.135
Received: from mail-yx2-f7.google.com (mail-yx2-f7.google.com [74.125.224.135])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06BD0606A31C
	for <linux-man@vger.kernel.org>; Wed, 11 Nov 2026 01:32:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06BD0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ruVSQ8r8
Received: by mail-yx2-f7.google.com with SMTP id 956f58d0204a3-67a3d39e403so1773823d50.1
        for <linux-man@vger.kernel.org>; Tue, 10 Nov 2026 17:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794360739; x=1794965539; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WHdTdfLqBqsLXLIOizRbgO+Qx4PcV+Z1Fbd/kS3x8Vc=;
        b=ruVSQ8r8yoBredVEDIkgkcPh4Sdq/5C1uZLitLKabY45LDCKJQlhtnWksSVgEUiBef
         epRInuyrm1s7hgsjTuQ2UIcuRH26acjNVDiaJtU6cCJT7196n9GGS5S3ZEOrA8kopLlO
         bpsWth8ZRAf7ALOAlbOirYw0oUkxImx4lFj/XTDsreXzVztReCOl48ArOig0wuD4ePbz
         56An2lxmi4+x9jBu/oq9dqWhMGme7seSo7qGedYouE/JVlygFHFcSXU1GU1mGsV6Td3T
         g8Zo8cCeupKRA1awr0hEooGbRz2/PJfNQr+y0jyK2BsTTjzC6vkp8OdZTGgWe4XPU+XT
         Pg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794360739; x=1794965539;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WHdTdfLqBqsLXLIOizRbgO+Qx4PcV+Z1Fbd/kS3x8Vc=;
        b=thoLPmwQAZrVTPQlU2kHj5xVizpETy8Z0mViZZeXs3NpIjzbdrAG4HsUBPqqEaWwOI
         3cc0vuGTpAANZ4CciDFrK5aeU4BQOV/kdptroNiFs4YDCd0wLfrFDbBI3mwELHYZqLMa
         HAQuo62OlmPTc51CrNajtJP3mPkKFliRxjifNJu+qE78+ELBOBCJahtxayKllPN/olSy
         43BEsaIFnkoLUZ62tiAj/RWBhlZpSa3SIkGGHbSBsJk0uRHCZB4TNqKbvKW9qMj+QCzE
         6tcuN1nPOXgGn3kjwUaj6SZ4Q54RGPNqEmE/SfctCFcbb/oIftvfM92dnnzBDfg0hodI
         Y2vQ==
X-Forwarded-Encrypted: i=1; AL+hErFE4GM5rYtj8MX4gZfeA0B6P/ROR7ZgsFwdpHBBFQAo6fy+IF+ki4n8CLVuEW29TLArVmjVKSTUUrM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9+hj0hsI69cwZsMhSIrHax+amCKWfBC/On1kddMWg+qN9/vfOh
	i4YUQViVa+amvq/zgEs5EfqilnKk+zT+Phf6wshklZoxg1al3ogsvl6+
X-Gm-Gg: AYBFou0of31Agvlt8Xpqx6yS4GtHoxP2AScFs7icN+jaUGuif7/HLSgSUb8UREYUf0p
	r6XmLxNt9nIhB6aolFOze5xVQIF7G3QPN498xpWw/XLZZGSqs23mv5QPWkSCk8eXC2k8gDV2r2g
	VltE/yoHk4RFr2BvL3pAvn6EZZrYnJemJmXdCfSyooj7IvRF5/KIzuHx3c7UNi6cQbYAe4YtULk
	qrifWRQ5Cb8O79bYDC7dpkJfRZOlLkCBi++id4GNUE2Uaqg3LeMyRXIZGf4CPyUA65SKgUqx58T
	7bZUwtbhku/0vfXGjJFTdCIerdChwwrs51ewqfoE4nAfuk5Wy+mHsN+InxCqdcjujSqGpKAyPsk
	Lts6SM8Vl9Jg8ma1f/dEtpkbGMMJ/5atLud3YEHg8NcuMulwCnC1ofOWHWsExFkKMRSLFDhb2Oz
	jvah4gB2D9v1qQwxY5bLnW9J9udmgEEgYQ6LsuZJ/l2TAIJC/pMM0hkv6VWUtFmNmYKh09VgCWO
	1a82rMmb1H3N+g4eQr0V0QrpwedIiTI1N6rx1lKpYlgcIDA5Sx5+ncTybUTMw+U8U2yH8+QMSAJ
	G3f5f5JshV229YAls5JtF8MbKJ5UgKaFBSNG
X-Received: by 2002:a05:690e:4411:b0:67c:1fc:2a49 with SMTP id 956f58d0204a3-67c67f9a5c2mr571944d50.54.1794360738775;
        Tue, 10 Nov 2026 17:32:18 -0800 (PST)
Received: from zzz.zzz ([2804:1e68:8401:b4a:95dc:e7bc:62de:3d10])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67c58a25a77sm3382818d50.22.2026.11.10.17.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 17:32:18 -0800 (PST)
From: Pedro Holanda <pedroholanda122205@gmail.com>
To: Alejandro Colomar <alx@kernel.org>,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
Cc: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	linux-man@vger.kernel.org,
	Pedro Holanda <pedroholanda122205@gmail.com>
Subject: [PATCH] landlock_restrict_self.2, landlock.7: Document LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS
Date: Tue, 10 Nov 2026 20:28:40 -0500
Message-ID: <20261111013137.226288-1-pedroholanda122205@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Add the LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS flag (Landlock ABI
version 11), which sets the no_new_privs attribute of the calling
thread atomically with successful ruleset enforcement, removing the
need for a prior prctl(PR_SET_NO_NEW_PRIVS) call. Document the flag in
landlock_restrict_self(2) alongside LANDLOCK_RESTRICT_SELF_TSYNC, and
add the ABI 11 row to the VERSIONS table in landlock(7).

Transcribes the kernel documentation added in Justin Suess's ABI 11
series.

Signed-off-by: Pedro Holanda <pedroholanda122205@gmail.com>
Link: https://lore.kernel.org/linux-security-module/20260809154544.1253100-5-utilityemal77@gmail.com/
Link: https://github.com/landlock-lsm/linux/issues/66
---
 man/man2/landlock_restrict_self.2 | 29 +++++++++++++++++++++++++++++
 man/man7/landlock.7               |  2 ++
 2 files changed, 31 insertions(+)

Note: following up on the man-pages transcription from issue #66, at
Günther's suggestion. I've left the DESCRIPTION no_new_privs
precondition and the EPERM entry unchanged; both now have an exception
via this flag. Happy to refine them here or in a follow-up.

diff --git a/man/man2/landlock_restrict_self.2 b/man/man2/landlock_restrict_self.2
index 3b8f897cf..4cfbd1e6a 100644
--- a/man/man2/landlock_restrict_self.2
+++ b/man/man2/landlock_restrict_self.2
@@ -150,6 +150,35 @@ If the calling thread is running with
 this operation enables
 .I no_new_privs
 on the sibling threads as well.
+.TP
+.BR LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS "  (since Landlock ABI version 11)"
+Sets the
+.I no_new_privs
+attribute of the calling thread atomically with enforcement of the
+ruleset.
+.I no_new_privs
+is set if and only if the call succeeds;
+a failed enforcement leaves it unchanged.
+Because the call sets
+.I no_new_privs
+itself,
+it removes the need for a prior
+.BR prctl (2)
+.B PR_SET_NO_NEW_PRIVS
+call (or
+.B CAP_SYS_ADMIN
+use).
+.IP
+When combined with
+.BR LANDLOCK_RESTRICT_SELF_TSYNC ,
+.I no_new_privs
+is set on all threads of the process with the same guarantee.
+.IP
+Leaving
--- a/man/man2/landlock_restrict_self.2
+++ b/man/man2/landlock_restrict_self.2
@@ -150,6 +150,35 @@ If the calling thread is running with
 this operation enables
 .I no_new_privs
 on the sibling threads as well.
+.TP
+.BR LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS "  (since Landlock ABI version 11)"
+Sets the
+.I no_new_privs
+attribute of the calling thread atomically with enforcement of the
+ruleset.
+.I no_new_privs
+is set if and only if the call succeeds;
+a failed enforcement leaves it unchanged.
+Because the call sets
+.I no_new_privs
+itself,
+it removes the need for a prior
+.BR prctl (2)
+.B PR_SET_NO_NEW_PRIVS
+call (or
+.B CAP_SYS_ADMIN
+use).
+.IP
+When combined with
+.BR LANDLOCK_RESTRICT_SELF_TSYNC ,
+.I no_new_privs
+is set on all threads of the process with the same guarantee.
+.IP
+Leaving
+.I no_new_privs
+unset is risky even when Landlock does not require it,
+as it can allow a sandboxed process to regain privileges;
+this flag is the recommended way to avoid that.
 .SH RETURN VALUE
 On success,
 .BR landlock_restrict_self ()
diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
index 006482c94..e8639dcd4 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -534,6 +534,8 @@ _   _       _
 9      7.1     LANDLOCK_ACCESS_FS_RESOLVE_UNIX
 _      _       _
 10     7.2     LANDLOCK_ADD_RULE_QUIET
+_      _       _
+11     7.3     LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version
-- 
2.53.0

+.I no_new_privs
+unset is risky even when Landlock does not require it,
+as it can allow a sandboxed process to regain privileges;
+this flag is the recommended way to avoid that.
 .SH RETURN VALUE
 On success,
 .BR landlock_restrict_self ()
diff --git a/man/man7/landlock.7 b/man/man7/landlock.7
index 006482c94..e8639dcd4 100644
--- a/man/man7/landlock.7
+++ b/man/man7/landlock.7
@@ -534,6 +534,8 @@ _	_	_
 9	7.1	LANDLOCK_ACCESS_FS_RESOLVE_UNIX
 _	_	_
 10	7.2	LANDLOCK_ADD_RULE_QUIET
+_	_	_
+11	7.3	LANDLOCK_RESTRICT_SELF_NO_NEW_PRIVS
 .TE
 .P
 Users should use the Landlock ABI version rather than the kernel version
-- 
2.53.0

