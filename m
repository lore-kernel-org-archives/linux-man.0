Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=100.103.45.18
ARC-Seal: i=3; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794963356;
	b=bimZjXvMV3enIqBRD8bkIQ8MZs6c3FM77kRkdWIoJTlat1fZsEn3BQk4KeD1hob471dA
	 Y2GRvWWmdjVeSXMRUHs+pbV17IvOOeVkPACIBZnj0RGz49X37KWCwMPx4Uoe/8FXCmYxm
	 OW/t6Zkh46vmTc2OjnCAJ2LLpEhm+QDzCslX0RbjUB1ScvIt7HHhdS1VdR1wjpDsuonAh
	 qiekxwqFA9r0vVglReWx7gFUSyJoskcAQ5hepF+a1kFL+RQipNudPvzexb45hk37SbGtx
	 J01+VEk66G6SW3GyrXZfWH9LX0Hd7X9qprTG0PJ/ZJ5Rkvj7Q+90E65XMNfhgcbtaYg==
ARC-Message-Signature: i=3; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794963356;
	h=Received:Resent-From:Resent-Date:Resent-Message-ID:Resent-To:
	 Received:X-Envelope-To:Received:X-Mizu-Trace-ID:X-Migadu-Flow:
	 X-Spam-Score:X-Migadu-Queue-Id:X-Migadu-Scanner:X-Migadu-Spam-Score:
	 X-Migadu-Country:Received:Received:Received:DMARC-Filter:
	 DKIM-Signature:Received:X-MC-Unique:X-Mimecast-MFC-AGG-ID:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:
	 X-Mimecast-Originator:Content-Transfer-Encoding:content-type:X-TUID;
	bh=uP0T8kPi+7saDxFfp1MVK7nrMHpuLNMsuiVr7gaVB08=;
	b=LOtYaIyYKpBD+TY/N3oW6WnDFUeTAJr0ijjmXQItYCigbNtPGQ9LuS+hivbq82GNUmtq
	 nBMVDMN8huJwh/qoaNYzgKg2VJ9VO9so/LvLQ7Yzb6sm7tHPmS8zINpuQ4lrbImYjkPt+
	 kXYoEsbhNjFGE7BBK21Wo6YS0x8mZRP5dS8P0YLIOO+XNHtaakH8QCxCRLZVZRBNnrOFl
	 W1h9xIm7AseqF+tlGjWlaDP4LY08FLCr9WvRVYCmB+SUZ2rcAS3pqZEuHzfh14mREotK8
	 KKULQseIeZvetQ5YETh74tuM8jNBw+XCDTtkSs1crk/V4N+ZCFG3gXUvSyzy7OfoBtg==
ARC-Authentication-Results: i=3; smtp.subspace.kernel.org; 
	dkim=fail reason="signature verification failed" header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aRnpLftr;
	arc=fail smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A449606A31C
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 00:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aRnpLftr
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392811F000C4
	for <linux-man@vger.kernel.org>; Wed, 18 Nov 2026 00:55:55 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aRnpLftr
Resent-From: Alejandro Colomar <alx+linux-man@kernel.org>
Resent-Date: Wed, 18 Nov 2026 01:55:52 +0100
Resent-Message-ID: <avz3mAaBTdBsjaaq@devuan>
Resent-To: linux-man@vger.kernel.org
Received: from mizu1.migadu.com ([135.125.171.180])
	by soraStorage0.migadu.com with LMTP id nl6hzmsuetagbm2j642a
	for <foss@alejandro-colomar.es>; Tue, 17 Nov 2026 16:11:30 +0000
X-Envelope-To: foss+linux-man@alejandro-colomar.es
Received: from tor.source.kernel.org (172.105.4.254)
	by mizu2.migadu.com with ESMTPS id cb0ec14718ee4b46;
	Tue, 17 Nov 2026 16:11:30 +0000
