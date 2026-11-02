Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793605462;
	b=Wj61DFmMeJMuSUYyjIT2lPITLvxAjBi0sngcc9xmvV8UWADTlY/W7K73+cfEFQDCkqp5
	 5uztIvFk5nP4MMR8myWx8EBYjaxpLwb21oaQaeDp2aR0tFvfdOSGpP52Ajqzx6LqZmaaD
	 /vbQ5zyw2ungdcHQRpIIagJtxa6tH51FPPVVMisqZg4cyGFAC36CWKg3Tb/ldFxNbB/ay
	 lzpjQdd7zbfPKQGHT6Fcm5EvWYXAis5IdDGntxaO9njuiMHU7Q68zrXjT0q7h1aMl0UK8
	 mSyan1sr0PcBmOaW0NJOnODNyB1587Ear2ufXQg2NDN/A39rfmI3ElPH2UgEHWSb5Fw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793605462;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
	b=J2aQOEQpLqJS1yxmEIhVNbiEVFbF3k7FPZpumgIKbzVTH/P36p9pIycmb7c+saf6fRC2
	 Mbps1kSpVsQvD2au6tulSrx+Reoe1Kjsgq2shWPxWMeqlxPk14+zd16/8z7dPFcyhmNNT
	 L5mOPNu7mM12U0uw+RG2R2FJXXagkN8JCvnhoMFz+m3ylhNo1HvLoZ+XwZlqrrbJURMfV
	 uwizgbaykx4NpjbOeUzZXS6X5VKZU6P7gPnZjKeFWZQY8sjAN3/VLu9gOuUiq7hhkFYU+
	 fTpIzvasMdK72soNkO37HAE47oa7TW6JGgJKubwmVCjL3GH95znXgrv5N70rPxgoR7Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeLZFuY6;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD7F606A33D
	for <linux-man@vger.kernel.org>; Mon,  2 Nov 2026 07:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7CD7F606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QeLZFuY6
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso1543813f8f.2
        for <linux-man@vger.kernel.org>; Sun, 01 Nov 2026 23:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793605461; x=1794210261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
        b=QeLZFuY6mIhG5rzjWO62mDesKo0jmIC+d12Httjn5kyoXafH5D2vvtFeUt40Vry7WS
         m34GzWAdpIRf8fdu4MqLLqQ4UBO5jbUVcSc5aj6KsNB/tK1vo4ffHQGnPr10MZoMPDiz
         IOmXiiPcmjbGg+rPF4qbqZvL3WqrdHND3PeC8ZQ8XVVIj2Qe8mFARNngJRFbpzkp4DIz
         i3oLbHSVB7/AMa2Q+kixbii2k1XlYcnonfs62EueJka30Y+0vJQsmM2lIUWGYYPWxTIS
         yUY0fqONZh76OqmB2NtlbMiAe+YAQqduPeD3+n5AdqAQb3wDt52BmrOHMkThaZg5S1ac
         uKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793605461; x=1794210261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KUnvJpVPViW69AF9NkZWmBblFWCE3alugKf4rSddKS0=;
        b=Ns3iq25h7g5i69oK+T0PSNggoHUPcU7wCqxOWR2o1t13oKoZXgkv4VFiIp9RvjyLAd
         YgTixCTJR7AWFuEAslA/nlO41lmhv+Pvx8Gdyb5fsMJ/mzBeHthBk+HLspJDIkdRw86b
         UFbmewasq6+TNgmdkbgX6e74fd7/nm8eOAuyKjSY5apFDoXzPAImAoqzCQU0Uy3Zs+AD
         2UA4Bn4PfZibCAEiSMpY3kNhD/bLFyCkUSGkvljx4lSJEbonIjobfdkQu4uPrsKtPjYZ
         vOJSfKUVz4ioCvz1IrkgASHwZWfu8SaXRPhTutmu/unw7fQ0C/uZv0DnGYxEuKy5j3VZ
         52wQ==
X-Forwarded-Encrypted: i=1; AKwUvByoUQShaFIJb0pFzACuyOKppML9r3s2kOAJ0qxhHBEC7hknTN+5ZSCmht7WAsqHR+wF61XXft8qkXA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+dvrD0mhOIQmLidCWvqcLnYXYRdBHNFvSzfldq7stg6nFkLmmK
	9uuYwvTPlwGVFqN6n/czuDSc1zrvszZN3p9q2i4vGV2HfdyOJNl9+TtK
