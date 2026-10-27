Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=172.104.147.125
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793061502;
	b=CGEfESQBPqib1LroXE96wVrHvqleoOjwH/KqYwA4aBenKwt68LER5KQ+wK0QGA3+KZPj
	 +jJiZcgNNwIcjS59nzvSNNYUNhJufmHpxtVpDgii6QLZ15HaP+nCrpf4n5n5z1vr6dHtg
	 WUkcvuY/fQ7FTiGmtCVdffhZ5oyJ3BRsMgE/rVxDxFMT40yqeFYasrh/9kjUHKaBqegnv
	 TXWSHusyvtX28SVQU2xX3CFLg+AKpPn38Wk0Jiw1aNwAU21B22D6m50bheaud7QVl3y6K
	 czdoRmIGaz02pebj+JUdKd/HgyBOb8TG7Ued6Auj21ltTQQUbne9xIu6f2jw5KjC1UA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793061502;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7in1cAa+fflmZixAsOwkuGNJeQE0tVxyfFc2f0Q9i24=;
	b=pOQxW5g+dDNCTzw1IfSBgaOXANbHS3Jm1c5sP+Ppb2XoA5ZJBUesDwwfcbLTHaSNpEGG
	 r/KiFozxRa4VHJNQiPdrBBI4Tg7LvFAsis2rdxom71E/eOji1Ga5JLM5++BmZNffBUqmy
	 BZstJN/oow0hloMAvd9CYp7pIp2dcjII70HUiMRQX2Xr2fDHKrxftmU8hUzcDRqOnlA8/
	 vAmRhHF1qlw8GoQsuwE7AJsmFv+wVKP/CUYwTKlaMssiNg+CNZ38udXj5NmAUrCHLfnDc
	 EDPA4k9Hb71WyxKjJmY4idh8AD6jRFVouS3KpzYp7+c884Ll1dekZb5A8P6Koi/azCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gms.tf;
	spf=pass smtp.mailfrom=gms.tf;
	dkim=pass header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=J7ZDOseV;
	arc=none smtp.remote-ip=172.104.147.125
Received: from goedel.lru.li (goedel.lru.li [172.104.147.125])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F71606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 00:38:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 51F71606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tf
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=J7ZDOseV
Received: from framework.lru.li (unknown [IPv6:2001:1a80:303a:0:d79e:ed35:3024:7b6b])
	(Authenticated sender: georg)
	by goedel.lru.li (Postfix) with ESMTPSA id E8402634C2FD;
	Tue, 27 Oct 2026 00:38:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 goedel.lru.li E8402634C2FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gms.tf;
	s=2023100216; t=1793061500;
	bh=7in1cAa+fflmZixAsOwkuGNJeQE0tVxyfFc2f0Q9i24=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J7ZDOseVT+N7g3dH8gldVyBRNj1TZKLn4ajJOD7gsnkOmo1X6LqI78IHRwwMgsh8V
	 tgEQnSu5Ule/KNy1n4NEfNerKTiVD9oYY6Ckl4PZT8pW1hZ0h097lxB7o4jxllnTml
	 ShpUAsJVzO1V2qqK9G1cAm3q8WZDp/JM5V1jKlns=
Received: by framework.lru.li (Postfix, from userid 1000)
	id AA7FBBABFF9; Tue, 27 Oct 2026 01:38:20 +0100 (CET)
From: Georg Sauthoff <mail@gms.tf>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Georg Sauthoff <mail@gms.tf>
Subject: [PATCH v2 1/2] man/man2/adjtimex.2: Add include and macro for clock_adjtime
Date: Tue, 27 Oct 2026 01:37:11 +0100
Message-ID: <20261027003712.905789-2-mail@gms.tf>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261027003712.905789-1-mail@gms.tf>
References: <20261025125656.877530-1-mail@gms.tf>
 <20261027003712.905789-1-mail@gms.tf>
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

Signed-off-by: Georg Sauthoff <mail@gms.tf>
---
 man/man2/adjtimex.2 | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/man/man2/adjtimex.2 b/man/man2/adjtimex.2
index f12d9413e..5b9a0667b 100644
--- a/man/man2/adjtimex.2
+++ b/man/man2/adjtimex.2
@@ -17,9 +17,12 @@ .SH SYNOPSIS
 .P
 .BI "int adjtimex(struct timex *" "buf" );
 .P
-.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
-.P
 .BI "int ntp_adjtime(struct timex *" buf );
+.P
+.BR #define\~_GNU_SOURCE "  // See feature_test_macros(7)"
+.B #include <time.h>
+.P
+.BI "int clock_adjtime(clockid_t " clk_id, " struct timex *" "buf" );
 .fi
 .SH DESCRIPTION
 Linux uses David L.\& Mills' clock adjustment algorithm (see RFC\ 5905).
-- 
2.55.0

