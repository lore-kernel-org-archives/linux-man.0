Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.104.147.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792933053;
	b=MttOGaOJkXP9nioAXQv6vEdkmqfFaqq3iStjcssMo5UtL1BTazUlOAZuBxi8PMtdzu1a
	 tUUvfTLnQZI/thNEJg+mJiqdKOKJu9qSI4mZqBHxMQH0jbtiqaRqTWOW2xVEjVsSJD9wZ
	 1jxX7lZgiyqzMk1GqihINDQ4LDFuk7cleiHTLUiLLGCTa4BI0RkMTnG3Iu9pXMltxOKy3
	 +Btmw0SfCDrn3fYSHpxaulQb4FduZlhzx7LDiM3abESKB6crlqiaHSd0T4psXJ+pX7iI2
	 iOTFWIZjxB7b23IFGt1WWTPU7XkD7HUyJLMOIUy4RaHW4MyiN5IPUvLp2mIkY0EEL5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792933053;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=296e1i5t3QevOoEP4x8Ui+tSK5qeQ+xFLw/5bOLnL0s=;
	b=u1MVEy/ZRlbDNNvhroxs7w2fZ9Qml2J0T5XBaFbqpgXF09v+MZrJRjnI6w3o09Oc52Rm
	 08yL6/aOCHGSXCgkpQmL9ktge96SEtMcKHgZBDF2Ca/IvQJi4xYxQUEbBk8LR+9/tGoHc
	 BFNCV5qgE86vOfgBy/BzTyzfewsaZ990K54K2QPpEqOUXKzhOcWkPzhORcrQCU9lsQZ3z
	 1syn3GgYWZUXIZdXtKDl55NUnVwZ6PiKxRKnh9GLF525jE3dABwlGbZ347M5IwuyBnNkG
	 ZIe9/ZctC1wz5yKVNraZ1a1SUSHkP8tz8Tydsc5keHaSgTI8pLAFFU99emfOCRZn0GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gms.tf;
	spf=pass smtp.mailfrom=gms.tf;
	dkim=pass header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=1gemRW40;
	arc=none smtp.remote-ip=172.104.147.125
Received: from goedel.lru.li (goedel.lru.li [172.104.147.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC9F606A31A
	for <linux-man@vger.kernel.org>; Sun, 25 Oct 2026 12:57:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BEC9F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tf
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=1gemRW40
Received: from framework.lru.li (unknown [IPv6:2001:1a80:303a:0:d79e:ed35:3024:7b6b])
	(Authenticated sender: georg)
	by goedel.lru.li (Postfix) with ESMTPSA id 26B12633305A;
	Sun, 25 Oct 2026 12:57:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 goedel.lru.li 26B12633305A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gms.tf;
	s=2023100216; t=1792933045;
	bh=296e1i5t3QevOoEP4x8Ui+tSK5qeQ+xFLw/5bOLnL0s=;
	h=From:To:Cc:Subject:Date:From;
	b=1gemRW40E+zQFWdqIm8KgRnPFHt3oiE9XyVLp5KvJTDv/Yy78qjoSqmnfRZqspy9x
	 hnY6WywE1bXH9qx2LIqLHz0WofcerqsbsNPIJUhhh5zIVbF9YaZYx5p33oWrd6gqSD
	 MT/8UvjMqzPZOSEncPo6EbISEihfgSPQZxA7509Y=
Received: by framework.lru.li (Postfix, from userid 1000)
	id 8FD14BABC2E; Sun, 25 Oct 2026 13:57:24 +0100 (CET)
From: Georg Sauthoff <mail@gms.tf>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Georg Sauthoff <mail@gms.tf>
Subject: [PATCH v1] man/man2/adjtimex.2: Add include, macro and error for clock_adjtime
Date: Sun, 25 Oct 2026 13:56:56 +0100
Message-ID: <20261025125656.877530-1-mail@gms.tf>
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

GNU libc declares clock_adjtime() when including time.h, and not when
just sys/timex.h is included, iff support for GNU features is requested.

Verification:

    $ for i in BLAH _GNU_SOURCE; do for j in sys/timex.h time.h; do echo -n "Testing $i and $j ... "; echo -e '#define '"$i"'\n#include <'"$j"'>\nvoid f(){clock_adjtime;}' | gcc  -xc - -o /dev/null -c 2>/dev/null && echo OK || echo FAIL; done; done
    Testing BLAH and sys/timex.h ... FAIL
    Testing BLAH and time.h ... FAIL
    Testing _GNU_SOURCE and sys/timex.h ... FAIL
    Testing _GNU_SOURCE and time.h ... OK

(Test output is from a Fedora 43 system)

The ERANGE error can be verified either via trying to adjust the
frequency of a PHC by a value that is outside of [-X,X],
where X=`cat /sys/class/ptp/ptpX/max_adjustment`,
or via checking the kernel source code:

<https://elixir.bootlin.com/linux/v7.2.2/source/drivers/ptp/ptp_clock.c#L164>

Signed-off-by: Georg Sauthoff <mail@gms.tf>
---
 man/man2/adjtimex.2 | 22 ++++++++++++++++++++--
 1 file changed, 20 insertions(+), 2 deletions(-)

diff --git a/man/man2/adjtimex.2 b/man/man2/adjtimex.2
index f12d9413e..528fd3a6f 100644
--- a/man/man2/adjtimex.2
+++ b/man/man2/adjtimex.2
@@ -17,9 +17,21 @@ .SH SYNOPSIS
 .P
 .BI "int adjtimex(struct timex *" "buf" );
 .P
-.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
-.P
 .BI "int ntp_adjtime(struct timex *" buf );
+.P
+.BR #include <time.h>
+.P
+.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
+.fi
+.P
+.RS -4
+Feature Test Macro Requirements for glibc (see
+.BR feature_test_macros (7)):
+.RE
+.P
+.BR clock_adjtime ():
+.nf
+    _GNU_SOURCE
 .fi
 .SH DESCRIPTION
 Linux uses David L.\& Mills' clock adjustment algorithm (see RFC\ 5905).
@@ -534,6 +546,12 @@ .SH ERRORS
 Under Linux, the
 .B CAP_SYS_TIME
 capability is required.
+.TP
+.B ERANGE
+The frequency offset supplied with
+.BR clock_adjtime ()
+is outside of the range clock clk_id supports.
+See also /sys/class/ptp/ptpX/max_adjustment when adjusting a PTP hardware clock.
 .SH ATTRIBUTES
 For an explanation of the terms used in this section, see
 .BR attributes (7).
-- 
2.55.0