X-Mizu-Trace-ID: cb0ec14718ee4b46
X-Migadu-Flow: FLOW_IN
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
	d=alejandro-colomar.es; s=key1; t=1794931890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=uP0T8kPi+7saDxFfp1MVK7nrMHpuLNMsuiVr7gaVB08=;
	b=SICdTkORg00M95Wu/iY2vBhafUn3QXhuPm5wltwH5MvITGyLaprTxW+lZzxxbdGwegNwS5
	K9M0gWNrl7uy2ML0+xxKadd5xZYGgoHG/wtf0FLiSAVNXPawKatxL+qgjw6K+6fzgSR1Li
	GdekqIu7xRekKce392U5YYuhlymB9sRDK9e9CQkS12UH8KzcjrzyPJGFIGnT65c5wNW4WF
	diD8tNyBW/hs83I+Y9v2WGVs/CHM9hRhZzHQPnETOJakPw23S7Wyve/F1s6rQD+rhrpXUK
	APKSWSPP4Bs9TE40N5SlyzReFMmnSFJZ2SD58Wkhv4qiuaXDqaOAfN2BGQ+j+w==
X-Spam-Score: -6.50
X-Migadu-Queue-Id: cb0ec14718ee4b46
X-Migadu-Scanner: mx13.migadu.com
Authentication-Results: mx13.migadu.com;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=aRnpLftr;
	arc=pass ("kernel.org:s=arc20260519:i=1");
	spf=pass (mx13.migadu.com: domain of "SRS0=BWT8=JG=redhat.com=patsy@kernel.org" designates 172.105.4.254 as permitted sender) smtp.mailfrom="SRS0=BWT8=JG=redhat.com=patsy@kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com
X-Migadu-Spam-Score: -6.50
ARC-Seal: i=2; s=key1; d=alejandro-colomar.es; t=1794931890; a=rsa-sha256;
	cv=pass;
	b=K8l+c/VzE8DMRWJYP94me9iZtwvIyBVIJmsIKL08zwtvn9iGq5yznlAEZbze9+kSg6eS85
	ejd7Nq4UXSeyIi0UGSI+6g0dmt3QVLbxqyo/+uy5YUPzu/z76ulNoFtokcsWqxxH6bpPQs
	eSk5a3JJNCsAKvXILxjyYPPq1s0dRlkSzptKReNS6F8X0a7Xl9rD0n94YISMFI2z7WwGvs
	anLcU3mO3ct+345Ikk5SkljoEccXQEc7I02PAvx0RaqKs8Ff2svDxgKR/CvmcneVx9y+oQ
	nUKAD7O7Kf3foNIZCEkqF7s6FkgMwPK6t5sLgZgyOGMsHjydP4zHiYrymue9/w==
ARC-Authentication-Results: i=2;
	mx13.migadu.com;
	dkim=pass header.d=redhat.com header.s=mimecast20190719 header.b=aRnpLftr;
	arc=pass ("kernel.org:s=arc20260519:i=1");
	spf=pass (mx13.migadu.com: domain of "SRS0=BWT8=JG=redhat.com=patsy@kernel.org" designates 172.105.4.254 as permitted sender) smtp.mailfrom="SRS0=BWT8=JG=redhat.com=patsy@kernel.org";
	dmarc=pass (policy=quarantine) header.from=redhat.com
