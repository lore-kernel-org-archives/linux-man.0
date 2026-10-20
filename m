Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792461166;
	b=WWrybfESPIoYb2jntSeocfiVBaAkNu0hVSoHrYXp037snCpPlRKXQl2j2EZrOG2wQvaY
	 TWkzK03MYSpgxnItUTeViTbifUWtokXqyF6o5EebZs7SzA3NzpZDUOA3CDUjiOZeNB5nI
	 LTEm2nlpGSp7CiHzpMFlSQkjlq7tKl/0L4ODJJdzSz7jePGsLgB1yPtUbZjMBBA/wzAKK
	 OcVrpkXnsr0xPp7kFhDCM4pX5zEX8kmCkLUMiZ1DBEB2oZLUj+rN7Cf22QpyS7V9Co2Zv
	 XmAdAXdSGzUWCPKkavwY14Cp+QCAJkrXIHX7VSk11X0JkkMITWmfHzRq5H0jZZNDmQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792461166;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=gVXgpupGFRFCkoFhy1m+ZCfg7q/+uWSsyTjpOxdgFhA=;
	b=WsRhh2ndhBi4EkCDuEL+LOBJcBZC+AbLR6ohmzLuVNx0UZy2HAvuoq3f36E/rnzGKE/b
	 Z98TWwMZ5eNnIWgu8ZOtoQhrvCANw2kyc0L5a5ubigYJwoIqHCMsi21b9CpBdieJ9lCXu
	 JpMhTEg/nvJAs0f5Rp4ClOSVqbommEfuEHAQd780qMAsH+EM8hgBjMeMfY4HBrQoE34l+
	 /jN6qKUXvR9okEWlFrDlIqLFq3o44eO1mn1firGQ3rN3wxn38l/rvWcl9Utj1dtOuQqVI
	 DK38qiwuwsbuqc23vHeiosIMQXMYZWLwXXpjTtFIKtzVJcDI0MHuIL8WxMVgL9I0VbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fQBoHhpD;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D506606A31A
	for <linux-man@vger.kernel.org>; Tue, 20 Oct 2026 01:52:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D506606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fQBoHhpD
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-3282db206d3so4693139eec.0
        for <linux-man@vger.kernel.org>; Mon, 19 Oct 2026 18:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792461165; x=1793065965; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gVXgpupGFRFCkoFhy1m+ZCfg7q/+uWSsyTjpOxdgFhA=;
        b=fQBoHhpDNYAXFKeKoU0z4O72X47vd4J9BG6xPvcd3PE53UcoLk/rtWkeHljPaZF5ll
         3iV+cHhBBwGr12ajBxVEgYx1HCElD0XRdOYU4zAS3yC4mKmDnuactjbzMh8QEBtjtiGN
         Z7+9jFTrvPk+IN5GDd4Jbty9kmCDs0lvUu90UlxwnBxYZrp7sTU6+/uXpnuUbEo3CyQa
         wJahN2qzzq0y1PFu5pgec3k6Ko0mOS6u3PufTFrMajUfBnxC+pehDNbSc2sbKickStqq
         qPUjrVNDV8mbKvzrthZlo/3K2z8VzEzDBbRATNRakzVcKaZpihawY/6H06AXorEL4HJh
         HUjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792461165; x=1793065965;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gVXgpupGFRFCkoFhy1m+ZCfg7q/+uWSsyTjpOxdgFhA=;
        b=Dysq5kdxv235glqhickrPST7XABkOkr/RKQtSGBUUeG9vov3/hA6CcNIag3tKOd0AS
         7dI28GbETZsPJ7uWZjp/xV6jFPAnlxI0USNfeZ3MCJrz5qTSq4qR0AYmXrDx0FeavSyG
         1L6zALEcu+qMrkZ8oj/p023zfe0ff9xSGDnTxGDBchFmvSvZiySLKwFylmW9Fllt0spP
         FusFOdSEAdQK8VqKkj2BAVk6ZXNXMJ3DiwXQM7HnsNM5vdOZZMBPBlReWjb4Ae3Iivuf
         mVZFtghyxUbS4608c+/oqfeGqkrf4akhu1c437iiU2wq4edC5X7B51L4mNIrMw+fMrvr
         jdfw==
