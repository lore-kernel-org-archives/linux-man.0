Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=49.12.115.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793061513;
	b=W9KLHaLsnEhaiV6ksx1Hq1OwEq1w3TVPU43eSpTJSX5GusD+M2E26YwRM6yVh7PV06M7
	 Ym/1diINoFMRw4ZVSD++L48DGKWvmR2jS4Jz5XVPCt9rW8kYH/1ccXsTu7Sa5m/PebPX7
	 zogj8Zs6uycdPYTMn5gHjoTG6GoJdMnSRnOJ72RqlVVno6+0LczSUMNTuFmSEs/Durbx6
	 sNJ3CBPjUFIb38WtViKa3QG4BgBYvS6s2sZoFfP7cZQbd+FmYvY7IUlgz+1IgFKHUjf+s
	 EeMcniDW3CdFSySjV6rsRWybBZVDzsFsE7gUHyR03uBnoyPuANitJ6GceUfFN8AIl3A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793061513;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=TKv8LN4h6Nb4RQaLAoZqZwPI9rGnB4Cb1mMjtOW7ekM=;
	b=sHPSB8DWkz69K/J7Ly+BHjVPkoKBkWyLRnEiqGp+/fzv7/tElWvZ4BMOGvrnvkd+xmzH
	 5MvfTXIihDVTH2CTfXY3SeZ6ERFz52ddrQgaYGIX6lKmHPAEosNvhSfKTdGJvQDv0HHDi
	 hSs+diK7C/sZ7+IIF28bSdP+fT9tViTuf8fjIFwRspvwFTAR0ndYiMp2qrdZU3p1/ZXqx
	 Pc8PXjV4PXydPSSY8/PjRwgdGiSiHRM7/SvDt7ruxRXjlSizUamrA75LYnEyesGA07kqv
	 DK/iv53Eq4ejaV8cw/WEK+HFRKbj1T3b6Wp5Wa6EuU3U4lcR010kLlUcLVmlG1cSArw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gms.tf;
	spf=pass smtp.mailfrom=gms.tf;
	dkim=pass header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=h28kbHwe;
	arc=none smtp.remote-ip=49.12.115.177
Received: from turing.lru.li (turing.lru.li [49.12.115.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE1F606A31A
	for <linux-man@vger.kernel.org>; Tue, 27 Oct 2026 00:38:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8CE1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gms.tf
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gms.tf
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=gms.tf header.i=@gms.tf header.a=rsa-sha256 header.s=2023100216 header.b=h28kbHwe
Received: from framework.lru.li (unknown [IPv6:2001:1a80:303a:0:d79e:ed35:3024:7b6b])
	(Authenticated sender: georg)
	by turing.lru.li (Postfix) with ESMTPSA id 59412626AEEC;
	Tue, 27 Oct 2026 00:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 turing.lru.li 59412626AEEC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gms.tf;
	s=2023100216; t=1793061505;
	bh=TKv8LN4h6Nb4RQaLAoZqZwPI9rGnB4Cb1mMjtOW7ekM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h28kbHweZa7lVKR60vNDEYPiuYIxjr1d7vfJZhFf7tAKo2T9JUfeU07od6aHUSMNe
	 rBQmm6brZNglmjVaMFnMlgdRSmvOThXE+Qi1z94tjoOiGSptqBnANw7ovhSFubTk09
	 mBXD+6ByiNniKAPdVZnDkaYutgOE1rwep/85aceY=
Received: by framework.lru.li (Postfix, from userid 1000)
	id 9CC15BABFFB; Tue, 27 Oct 2026 01:38:24 +0100 (CET)
From: Georg Sauthoff <mail@gms.tf>
To: Alejandro Colomar <alx@kernel.org>
Cc: linux-man@vger.kernel.org,
	Georg Sauthoff <mail@gms.tf>
Subject: [PATCH v2 2/2] man/man2/adjtimex.2: Add error for clock_adjtime
Date: Tue, 27 Oct 2026 01:37:12 +0100
Message-ID: <20261027003712.905789-3-mail@gms.tf>
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

The ERANGE error can be verified either via trying to adjust the
frequency of a PHC by a value that is outside of [-X,X],
where X=`cat /sys/class/ptp/ptpX/max_adjustment`,
or via checking the kernel source code:

<https://elixir.bootlin.com/linux/v7.2.2/source/drivers/ptp/ptp_clock.c#L164>

Signed-off-by: Georg Sauthoff <mail@gms.tf>
---
 man/man2/adjtimex.2 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/man/man2/adjtimex.2 b/man/man2/adjtimex.2
index 5b9a0667b..6b6ee98b0 100644
--- a/man/man2/adjtimex.2
+++ b/man/man2/adjtimex.2
@@ -537,6 +537,12 @@ .SH ERRORS
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

