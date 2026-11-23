Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795423958;
	b=3YoRYtIa57BSebKUQrWaHhtAsBYZ4/oyWeCs/pyIHaAh9oiEsrXfEVoumdKrwkQWFbGc
	 p+/8D8fxDflZYRB1q1Isli04shDXKJeOHg4URFbBnk8p6P4p5CIeHXkvziazTQOSzmIjc
	 UH7vjftuk9ZFsOVquS4gFp9QZF/41GsyIxRVXRfXPluwjlcdzCFlQaOPjS+cLyCd+FVK9
	 fjqsV5R3HD63hwvI+muM0Nci6nLbCN4z7GyCFBgNKkW1Lz6gBh1JKSXeQ1/7oSlZTU5Xt
	 n+EEWeuBZbXst8bHOxozjkgvwnG1gFZJHAOrQ5ZlANuoFefxhJ7zr1vEPykcLEZvz+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795423958;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=LtN7iZoEtGFSFqg59Il0O89rNPHVtffr1dutJcdRl8g=;
	b=h7ws+8ml6jXD1OcIqohyFgYi56/lCl71OLtYuqt+BT0miFJMZx4MOWuvA8WiyGPSmrTN
	 8rD0oQX+QkqHzGfqNf8OomEP5c8NeSJC9j0Gyfd30rMefl6sOzHgrplFwSDTbbqANqXgH
	 CmTaA9O4wMky8Wxh0g5ytYoyOnMgBrZA8YKLLnsi91yuqoDkYzSAtqsaqlFQJnkRsHbgX
	 TXqYZKGEQ9pXlsO5Yf5qRJnBzyfYpTSnLPaJwa2fiGEpXDKjhw625R4Aucevvc3n7Ygb5
	 4XkpVjyUJFWuhN+1X8rKeyb3/XIyD5f2U3GR4K6i0JYmRtLC6KRKHTUHRRNURXWJIjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXWfMfPl;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7B20606A31A
	for <linux-man@vger.kernel.org>; Mon, 23 Nov 2026 08:52:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7B20606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UXWfMfPl
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c513a854320so500458566b.0
        for <linux-man@vger.kernel.org>; Mon, 23 Nov 2026 00:52:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795423956; x=1796028756; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LtN7iZoEtGFSFqg59Il0O89rNPHVtffr1dutJcdRl8g=;
        b=UXWfMfPltejKZnmZxR9Cmpi1Y1x6CYl4ajjK7A6b6bJXS5uObawylUTJMKZWgZA7O3
         y0oz+Ddr4tCsZPyJ1X6ss6sZ5got3KhRGPkjis65hIo1MGhkM9H2UJkAJKjQQnC8asWz
         +iu5KoKSJyttPBXVKv48wPQ0q1HTTlxop2MxMmHVIgEXJbijqxWelWemmukkC4+LyH8m
         v2RCBEh4WDLKSIFGRVPFjXNeOLLVK+xbb7RjqArsRyWI6ZYOofiTo8q+14vYUkXpg4+U
         b07gP1C13d2fEcIMynbLdfEdNJwgtnPAjhJuaEtdVYDdcnc/TQ8efdNaJqOSGgnFJxHa
         TJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795423956; x=1796028756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LtN7iZoEtGFSFqg59Il0O89rNPHVtffr1dutJcdRl8g=;
        b=n+J1BQ3evUaTA27jxZY6sDUhs/CV28/FAyG+50BdAfe6u/4PHy5LN0Mv02t5LEu3SP
         E5epQpvog1x/oZMjACdg+dhr2+6oY05jnrIgHe8Bl8HH1RdxTFgv9Ds/9KuaZPaePaDH
         FdNBRcXtvaGg8qxCINeoTKx4YV0dbxHuZU5qGzcVFAqKNwObfMk8/7X3/nbN9nDUZFQ4
         PaxyLxrIMm/g5hsrZqyndpxBswHjO+P4libGVZS6MbbCHuv+mOLoGIkwpg2c9BPkiWMp
         /jOG7n3yDosfv280cBjNxZ8KebeQkH+rJsn2oxhCJ6bKyuZo4Bju6PX4LLV80D2WMQB5
         ZzoA==
X-Forwarded-Encrypted: i=1; AL+hErF9p0fyavJ8TtjZxB/cwjKZaurq01njjb3F+hdTF30FKorDuUjZCFiYIVqp+U0UHKh2Jhh+CDwnu0o=@vger.kernel.org
X-Gm-Message-State: APuU4Z9/mk1f2YN5GipiYZNpCOaURevMzZBrwQ2BmrczJZVkBeFdYoTv
	8PYS83Ta4+S3VM7VRij1k2BIRebRQblaNz2QdjLNKw0VsKYlRcLsct26