X-Gm-Message-State: AFq9FYIja3STXYYBOBsF3dLYzLF/UMgFCw50lNNC+ekbY3/OQsAQh5lh
	+sjGFTvk7aeITQT+VUmYNOBvogMcQQ+JIJ0+FccUWed0M1S7/UFUckq4yzH/MUD73Bc=
X-Gm-Gg: AYBFou1ka0ult5VYS8QDRLTYt2BFLBusONqK7QxZv0y3J5B4Fx39e7TIKXm++m2k60b
	u5nH9ECIlunP6bFRjnVCvo5HflFlsRWx7uGqMtb2T05ov8nlHjG2a2A+qZSpmMFNic+qIOphPhn
	QRxNdFTmCAU0/5xaz1UehmKiSGdlwM65tgs+kKzyXgriCI1LNx3C4iMoe3pgBEQhE4B7UpylEbo
	ZKGhuCSfAdrq0RAxxWt9jy8TAcOHVYnCZUT7qO8k9jxD22ELUJtqGd3V9ggHKPuJ6Hb2hZ7yIH/
	tF6JkAQj41kGNfV0Sm94cCR5LfnJqdojPA936a6VsrxioZ1Y19RiDZPs73a/DOrXexnRq0SkFDi
	O8AcIl+Zymwej/wjxpkM+FkK7EISbtZgRHGEjsBkCDEti0Ll+JTaZ84YSYiIwoG2PHXe/6POsMY
	4QYl8wz/lqzF44Y93bskx2ahE4c2H16GYClEElHrbiA5QPvx9I/OEym2hkA9FheUsTJZfTSYO9z
	pdlr+2owTCdUYyW1FcWEIEP2VkgpQ==
X-Received: by 2002:a05:7300:e9c9:20b0:359:6382:5e52 with SMTP id 5a478bee46e88-361a2053878mr15132944eec.17.1792461165317;
        Mon, 19 Oct 2026 18:52:45 -0700 (PDT)
Received: from Legion5 ([144.39.120.39])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36632d8b273sm871428eec.15.2026.10.19.18.52.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 18:52:44 -0700 (PDT)
From: Grayson Tinker <graysontinker@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Grayson Tinker <graysontinker@gmail.com>
Subject: [PATCH] man/man5/tmpfs.5: Specify that noswap may not be used within unprivileged user namespaces
Date: Mon, 19 Oct 2026 19:51:12 -0600
Message-ID: <20261020015112.127389-1-graysontinker@gmail.com>
X-Mailer: git-send-email 2.55.0
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

Since the tmpfs noswap option was added, the kernel has disallowed its use while
within an unprivileged user namespace for security reasons. Document this restriction
so users do not believe noswap to be available in every situation.

ref. linux.git 01106e140835ff94fdef79d66f166b87b0c89824 ("shmem: restrict noswap option to initial user namespace")

Signed-off-by: Grayson Tinker <graysontinker@gmail.com>
---
 man/man5/tmpfs.5 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/man/man5/tmpfs.5 b/man/man5/tmpfs.5
index 10acbdcfa..a904db2c8 100644
--- a/man/man5/tmpfs.5
+++ b/man/man5/tmpfs.5
@@ -109,6 +109,10 @@ but not a % suffix.
 Disables swap.
 Remounts must respect the original settings.
 By default swap is enabled.
+.IP
+.\" commit 01106e140835ff94fdef79d66f166b87b0c89824
+.B noswap
+is not available while within an unprivileged user namespace.
 .TP
 .BR mode =\f[I]mode\f[]
 Set initial permissions of the root directory.

Range-diff:
-:  --------- > 1:  b3b2becca man/man5/tmpfs.5: Specify that noswap may not be used within unprivileged user namespaces
-- 
2.55.0