X-Gm-Gg: AYBFou0gyqQKxnLA7pdh+HkITMd6oBLHcx+SrfFrFep7MPGro0dqqXjE7c/qnhLHiy9
	ktlvkEhhVxUx03q0gpCxeK8qq2aPdm7aYXa9ElWgmD5wmStQeKh2FrBrZSCguY8Tg7kYTC+BPqc
	acC07YlL3X1oVhdk4vbY35nuOcHeqLs8qFaAQOl07JsBmpSdFMjqleWz9QAddcx3gJ4xGCpvcT/
	pJ7livx8NacFetkosi7wGu0uqKF3KFqmA01fnwiRJn3OfpL5snTVTkqtf8tIkQob+Ri9D6q3486
	0+w8PaoXni7ArnRp4mZbRmwqdrpUHmZKmldnaIoMHJ1X/uleHipWBlOmUZHQZLJdgGAd/QOOkPO
	/f357E+k//WD2PJnWI/s7+bIWWuBeRPDFvoCu4uy+bVaeNnIGbzrMcoJ40rFLTbHxwN6gTooBCD
	3iM1vHfxjYaPqJqGMsNentpkgbnQhf5Ik2zw/RSnoigA73CnpvqKfR0GH2ien+3zlJHiGVArieW
	VXQ1qqO85KevMmK4i7J6a4tehuZG81bY1RVeslF9/555enMHTc0pvSe75CFT0GDKV8+P1SvBBVM
	CIPLqEpUxH31SQ==
X-Received: by 2002:a05:6000:310f:b0:48d:f95e:6e8 with SMTP id ffacd0b85a97d-48e6e2c3586mr19528998f8f.1.1793605460880;
        Sun, 01 Nov 2026 23:44:20 -0800 (PST)
Received: from nobara ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b81c74sm18050374f8f.36.2026.11.01.23.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 23:44:20 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	David Hildenbrand <david@kernel.org>,
	Shuah Khan <shuah@kernel.org>
Cc: Vlastimil Babka <vbabka@kernel.org>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	ts930@dgu.ac.kr,
	alx@kernel.org,
	linux-api@vger.kernel.org,
	linux-man@vger.kernel.org,
	"Jose A. Perez de Azpillaga" <azpijr@gmail.com>
Subject: [PATCH RESEND 1/3] mm/mlock: make a zero length request a no-op whatever the alignment
Date: Mon,  2 Nov 2026 08:43:59 +0100
Message-ID: <20261102074412.189554-2-azpijr@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102074412.189554-1-azpijr@gmail.com>
References: <20261102074412.189554-1-azpijr@gmail.com>
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

A zero length mlock() or munlock() at an unaligned address is rounded up
to a page, so mlock(addr + 5, 0) locks a page that was never asked for,
and munlock(addr + 5, 0) unlocks one the caller may still rely on.  An
aligned zero length is already a no-op.

Return early for a zero length, before the rounding and before
can_do_mlock().  This is a uapi change: with RLIMIT_MEMLOCK=0 and no
CAP_IPC_LOCK, mlock(addr, 0) returns 0 instead of -EPERM, which is what
munlock(addr, 0) already returns.  man 2 mlock does not say what a zero
length should do, and -EINVAL would break callers that pass one today and
get 0.

Reported-by: Park Tae-sun <ts930@dgu.ac.kr>
Link: https://lore.kernel.org/all/179066531783.50175.13377521828379196177@dgu.ac.kr/
Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 mm/mlock.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/mlock.c b/mm/mlock.c
index 1c70a7829394..673a8433a0a9 100644
--- a/mm/mlock.c
+++ b/mm/mlock.c
@@ -612,6 +612,9 @@ static __must_check int do_mlock(unsigned long start, size_t len,
 
 	start = untagged_addr(start);
 
+	if (!len)
+		return 0;
+
 	if (!can_do_mlock())
 		return -EPERM;
 
@@ -678,6 +681,9 @@ SYSCALL_DEFINE2(munlock, unsigned long, start, size_t, len)
 
 	start = untagged_addr(start);
 
+	if (!len)
+		return 0;
+
 	len = PAGE_ALIGN(len + (offset_in_page(start)));
 	start &= PAGE_MASK;
 
-- 
2.56.0