X-Migadu-Country: SG
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D1EF061185
	for <foss+linux-man@alejandro-colomar.es>; Tue, 17 Nov 2026 16:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix)
	id 9EEE21F000C4; Tue, 17 Nov 2026 16:11:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794931888;
	b=NSL5dqQY15eHAgfD409lBQsHlwyeQW6lDU4Dqtx398jkGz8rMhU0+lQfn4QQ2miSmyrc
	 MoyCN7wh/vs8cWgBniIaJa0o01B0LEvzxc1og4MDiFDP1yVpSpt/J3ht2D1Ow+zYZBuPC
	 PW0tVFio6Y5FH8DA/5o7y4CCA5S0mt5tuqaFW8CUwlSBDi3DbxoPxHh+hH5ukpixtwPTg
	 nOx5iOB8MnNdjCO9TLesD5dkt2CeClXu7AHDKTdpcMQvMSTMjHPmiXIGFPvc7ABwvjvPF
	 lVFg+uAAiGxS4elW7FCkClqU9U1oFP8K5T9DiSPsYwoWnNXBV+qd73KBM+57YwultJg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794931888;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Mimecast-Spam-Score:
	 X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Transfer-Encoding:content-type;
	bh=uP0T8kPi+7saDxFfp1MVK7nrMHpuLNMsuiVr7gaVB08=;
	b=B8ZgCEZf0YL0/EK9F6SIeNclQDptWOsjPSK6z9LYR4gyeFjFtYsazRN711uXJgbinyKF
	 oJ7wwNHZObVecyNSX3bJmlKuSIV5h3XTzKTHhaHvaBJqSKRjMzdxVL1/x8Tko2JIu2dQT
	 83u5d4LzLDBdlotvye09ef1jumhC0TE61YmJw0WNEKxYckDqecoJAEPvh3EsVsuiyzvkT
	 u3aDF6ubpdIvBjWuVchK8wEZYPQlKJXK1RJIIfuBiXTANvJD21uw+EE9RmPJOqDOO43Gi
	 jrqt3NsiKRuUtf262xSzYpQoqocjHFuxCFqve7D8jPk/UNvfmQhyy9bHxU0BrtU/wtw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aRnpLftr;
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	arc=none smtp.remote-ip=170.10.133.124
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8B111F000C5
	for <alx+linux-man@kernel.org>; Tue, 17 Nov 2026 16:11:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.kernel.org A8B111F000C5
Authentication-Results: smtp.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794931886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uP0T8kPi+7saDxFfp1MVK7nrMHpuLNMsuiVr7gaVB08=;
	b=aRnpLftrGQqXCO4bPQ5mOmztG/+hynmnyZ5Z6RlOPlhAMbuCIveZJ4O0UiXly9lh26zS2Y
	hSM+ajloN49fmAoPg7P/pKqOdMDSFgGoJajqtJl8ZBbzUurxfBv4DykPHfCwDdj62EgDPL
	NnxuZnEM/eNx3pEsQx6Ha7/86otw+CM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-418-hd56YqnzPGq7XRGAsbAAZA-1; Tue, 17 Nov 2026 11:11:25 -0500
X-MC-Unique: hd56YqnzPGq7XRGAsbAAZA-1
X-Mimecast-MFC-AGG-ID: hd56YqnzPGq7XRGAsbAAZA_1794931885
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-92106c98714so12152136d6.3
        for <alx+linux-man@kernel.org>; Tue, 17 Nov 2026 08:11:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794931885; x=1795536685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uP0T8kPi+7saDxFfp1MVK7nrMHpuLNMsuiVr7gaVB08=;
        b=17mbVf2sDNG5kGh0CL4x6VVDy3dP15TYyIg20mv3UNDf61Qg2EMsVil5oJ+aRBIab2
         yx27LpYv4ch04K/9EW9GyaALer65lz1cb23g7H+U++JE/l/Ye5UCthaQ7oAi2qSzX4sF
         15uMssUM63YdLYMYdSTNsS487qeMW26FUmYTwd6rnS0RAMSN7i6TTjH/HdsiCBvYs8k2
         tER+WteSoVWbbOVYo8HZGHM4UxmfJdBzuNI0jgG28FIkrqYSPb5AkgnKtZ/RVuFRoj/Y
         zMCHMlarAx0wkp9ZYH3c7/DhV5pRJQrn5xd3FvjkLQnXH90pTz20AD8EhXmZHMfnBRQD
         Z/tA==
X-Gm-Message-State: APuU4Z8qZ9kbr44tEu30A+H84eYvIX42IK8UaX6nSwenxRHO/DddqwkD
	gY19dK1GdhsKmxlm4QtE0FIG8LX0Qwmo7iGkPEq6tmJWejfFmpCrm/C0NAEAKIhLzK3FksmuQbC
	81raQzyNgEFcjtb8F+dDmCUPdNN2fbLOzwtfQrrZyuC+p4wozbN4zQqLYnnUIWic3rVRb+Pc0nW
	GP/53CmAZuO0uPocrKq+DdhWuG5gyGMfJ0SQh/rxDI