X-Gm-Gg: AZFdTZeM/HxD7IjwupOO7AUT5PUt16aahPNTyte75BZTweEnpUfwwlGwNeFjeffVOHr
	yhm9IT33PRMZe5i5sci9ohUT9XFYYznv+5VfjQY5AW9oGFOOi5gTWjPeZv8E3I+/pvF2xoKDLsk
	2HZdQR+RRGOZP5SEHb0q0XNWfntC+F4s3cWB02NhZd+SdAUIsKbSKTERUiV+Kl0btSdBeTUdKCO
	D+qkwtbBDyXPxZbp1vrTqwshvDcfHtgWqnz621RUTJP3tanP1xjg4GUQehDm92Xc8XHgupZR6ho
	odEr3SYK3OucyCRPN9RHT6RuIklUJjyKVj/eezqpZuF4Jiqosgm4NYy/oHPxd2mDEFi5VC/cpXL
	9dwLgsZDKk+7buiMHiMSEBOeDq6GuIdW7ReqZ9MEaQEobB/wC6PmmV+FfXlBWzsRGLhf69ZpmbL
	RY8GlkWkxYhXCA5xlUTes6XkxApTghZMZLDMDlet7EudYPcnrnguLloQ5x+WweCVH1SyMxknWRZ
	TY+L5oH0oFMF1WNGHknxAQGBBczIJl3tsqT/rShIWFePBamUK1HqCqK1zs5UpKUbYv0jpCJqLko
	mRAQ4pKMGNcgs0R150xfyhr5oYMdW7Z9NzbCcog6TR1PyOUnCbn97Ycku8LOsSb6aUzGUtYy5bu
	Mod4UnjvDb30=
X-Received: by 2002:a17:906:1ed1:b0:c51:2fb:a039 with SMTP id a640c23a62f3a-c513a850365mr708667366b.12.1795423955909;
        Mon, 23 Nov 2026 00:52:35 -0800 (PST)
Received: from localhost (178-84-201-199.dynamic.upc.nl. [178.84.201.199])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b022b2bsm379328266b.83.2026.11.23.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:52:35 -0800 (PST)
From: Amir Goldstein <amir73il@gmail.com>
To: Alejandro Colomar <alx+linux-man@kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>,
	Jan Kara <jack@suse.cz>,
	Christian Brauner <brauner@kernel.org>,
	linux-man@vger.kernel.org
Subject: [PATCH] man/man?/fanotify*: Fix release version of mount namespace events
Date: Mon, 23 Nov 2026 09:52:34 +0100
Message-ID: <20261123085234.1879489-1-amir73il@gmail.com>
X-Mailer: git-send-email 2.56.1
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

The mount events were added in kernel v6.15 not in v6.14.

Fixes: 4c4d9f0f5148 (2025-04-04; "man/man?/fanotify*: Document mount namespace events")
Signed-off-by: Amir Goldstein <amir73il@gmail.com>
---
 man/man2/fanotify_init.2 | 2 +-
 man/man2/fanotify_mark.2 | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/man/man2/fanotify_init.2 b/man/man2/fanotify_init.2
index c84de7ea1..1f1b5e7f1 100644
--- a/man/man2/fanotify_init.2
+++ b/man/man2/fanotify_init.2
@@ -332,7 +332,7 @@ that the directory entry is referring to.
 This is a synonym for
 .RB ( FAN_REPORT_DFID_NAME | FAN_REPORT_FID | FAN_REPORT_TARGET_FID ).
 .TP
-.BR FAN_REPORT_MNT " (since Linux 6.14)"
+.BR FAN_REPORT_MNT " (since Linux 6.15)"
 .\" commit 0f46d81f2bce970b1c562aa3c944a271bbec2729
 This value allows the receipt of events which contain additional information
 about the underlying mount correlated to an event.
diff --git a/man/man2/fanotify_mark.2 b/man/man2/fanotify_mark.2
index a3b77537c..bb8e45c74 100644
--- a/man/man2/fanotify_mark.2
+++ b/man/man2/fanotify_mark.2
@@ -101,7 +101,7 @@ If the filesystem object to be marked is not a directory, the error
 .B ENOTDIR
 shall be raised.
 .TP
-.BR FAN_MARK_MNTNS " (since Linux 6.14)"
+.BR FAN_MARK_MNTNS " (since Linux 6.15)"
 .\" commit 0f46d81f2bce970b1c562aa3c944a271bbec2729
 Mark the mount namespace specified by
 .IR path .
@@ -413,7 +413,7 @@ is required.
 .TP
 .B FAN_MNT_ATTACH
 .TQ
-.BR FAN_MNT_DETACH " (both since Linux 6.14)"
+.BR FAN_MNT_DETACH " (both since Linux 6.15)"
 .\" commit 0f46d81f2bce970b1c562aa3c944a271bbec2729
 Create an event when
 a mount was attached to or detached from a marked mount namespace,
-- 
2.56.1

