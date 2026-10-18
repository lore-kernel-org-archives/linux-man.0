Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 041673DA5B0
	for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 17:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792345053; cv=none; b=gWNwtkM0csUPGYOgCu3LIOsOuijrM3HRWcJkbe49Oq/pa5KUq2HwPVUSjOREd8KFqpjlJQT3cGgXtWuagwLSGSkNT/PKjknelqnfHm7YC/FANhDxsFW3PlEqOkrOHRoQ5KPXx3npffzvtdxzEEFs5NyJMzqmDiRa70ZFUDxhBfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792345053; c=relaxed/simple;
	bh=ahGPuF1k2WQmfym/qCP/Rf5ulMexUkgquYG5H6RMcyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VSS5Y58lU4zmp489L7SiYOfyv7uEAfejSK/FN0zp18XcjbCQqEnnJXpZG4A+i+JNqmRrAL7u7Ow+b7pQ+cUaR1IHllwPzzryAkqwCfOfqHxjKrGBfbzzR/+KbrnylyTyKM44xudPY8UKlmKfug6eHdwyMCnBJLl4GkT2hEBycUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVOeZAzb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVOeZAzb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48de6a62a4cso1092882f8f.2
        for <linux-man@vger.kernel.org>; Sun, 18 Oct 2026 10:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792345050; x=1792949850; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=92bRwauvWS1Wiep4S/svafinlQfXfVMdNwxbdBe3rZ8=;
        b=fVOeZAzbtHV/GOxJ9egLlNxHHh5rdwlge9Fr2kAkirBS8RGjw3riP7j+8FCVQLLtYu
         VSGUi71shmlkGHqE8B4CXgqQG3KkwPwQfe17QpZyJ/s8T2gy9VuZYEgXQriHny9tDtsN
         HEmwI9sTAV0h1DRZl3kOn6GLpxFucfCyTQLUPWjSnRaHBCh/LWpIwbykW1xLXwh+lO9R
         o8f84RS4ZBAQ4xuC1aCZS4LUoAK+BP5+18UcduUTCRCILwzp2fAmFbAuJAJ27eAW0x1C
         W/DhrP5soG0btkLUHrvaWovs5GX0l2hc85IOWjzTv8aTG36mASiCwlBM22hv7UJWdxgp
         24mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792345050; x=1792949850;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=92bRwauvWS1Wiep4S/svafinlQfXfVMdNwxbdBe3rZ8=;
        b=0hv6e4ylYDmHL686O4v4kv8oUvo4iqg72/3XLnYLSDPEtG6gcIYfJKIAHIIBQU/m9O
         Rtf65LUMnXG+rfYjFOZ8dAXoBmjgqgLwAIs2LfQk3F3/T0YHhdipiGipLiNSXuit6CIr
         i9E5TW1NErgN2kylNaJmIqc9ci1O0XbyxDBYup9ecv9+Jp9gEpYu/s9GfNld5X97q6Dr
         y+NnY3mXj8XKkdT/EvdnzdXHGWEBuAVvE05bdVrxZG5wX1x2hu+tE7d/paKXFnrf2AsN
         A9Xhks2QaJk2RUEtbgDbpRgUO2Fkhg8f00FimKL35gkRCux9AIapXaONLBUNhBwukr5d
         a94w==
X-Gm-Message-State: AFq9FYIFSQPBwEH7TGoUWiyvtFP5wV7Zzdxtn86AjZ2+M2mvda7oTLEa
	7YEnPd9iUV4XjCvM9X0KAZGivff2MTnWCdT9fhueU/BeWbB0LJ/j7FPy0jOO18W3
X-Gm-Gg: AYBFou1OgzFomveVws6tmoQZiTcED4WJe4m0mx2GCljBhjsVBsxDlxl4gtVyGjbb8qF
	DF2aVSbiQ6FWNCMo2r3U2kMLuxhggHucxJz6na9IQYithSE7dv0JFE/Ei2W+Danxw9aO+T+JKc1
	1KwzrbOnTzIHcxOzriC3vGxKFoAWYEl/ww9pZSSkZeT8xbT1ZzIIXVaqMONokxzsy5ewZlHna3V
	KUpYKgi/h1rEaRBB2O+h6Bcya7M++l6ULuuXGeAOumH1Diy/CddmbzoCccCs9tLKZC8to0coZgk
	ru6WpAiGjwyidHDAQb+z/W6zBAuOcveEo818iSpxxAN12k+rLsRzFiqBTEmxTiG+iQwJPuO12Lo
	FTEcEQtacxlPpI5XFzmDLveLVJThzzueTwTgkHq+Uzrm3pzF5MA+qxrOBk8bDOAIERmYpLFQjGZ
	5ICsnxuS5drkyI0ZptRWsxUoOztoZFKnwIOGzhraNfmbvr6CY8mt3Rqc5PxnpUZl29bNA5dVsOw
	JtvteIf7iOBbhRCH73P/xF7g1VUGKqcfA==
X-Received: by 2002:a05:600c:1d10:b0:4a1:6992:f861 with SMTP id 5b1f17b1804b1-4a1d75ce2e7mr120537405e9.1.1792345050091;
        Sun, 18 Oct 2026 10:37:30 -0700 (PDT)
Received: from localhost (ip87-106-108-193.pbiaas.com. [87.106.108.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1c8ce32absm147754435e9.1.2026.10.18.10.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:37:29 -0700 (PDT)
From: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack3000@gmail.com>,
	Jon Maloy <jmaloy@redhat.com>
Subject: [PATCH v2 08/24] man/man7/socket.7: SO_PEEK_OFF: This option is no longer specific to unix(7)
Date: Sun, 18 Oct 2026 19:36:56 +0200
Message-ID: <20261018173712.27670-9-gnoack3000@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261018173712.27670-1-gnoack3000@gmail.com>
References: <20261018173712.27670-1-gnoack3000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
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

Cc: Jon Maloy <jmaloy@redhat.com>
Assisted-by: LLM
Signed-off-by: Günther Noack <gnoack3000@gmail.com>
---

Notes:
    Double checked in code -- this feature has been added to these other
    protocols since that man page section was written; I made sure that we
    have all relevant commits listed as comments in the man page source.

 man/man7/socket.7 | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/man/man7/socket.7 b/man/man7/socket.7
index 96f6f173a40b..ebe0264d7ae4 100644
--- a/man/man7/socket.7
+++ b/man/man7/socket.7
@@ -662,14 +662,24 @@ For more information, see
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
+.\" commit f55bb7f9cb82dec2f2e803d7bd0fc5929248e4d8
+.BR unix (7)
+sockets since Linux 3.4,
+.\" commit 627d2d6b550094d88f9e518e15967e7bf906ebbf
+for UDP sockets since Linux 4.7,
+and for TCP sockets since
+.\" commit 05ea491641d338422edbd87af3b311c16ea762f5
+Linux 6.10 (IPv4) and
+.\" commit be9a4fb831b8b6dc5724dd3e61973ea91b413ec1
+Linux 6.12 (IPv6).
+.IP
 When this option is set to a negative value
 (it is set to \-1 for all new sockets),
 traditional behavior is provided:
-- 
2.56.0