X-Gm-Gg: AZFdTZfbpSnRmisI/GVlotigbu/rW8nnBrjZzAKwgYl13u1Qa6cyQiWrDAgYauA2SZm
	kVGMwhz+NRyjhb/otBuy1d6k+NiBLUC3mCbGP5anqjgBlzDIuxSgpf4+Ef5/FOwnlei8cLConT7
	Z3fvfQ1cpF8gVGYl21GeVxySNLUDcA6Ei/YQ1jXX6ganf7al/TqbQLeWwX0puaC4rLMh4uWTkP1
	agu6h4zF65Zl74IMRVuQE2qU5TWYzRAQrSvVGkDvcih5eploxKY6P4txC9035zGkZA0acA7PcoD
	OgfDsPycnaS+todoKG/pkDWUHpm51m18SY9wNi6CQznuSsMifVbjC1xHrpk2CrC3KcdlQKvzYyn
	NWc/XG8nI6z4s/iERaHq0jS5RHoYaaSNnYGdsHe/nFN2e7D+/REUQFBdYvPrp5vqT5y5lDt8Goa
	xvD0V9XQ==
X-Received: by 2002:a05:6214:2429:b0:921:e08:1d9d with SMTP id 6a1803df08f44-9210e08441emr20614256d6.49.1794931884507;
        Tue, 17 Nov 2026 08:11:24 -0800 (PST)
X-Received: by 2002:a05:6214:2429:b0:921:e08:1d9d with SMTP id 6a1803df08f44-9210e08441emr20613486d6.49.1794931883767;
        Tue, 17 Nov 2026 08:11:23 -0800 (PST)
Received: from pfrankli-thinkpadp16vgen1.redhat.corp ([2601:189:4700:15df:930e:dbbe:96f5:854f])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d5e579sm113638776d6.17.2026.11.17.08.11.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 08:11:22 -0800 (PST)
From: Patsy Griffin <patsy@redhat.com>
To: alx+linux-man@kernel.org
Cc: linux-man@vger.kernel.org,
	codonell@redhat.com,
	fweimer@redhat.com,
	Patsy Griffin <patsy@redhat.com>,
	Carlos O'Donell <carlos@redhat.com>
Subject: [PATCH] man/man7/credentials.7: Mention potential SELinux impact on credentials
Date: Tue, 17 Nov 2026 11:10:46 -0500
Message-ID: <20261117161046.2037417-1-patsy@redhat.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-man@vger.kernel.org
List-Id: <linux-man.vger.kernel.org>
List-Post: <mailto:linux-man@vger.kernel.org>
List-Help: <mailto:linux-man+help@vger.kernel.org>
List-Subscribe: <mailto:linux-man+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-man+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-man+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -TUXlvRwGfba9WnJIXxTtusQbdxkcqZO6EjtSA3PVmo_1794931885
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-TUID: XEHmgscCTuA6

An SELinux context may impact traditional credential access control.

Link: <https://bugzilla.redhat.com/show_bug.cgi?id=884625>
Cc: Florian Weimer <fweimer@redhat.com>
Cc: Carlos O'Donell <carlos@redhat.com>
Signed-off-by: Patsy Griffin <patsy@redhat.com>
---
 man/man7/credentials.7 | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/man/man7/credentials.7 b/man/man7/credentials.7
index b538b1702..21e42ec30 100644
--- a/man/man7/credentials.7
+++ b/man/man7/credentials.7
@@ -335,6 +335,12 @@ is carried through to all of the POSIX threads in a process.
 See
 .BR nptl (7)
 for further details.
+.P
+Credentials may also be impacted by Security-Enhanced Linux (SELinux),
+if enabled.
+See
+.BR selinux (8)
+for further details.
 .SH SEE ALSO
 .BR bash (1),
 .BR csh (1),
@@ -386,4 +392,5 @@ for further details.
 .BR system_data_types (7),
 .BR unix (7),
 .BR user_namespaces (7),
+.BR selinux (8),
 .BR sudo (8)
-- 
2.56.0

